  METHOD send_invoice.

    DATA: lv_error                  TYPE c,
          lv_number                 TYPE char7,
          lv_invoice_number         TYPE zarete_dbs_t016-partial_invoice_number,
          lv_partial_invoice_number TYPE zarete_dbs_t016-partial_invoice_number.

    DATA: lt_t015_create TYPE TABLE FOR CREATE zarete_dbs_dd_t015,
          lt_t015_update TYPE TABLE FOR UPDATE zarete_dbs_dd_t015,
          lt_t016_create TYPE TABLE FOR CREATE zarete_dbs_dd_t016,
          lt_t016_update TYPE TABLE FOR UPDATE zarete_dbs_dd_t016.

    DATA(lo_send) = NEW zarete_dbs_sc_finteo_api( ).
    DATA(lo_log) = zarete_dbs_cl_log=>get_factory( ).

*Eldeki alanlar kullanılarak fatura yaratma metoduna verilmesi gereken alanlar beslenir
    IF ct_invoices IS NOT INITIAL.

      SELECT t015~uuid,
             t015~invoice_number,
             t015~id,
             t017~net_due_date,
             t017~amount_in_transaction_curr,
             t017~transaction_currency,
             t017~customer,
             t012~company_identifier,
             t013~partycode
        FROM zarete_dbs_t015 AS t015
        LEFT OUTER JOIN zarete_dbs_t017 AS t017 ON t017~document_reference_id = t015~invoice_number
        LEFT OUTER JOIN zarete_dbs_t012 AS t012 ON t012~bp_no = t017~customer
        LEFT OUTER JOIN zarete_dbs_t013 AS t013 ON t013~identifier = t012~company_identifier
                                               AND t013~limitid    = t012~limit_id
        FOR ALL ENTRIES IN @ct_invoices
        WHERE t015~invoice_number EQ @ct_invoices-invoice_number
        AND   t015~id EQ @ct_invoices-id
        AND   t017~customer EQ @ct_invoices-customer
        AND   t012~company_bank_code EQ @ct_invoices-bank_code
        INTO TABLE @DATA(lt_send_details).

*Kısmi fatura tespiti
      SELECT *
        FROM zarete_dbs_t016
        FOR ALL ENTRIES IN @ct_invoices
        WHERE invoice_number EQ @ct_invoices-invoice_number
        AND   id EQ @ct_invoices-id
        AND   amount IS NOT INITIAL
        INTO TABLE @DATA(lt_t016_partial).

      SORT lt_t016_partial BY invoice_number partial_invoice_number DESCENDING.

    ENDIF.

*Ekrandan gelen seçili satırlar için tek tek Finteo fatura yaratma metoduna istek atılır
    LOOP AT ct_invoices ASSIGNING FIELD-SYMBOL(<fs_invoices>).

      READ TABLE lt_send_details ASSIGNING FIELD-SYMBOL(<fs_send_details>) WITH KEY invoice_number = <fs_invoices>-invoice_number
                                                                                    customer       = <fs_invoices>-customer.
      IF sy-subrc EQ 0.

        DATA(lv_invoice_total) = REDUCE #( INIT amount TYPE zarete_dbs_de_finteo_amount
                                           FOR ls_invoices IN ct_invoices
                                           WHERE ( invoice_number = <fs_invoices>-invoice_number )
                                           NEXT amount = amount + ls_invoices-amount ).
*Ekranda parçalan fatura tutarı belgenin tutar değerinden yüksek olmamalı
        IF lv_invoice_total LE <fs_send_details>-amount_in_transaction_curr.

          SELECT SUM( amount )
            FROM zarete_dbs_t016
            WHERE invoice_number EQ @<fs_invoices>-invoice_number
            INTO @DATA(lv_send_total).

          lv_send_total += <fs_invoices>-amount.

*O anda gönderilecek fatura tutarı daha önce aynı fatura no ile gönderilmiş olan tutarlarla birleştirildiğinde
*belgenin tutar değerinden yüksek olmamalı
          IF lv_send_total LE <fs_send_details>-amount_in_transaction_curr.

