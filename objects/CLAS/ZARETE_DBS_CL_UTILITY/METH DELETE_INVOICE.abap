  METHOD delete_invoice.

    DATA: lt_t015_create TYPE TABLE FOR CREATE zarete_dbs_dd_t015,
          lt_t015_update TYPE TABLE FOR UPDATE zarete_dbs_dd_t015,
          lt_t016_create TYPE TABLE FOR CREATE zarete_dbs_dd_t016,
          lt_t016_update TYPE TABLE FOR UPDATE zarete_dbs_dd_t016.

    DATA(lo_send) = NEW zarete_dbs_sc_finteo_api( ).
    DATA(lo_log) = zarete_dbs_cl_log=>get_factory( ).


*Key alanlarla ilgili satırın dbsinvoiceid alanı alınarak fatura silme metoduna gönderilir
    IF ct_invoices IS NOT INITIAL.

      SELECT *
      FROM zarete_dbs_t016
      FOR ALL ENTRIES IN @ct_invoices
      WHERE invoice_number         EQ @ct_invoices-invoice_number
      AND   id                     EQ @ct_invoices-id
      AND   partial_invoice_number EQ @ct_invoices-partial_invoice_number
      AND   amount IS NOT INITIAL
      INTO TABLE @DATA(lt_t016).

    ENDIF.

    LOOP AT ct_invoices ASSIGNING FIELD-SYMBOL(<fs_invoices>).

      READ TABLE lt_t016 ASSIGNING FIELD-SYMBOL(<fs_t016>) WITH KEY invoice_number         = <fs_invoices>-invoice_number
                                                                    id                     = <fs_invoices>-id
                                                                    partial_invoice_number = <fs_invoices>-partial_invoice_number.
      IF sy-subrc EQ 0.

        lo_send->delete_invoice(
          EXPORTING
            iv_invoiceno      = CONV string( <fs_t016>-dbs_invoice_id )
          RECEIVING
            rv_delete_invoice = DATA(ls_result)
        ).

*Eğer fatura başarı ile silindiyse fatura ve finteo faturaları tablosunda silindi olarak işaretlenir
        IF ls_result-status EQ 'OK'.

          IF <fs_invoices>-partial_invoice_number IS INITIAL.

            SELECT SINGLE *
              FROM zarete_dbs_t015
              WHERE invoice_number EQ @<fs_invoices>-invoice_number
              AND   id             EQ @<fs_invoices>-id
              INTO @DATA(ls_t015).

            APPEND INITIAL LINE TO lt_t015_update ASSIGNING FIELD-SYMBOL(<fs_t015_update>).
            <fs_t015_update>-InvoiceNumber          = ls_t015-invoice_number.
            <fs_t015_update>-Uuid                   = ls_t015-uuid.
            <fs_t015_update>-Id                     = ls_t015-id.
            <fs_t015_update>-statu                  = '7'.
            <fs_t015_update>-DbsInvoiceId           = ls_t015-dbs_invoice_id.
            <fs_t015_update>-DbsAccountId           = ls_t015-dbs_account_id.
            <fs_t015_update>-IsCancelled            = abap_true.
            <fs_t015_update>-%control-IsCancelled   = if_abap_behv=>mk-on.
            <fs_t015_update>-%control-statu         = if_abap_behv=>mk-on.

          ENDIF.

          APPEND INITIAL LINE TO lt_t016_update ASSIGNING FIELD-SYMBOL(<fs_t016_update>).
          <fs_t016_update>-Identifier                  = <fs_t016>-identifier.
          <fs_t016_update>-DbsInvoiceId                = <fs_t016>-dbs_invoice_id.
          <fs_t016_update>-Id                          = <fs_t016>-id.
          <fs_t016_update>-StatusCode                  = '2'.
          <fs_t016_update>-StatusDescription           = '7'.
          <fs_t016_update>-Amount                      = 0.
          <fs_t016_update>-DeletedAmount               = <fs_invoices>-amount.
          <fs_t016_update>-%control-StatusCode         = if_abap_behv=>mk-on.
          <fs_t016_update>-%control-StatusDescription  = if_abap_behv=>mk-on.
          <fs_t016_update>-%control-Amount             = if_abap_behv=>mk-on.

          <fs_invoices>-message = 'Fatura Geri Alındı'.
          lo_log->set_sapinvoiceno( iv_sapinvoiceno = <fs_invoices>-invoice_number
                                    iv_id           = <fs_invoices>-id
                                    iv_bankcode     = <fs_invoices>-bank_code ).
          lo_log->add_log( msgty = if_abap_behv_message=>severity-success
                           msgno = '006'  ).

        ELSE.

          <fs_invoices>-message = 'Fatura Geri Alınamadı'.
          lo_log->set_sapinvoiceno( iv_sapinvoiceno = <fs_invoices>-invoice_number
                                    iv_id           = <fs_invoices>-id
                                    iv_bankcode     = <fs_invoices>-bank_code ).
          lo_log->add_log( msgty = if_abap_behv_message=>severity-error
                           msgno = '007'  ).

        ENDIF.

      ELSE.

        <fs_invoices>-message = 'Fatura Geri Alınamadı'.
        lo_log->set_sapinvoiceno( iv_sapinvoiceno = <fs_invoices>-invoice_number
                                  iv_id           = <fs_invoices>-id
                                  iv_bankcode     = <fs_invoices>-bank_code ).
        lo_log->add_log( msgty = if_abap_behv_message=>severity-error
                         msgno = '007'  ).

      ENDIF.

    ENDLOOP.

    MODIFY ENTITIES OF zarete_dbs_dd_t015 ENTITY zarete_dbs_dd_t015
    UPDATE FIELDS ( Statu IsCancelled ) WITH lt_t015_update
    MAPPED DATA(lt_mapped_t015_up)
    FAILED DATA(lt_failed_t015_up)
    REPORTED DATA(lt_reported_t015_up).

    MODIFY ENTITIES OF zarete_dbs_dd_t016 ENTITY zarete_dbs_dd_t016
    UPDATE FIELDS ( StatusCode StatusDescription Amount DeletedAmount ) WITH lt_t016_update
    MAPPED DATA(lt_mapped_t016_up)
    FAILED DATA(lt_failed_t016_up)
    REPORTED DATA(lt_reported_t016_up).

  ENDMETHOD.