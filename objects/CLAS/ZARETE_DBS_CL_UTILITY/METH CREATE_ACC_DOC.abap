  METHOD create_acc_doc.

    DATA: ls_business_partner TYPE zarete_dbs_t012,
          ls_invoice_details  TYPE ty_inv_details.

    DATA: lt_t015_update TYPE TABLE FOR UPDATE zarete_dbs_dd_t015,
          lt_t031_create TYPE TABLE FOR CREATE zarete_dbs_dd_t031.

    DATA(lo_log) = zarete_dbs_cl_log=>get_factory( ).

    IF ct_invoices IS NOT INITIAL.

      SELECT t017~document_reference_id,
             t017~posting_date,
             t017~document_date,
             t017~document_item_text,
             t017~assignment_reference,
             t017~value_date
         FROM zarete_dbs_t017 AS t017
         FOR ALL ENTRIES IN @ct_invoices
         WHERE document_reference_id EQ @ct_invoices-invoice_number
         INTO TABLE @DATA(lt_t017).

      SELECT t012~company_bank_code,
             t012~bp_no,
             t012~glaccount,
             t012~house_bank,
             t012~house_bank_account
         FROM zarete_dbs_t012 AS t012
         FOR ALL ENTRIES IN @ct_invoices
         WHERE company_bank_code EQ @ct_invoices-bank_code
         AND   bp_no EQ @ct_invoices-customer
         INTO TABLE @DATA(lt_t012).

      LOOP AT ct_invoices ASSIGNING FIELD-SYMBOL(<fs_invoices>).

        READ TABLE lt_t017 ASSIGNING FIELD-SYMBOL(<fs_t017>) WITH KEY document_reference_id = <fs_invoices>-invoice_number.
        IF sy-subrc EQ 0.

          READ TABLE lt_t012 ASSIGNING FIELD-SYMBOL(<fs_t012>) WITH KEY company_bank_code = <fs_invoices>-bank_code
                                                                        bp_no = <fs_invoices>-customer.
          IF sy-subrc EQ 0.

            ls_invoice_details-posting_date         = <fs_t017>-posting_date.
            ls_invoice_details-document_date        = <fs_t017>-document_date.
            ls_invoice_details-assignment_reference = <fs_t017>-assignment_reference.
            ls_invoice_details-value_date           = <fs_t017>-document_date.
            ls_invoice_details-document_date        = <fs_t017>-document_date.
            ls_invoice_details-invoice_number       = <fs_invoices>-invoice_number.
            ls_invoice_details-id                   = <fs_invoices>-id.
            ls_invoice_details-currency_code        = <fs_invoices>-currency.
            ls_invoice_details-amount               = <fs_invoices>-amount.
            ls_invoice_details-document_text        = <fs_t017>-document_item_text.

            ls_business_partner-bp_no              = <fs_invoices>-customer.
            ls_business_partner-glaccount          = <fs_t012>-glaccount.
            ls_business_partner-house_bank         = <fs_t012>-house_bank.
            ls_business_partner-house_bank_account = <fs_t012>-house_bank_account.

            customer_bank(
              EXPORTING
                is_business_partner = ls_business_partner
                is_invoice_details  = ls_invoice_details
              IMPORTING
                ev_document_number  = DATA(lv_docno)
                ev_company_code     = DATA(lv_company_code)
                ev_fiscal_year      = DATA(lv_fiscal_year)
                et_message          = DATA(lt_message)
            ).

            IF lv_docno IS INITIAL.

              SELECT SINGLE *
                FROM zarete_dbs_t015
                WHERE invoice_number EQ @<fs_invoices>-invoice_number
                AND   id EQ @<fs_invoices>-id
                INTO @DATA(ls_t015).
              IF sy-subrc EQ 0.

                APPEND INITIAL LINE TO lt_t015_update ASSIGNING FIELD-SYMBOL(<fs_t015_update>).
                <fs_t015_update>-InvoiceNumber               = ls_t015-invoice_number.
                <fs_t015_update>-Uuid                        = ls_t015-uuid.
                <fs_t015_update>-Id                          = ls_t015-id.
                <fs_t015_update>-AccError                    = 'X'.
                <fs_t015_update>-%control-AccError = if_abap_behv=>mk-on.

                MODIFY ENTITIES OF zarete_dbs_dd_t015 ENTITY zarete_dbs_dd_t015
                UPDATE FIELDS ( AccError ) WITH lt_t015_update
                MAPPED DATA(lt_mapped_t015_up)
                FAILED DATA(lt_failed_t015_up)
                REPORTED DATA(lt_reported_t015_up).