*Gönderilmek istenen faturanın daha önceden aynı fatura numarası ile gönderilmiş aktif bir tutarı varsa yanına kısmi kodu eklenmelidir
            READ TABLE lt_t016_partial ASSIGNING FIELD-SYMBOL(<fs_partial>) WITH KEY invoice_number = <fs_invoices>-invoice_number
                                                                                     id = <fs_invoices>-id.
            IF sy-subrc EQ 0.
              IF <fs_partial>-partial_invoice_number IS INITIAL.
                lv_invoice_number = <fs_invoices>-invoice_number && '-01'.
              ELSE.
                SPLIT <fs_partial>-partial_invoice_number AT '-' INTO DATA(lv_inv) DATA(lv_partial).
                lv_partial += 1.
                lv_invoice_number = lv_inv && lv_partial.
              ENDIF.
              lv_partial_invoice_number = lv_invoice_number.
            ELSE.
              lv_invoice_number = <fs_invoices>-invoice_number.
              lv_partial_invoice_number = ''.
            ENDIF.

            DATA(lv_due_date) =  <fs_send_details>-net_due_date+0(4) && '-' &&
                                 <fs_send_details>-net_due_date+4(2) && '-' &&
                                 <fs_send_details>-net_due_date+6(2).

            lo_send->upload_invoice(
              EXPORTING
                iv_bankeftcode    = CONV string( <fs_invoices>-bank_code )
                iv_partycode      = <fs_send_details>-partycode
                iv_identifier     = <fs_send_details>-company_identifier
                iv_amount         = CONV zarete_dbs_de_finteo_amount( <fs_invoices>-amount )
                iv_invoicenumber  = CONV string( lv_invoice_number )
                iv_invoiceduedate = lv_due_date
                iv_currencycode   = CONV string( <fs_send_details>-transaction_currency )
              RECEIVING
                rv_upload_invoice = DATA(ls_result)
            ).

*Gelen başarı mesajı ve dbsinvoiceid alanına istinaden oluşan faturanın detayları
*dbsinvoiceid kullanılarak sorgulanır
            IF ls_result-status EQ 'OK' AND ls_result-data-dbsinvoiceid IS NOT INITIAL.

              DATA(lv_startdate) =  <fs_send_details>-net_due_date+0(4) && '-01-01' .
              DATA(lv_enddate) = lv_due_date.

              lo_send->get_invoice(
                EXPORTING
                  iv_startdate         = lv_startdate
                  iv_finishdate        = lv_enddate
                  iv_dbsinvoiceid      = ls_result-data-dbsinvoiceid
                RECEIVING
                  rv_invoice           = DATA(ls_invoice)
              ).

*Gelen satır ilgili fatura ve finteo faturaları tablolarında yaratılır ya da güncellenir
              IF ls_invoice-status EQ 'OK' AND ls_invoice-data IS NOT INITIAL.

                IF <fs_invoices>-id IS INITIAL.
                  create_number_range_interval( IMPORTING ev_error = lv_error ).
                  IF lv_error NE abap_true.
                    get_number_next( IMPORTING ev_number = lv_number ).
                    <fs_invoices>-id = lv_number.
                  ENDIF.
*                ELSE.
**Eğer aynı fatura no, aynı id ile aynı bankaya daha önce gönderilen aktif bir fatura varsa
**yeni gönderimde yeni bir id üretilmeli
*                  SELECT COUNT(*)
*                  FROM zarete_dbs_t016
*                  WHERE invoice_number EQ @<fs_invoices>-invoice_number
*                  AND   id EQ @<fs_invoices>-id
*                  AND   bank_code EQ @<fs_invoices>-bank_code
*                  AND   amount IS NOT INITIAL
*                  INTO @DATA(lv_count).
*                  IF sy-subrc EQ 0.
*                    create_number_range_interval( IMPORTING ev_error = lv_error ).
*                    IF lv_error NE abap_true.
*                      get_number_next( IMPORTING ev_number = lv_number ).
*                      <fs_invoices>-id = lv_number.
*                    ENDIF.
*                  ENDIF.

                ENDIF.

                LOOP AT ls_invoice-data ASSIGNING FIELD-SYMBOL(<fs_data>).

                  SELECT SINGLE *
                    FROM zarete_dbs_t016
                    WHERE identifier     EQ @<fs_data>-identifier
                    AND   dbs_invoice_id EQ @<fs_data>-dbsinvoiceid
                    INTO @DATA(ls_t016).

                  IF sy-subrc EQ 0.

                    APPEND INITIAL LINE TO lt_t016_update ASSIGNING FIELD-SYMBOL(<fs_t016_update>).
                    <fs_t016_update>-Identifier                  = ls_t016-identifier.
*                  <fs_t016_update>-DbsInvoiceId                = ls_t016-dbs_invoice_id.
                    <fs_t016_update>-DbsInvoiceId                = ls_result-data-dbsinvoiceid.
                    <fs_t016_update>-Amount                      = <fs_invoices>-amount.
                    <fs_t016_update>-DueDate                     = <fs_data>-duedate.
                    <fs_t016_update>-LastPaymentDate             = <fs_data>-lastpaymentdate.
                    <fs_t016_update>-PaymentDescription          = <fs_data>-paymentdescription.
                    <fs_t016_update>-StatusCode                  = <fs_data>-statuscode.
                    <fs_t016_update>-StatusDescription           = <fs_data>-statusdescription.
                    <fs_t016_update>-%control-DueDate            = if_abap_behv=>mk-on.
                    <fs_t016_update>-%control-LastPaymentDate    = if_abap_behv=>mk-on.
                    <fs_t016_update>-%control-PaymentDescription = if_abap_behv=>mk-on.
                    <fs_t016_update>-%control-StatusCode         = if_abap_behv=>mk-on.
                    <fs_t016_update>-%control-StatusDescription  = if_abap_behv=>mk-on.
                    <fs_t016_update>-%control-DbsInvoiceId       = if_abap_behv=>mk-on.

                  ELSE.

                    APPEND INITIAL LINE TO lt_t016_create ASSIGNING FIELD-SYMBOL(<fs_t016_create>).
                    <fs_t016_create>-Identifier                           = <fs_data>-Identifier.
                    <fs_t016_create>-DbsInvoiceId                         = <fs_data>-DbsInvoiceId.
                    <fs_t016_create>-Id                                   = <fs_invoices>-id.
                    <fs_t016_create>-Amount                               = <fs_data>-Amount.
                    <fs_t016_create>-CurrencyCode                         = <fs_data>-CurrencyCode.
                    <fs_t016_create>-DueDate                              = <fs_data>-DueDate.
                    <fs_t016_create>-InvoiceNumber                        = <fs_invoices>-invoice_number.
                    <fs_t016_create>-PartialInvoiceNumber                 = lv_partial_invoice_number.
                    <fs_t016_create>-InvoiceAmountDue                     = <fs_data>-InvoiceAmountDue.
                    <fs_t016_create>-LastPaymentDate                      = <fs_data>-LastPaymentDate.
                    <fs_t016_create>-PartialGuaranteedAmount              = <fs_data>-PartialGuaranteedAmount.
                    <fs_t016_create>-AmountRemainingBeforePaymen          = <fs_data>-AmountRemainingBeforePayment.
                    <fs_t016_create>-PaymentDescription                   = <fs_data>-PaymentDescription.
                    <fs_t016_create>-StatusCode                           = <fs_data>-StatusCode.
                    <fs_t016_create>-StatusDescription                    = <fs_data>-StatusDescription.
                    <fs_t016_create>-TransactionDate                      = <fs_data>-TransactionDate.
                    <fs_t016_create>-DbsAccountId                         = <fs_data>-DbsAccountId.
                    <fs_t016_create>-PartyCode                            = <fs_data>-PartyCode.
                    <fs_t016_create>-PartyTitle                           = <fs_data>-PartyTitle.
                    <fs_t016_create>-PartyTaxNumber                       = <fs_data>-PartyTaxNumber.
                    <fs_t016_create>-BankCode                             = <fs_data>-BankCode.
                    <fs_t016_create>-BankName                             = <fs_data>-BankName.
                    <fs_t016_create>-%control-Identifier                  = if_abap_behv=>mk-on.
                    <fs_t016_create>-%control-DbsInvoiceId                = if_abap_behv=>mk-on.
                    <fs_t016_create>-%control-Id                          = if_abap_behv=>mk-on.
                    <fs_t016_create>-%control-Amount                      = if_abap_behv=>mk-on.
                    <fs_t016_create>-%control-CurrencyCode                = if_abap_behv=>mk-on.
                    <fs_t016_create>-%control-DueDate                     = if_abap_behv=>mk-on.
                    <fs_t016_create>-%control-InvoiceNumber               = if_abap_behv=>mk-on.
                    <fs_t016_create>-%control-PartialInvoiceNumber        = if_abap_behv=>mk-on.
                    <fs_t016_create>-%control-InvoiceAmountDue            = if_abap_behv=>mk-on.
                    <fs_t016_create>-%control-LastPaymentDate             = if_abap_behv=>mk-on.
                    <fs_t016_create>-%control-PartialGuaranteedAmount     = if_abap_behv=>mk-on.
                    <fs_t016_create>-%control-AmountRemainingBeforePaymen = if_abap_behv=>mk-on.
                    <fs_t016_create>-%control-PaymentDescription          = if_abap_behv=>mk-on.
                    <fs_t016_create>-%control-StatusCode                  = if_abap_behv=>mk-on.
                    <fs_t016_create>-%control-StatusDescription           = if_abap_behv=>mk-on.
                    <fs_t016_create>-%control-TransactionDate             = if_abap_behv=>mk-on.
                    <fs_t016_create>-%control-DbsAccountId                = if_abap_behv=>mk-on.
                    <fs_t016_create>-%control-PartyCode                   = if_abap_behv=>mk-on.
                    <fs_t016_create>-%control-PartyTitle                  = if_abap_behv=>mk-on.
                    <fs_t016_create>-%control-PartyTaxNumber              = if_abap_behv=>mk-on.
                    <fs_t016_create>-%control-BankCode                    = if_abap_behv=>mk-on.
                    <fs_t016_create>-%control-BankName                    = if_abap_behv=>mk-on.

                  ENDIF.

                  SELECT SINGLE *
                    FROM zarete_dbs_t015
                    WHERE invoice_number EQ @<fs_invoices>-invoice_number
                    AND   id             EQ @<fs_invoices>-id
                    INTO @DATA(ls_t015).

                  IF sy-subrc EQ 0.

                    APPEND INITIAL LINE TO lt_t015_update ASSIGNING FIELD-SYMBOL(<fs_t015_update>).
                    <fs_t015_update>-InvoiceNumber          = ls_t015-invoice_number.
                    <fs_t015_update>-Uuid                   = ls_t015-uuid.
                    <fs_t015_update>-Id                     = ls_t015-id.
                    <fs_t015_update>-statu                  = <fs_data>-statusdescription.