*                COMMIT ENTITIES RESPONSE OF zarete_dbs_dd_t015
*                FAILED DATA(lt_failed_t015_co)
*                REPORTED DATA(lt_reported_t015_co).

                <fs_invoices>-message = 'Muhasebe Belgesi Oluşturulamadı'.
                lo_log->set_sapinvoiceno( iv_sapinvoiceno = <fs_invoices>-invoice_number
                                          iv_id           = <fs_invoices>-id
                                          iv_bankcode     = <fs_invoices>-bank_code ).
                lo_log->add_log( msgty = if_abap_behv_message=>severity-error
                                 msgno = '002'  ).

              ENDIF.

            ELSE.

              <fs_invoices>-message = 'Muhasebe Belgesi Oluşturuldu'.
              lo_log->set_sapinvoiceno( iv_sapinvoiceno = <fs_invoices>-invoice_number
                                        iv_id           = <fs_invoices>-id
                                        iv_bankcode     = <fs_invoices>-bank_code ).
              lo_log->add_log( msgty = if_abap_behv_message=>severity-success
                               msgno = '003'  ).

              SELECT SINGLE *
                FROM zarete_dbs_t020
                WHERE accounting_document EQ @lv_docno
                AND   fiscal_year EQ @lv_fiscal_year
                AND   company_code EQ @lv_company_code
                INTO @DATA(ls_t020).
              IF sy-subrc NE 0.
                APPEND INITIAL LINE TO lt_t031_create ASSIGNING FIELD-SYMBOL(<fs_t031_create>).
                <fs_t031_create>-AccountingDocument          = lv_docno.
                <fs_t031_create>-FiscalYear                  = lv_fiscal_year.
                <fs_t031_create>-CompanyCode                 = lv_company_code.
                <fs_t031_create>-InvoiceNumber               = <fs_invoices>-invoice_number.
                <fs_t031_create>-Id                          = <fs_invoices>-id.
                <fs_t031_create>-Customer                    = <fs_invoices>-customer.
                <fs_t031_create>-%control-AccountingDocument = if_abap_behv=>mk-on.
                <fs_t031_create>-%control-FiscalYear         = if_abap_behv=>mk-on.
                <fs_t031_create>-%control-CompanyCode        = if_abap_behv=>mk-on.
                <fs_t031_create>-%control-InvoiceNumber      = if_abap_behv=>mk-on.
                <fs_t031_create>-%control-Id                 = if_abap_behv=>mk-on.
                <fs_t031_create>-%control-Customer           = if_abap_behv=>mk-on.

              ENDIF.
            ENDIF.

          ELSE.

            <fs_invoices>-message = 'Ana Hesap Bilgisi Bulunamadı'.
            lo_log->set_sapinvoiceno( iv_sapinvoiceno = <fs_invoices>-invoice_number
                                      iv_id           = <fs_invoices>-id
                                      iv_bankcode     = <fs_invoices>-bank_code ).
            lo_log->add_log( msgty = if_abap_behv_message=>severity-error
                             msgno = '004'  ).

          ENDIF.

        ELSE.

          <fs_invoices>-message = 'SAP Belge Detayı Bulunamadı'.
          lo_log->set_sapinvoiceno( iv_sapinvoiceno = <fs_invoices>-invoice_number
                                    iv_id           = <fs_invoices>-id
                                    iv_bankcode     = <fs_invoices>-bank_code ).
          lo_log->add_log( msgty = if_abap_behv_message=>severity-error
                           msgno = '005'  ).

        ENDIF.

      ENDLOOP.

      MODIFY ENTITIES OF zarete_dbs_dd_t031 ENTITY zarete_dbs_dd_t031
      CREATE AUTO FILL CID WITH lt_t031_create
      MAPPED DATA(lt_mapped_t031_cr)
      FAILED DATA(lt_failed_t031_cr)
      REPORTED DATA(lt_reported_t031_cr).

    ENDIF.

  ENDMETHOD.