*                    <fs_t015_update>-DbsInvoiceId           = <fs_data>-dbsinvoiceid.
*                    <fs_t015_update>-DbsAccountId           = <fs_data>-dbsaccountid.
                    <fs_t015_update>-IsCancelled            = ''.
                    <fs_t015_update>-%control-statu         = if_abap_behv=>mk-on.
*                    <fs_t015_update>-%control-DbsInvoiceId  = if_abap_behv=>mk-on.
*                    <fs_t015_update>-%control-DbsAccountId  = if_abap_behv=>mk-on.
                    <fs_t015_update>-%control-IsCancelled   = if_abap_behv=>mk-on.

                  ELSE.

                    APPEND INITIAL LINE TO lt_t015_create ASSIGNING FIELD-SYMBOL(<fs_t015_create>).
                    <fs_t015_create>-InvoiceNumber            = <fs_invoices>-invoice_number.
                    <fs_t015_create>-Id                       = <fs_invoices>-id.
                    <fs_t015_create>-ScenarioType             = '120-102'.
                    <fs_t015_create>-statu                    = <fs_data>-statusdescription.
                    <fs_t015_create>-DbsInvoiceId             = <fs_data>-dbsinvoiceid.
                    <fs_t015_create>-DbsAccountId             = <fs_data>-dbsaccountid.
                    <fs_t015_create>-TransactionDate          = <fs_data>-transactiondate.
                    <fs_t015_create>-%control-InvoiceNumber   = if_abap_behv=>mk-on.
                    <fs_t015_create>-%control-Id              = if_abap_behv=>mk-on.
                    <fs_t015_create>-%control-ScenarioType    = if_abap_behv=>mk-on.
                    <fs_t015_create>-%control-statu           = if_abap_behv=>mk-on.
                    <fs_t015_create>-%control-DbsInvoiceId    = if_abap_behv=>mk-on.
                    <fs_t015_create>-%control-DbsAccountId    = if_abap_behv=>mk-on.
                    <fs_t015_create>-%control-TransactionDate = if_abap_behv=>mk-on.

                  ENDIF.

                ENDLOOP.

                <fs_invoices>-message = 'Fatura Yaratıldı'.
                lo_log->set_sapinvoiceno( iv_sapinvoiceno = <fs_invoices>-invoice_number
                                          iv_id           = <fs_invoices>-id
                                          iv_bankcode     = <fs_invoices>-bank_code ).
                lo_log->add_log( msgty = if_abap_behv_message=>severity-success
                                 msgno = '008'  ).

              ENDIF.

            ELSE.

              <fs_invoices>-message = ls_result-statusmessage.
              lo_log->set_sapinvoiceno( iv_sapinvoiceno = <fs_invoices>-invoice_number
                                        iv_id           = <fs_invoices>-id
                                        iv_bankcode     = <fs_invoices>-bank_code ).
              lo_log->add_log( msgty = if_abap_behv_message=>severity-error
                               msgtx = ls_result-statusmessage ).

            ENDIF.

          ELSE.

            <fs_invoices>-message = 'Gönderilen Tutar Belge Tutarından Yüksek'.
            lo_log->set_sapinvoiceno( iv_sapinvoiceno = <fs_invoices>-invoice_number
                                      iv_id           = <fs_invoices>-id
                                      iv_bankcode     = <fs_invoices>-bank_code ).
            lo_log->add_log( msgty = if_abap_behv_message=>severity-success
                             msgno = '009'  ).

          ENDIF.

        ELSE.

          <fs_invoices>-message = 'Gönderilen Tutar Belge Tutarından Yüksek'.
          lo_log->set_sapinvoiceno( iv_sapinvoiceno = <fs_invoices>-invoice_number
                                    iv_id           = <fs_invoices>-id
                                    iv_bankcode     = <fs_invoices>-bank_code ).
          lo_log->add_log( msgty = if_abap_behv_message=>severity-success
                           msgno = '009'  ).

        ENDIF.

      ELSE.

        <fs_invoices>-message = 'Banka Bilgisi Bulunamadı'.
        lo_log->set_sapinvoiceno( iv_sapinvoiceno = <fs_invoices>-invoice_number
                                  iv_id           = <fs_invoices>-id
                                  iv_bankcode     = <fs_invoices>-bank_code ).
        lo_log->add_log( msgty = if_abap_behv_message=>severity-success
                         msgno = '010'  ).

      ENDIF.

      CLEAR: lv_invoice_total, ls_result, lv_startdate, lv_enddate,
             ls_invoice, lv_error, lv_number, lv_invoice_number,
             lv_partial_invoice_number, lv_partial, lv_inv.

    ENDLOOP.

    MODIFY ENTITIES OF zarete_dbs_dd_t015 ENTITY zarete_dbs_dd_t015
    CREATE AUTO FILL CID WITH lt_t015_create
    MAPPED DATA(lt_mapped_t015_cr)
    FAILED DATA(lt_failed_t015_cr)
    REPORTED DATA(lt_reported_t015_cr).

    MODIFY ENTITIES OF zarete_dbs_dd_t015 ENTITY zarete_dbs_dd_t015
    UPDATE FIELDS ( Statu IsCancelled ) WITH lt_t015_update
    MAPPED DATA(lt_mapped_t015_up)
    FAILED DATA(lt_failed_t015_up)
    REPORTED DATA(lt_reported_t015_up).

    MODIFY ENTITIES OF zarete_dbs_dd_t016 ENTITY zarete_dbs_dd_t016
    CREATE AUTO FILL CID WITH lt_t016_create
    MAPPED DATA(lt_mapped_t016_cr)
    FAILED DATA(lt_failed_t016_cr)
    REPORTED DATA(lt_reported_t016_cr).

    MODIFY ENTITIES OF zarete_dbs_dd_t016 ENTITY zarete_dbs_dd_t016
    UPDATE FIELDS ( Amount DueDate LastPaymentDate PaymentDescription StatusCode StatusDescription ) WITH lt_t016_update
    MAPPED DATA(lt_mapped_t016_up)
    FAILED DATA(lt_failed_t016_up)
    REPORTED DATA(lt_reported_t016_up).

  ENDMETHOD.