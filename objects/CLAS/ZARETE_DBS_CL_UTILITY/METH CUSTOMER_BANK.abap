  METHOD customer_bank.

    DATA: lt_t015_update TYPE TABLE FOR UPDATE zarete_dbs_dd_t015.

    DATA(ls_request) = VALUE zarete_dbs_journal_entry_bulk( ).

    APPEND INITIAL LINE TO ls_request-journal_entry_bulk_create_requ-journal_entry_create_request ASSIGNING FIELD-SYMBOL(<fs_request>).

    customer_bank_mapping( EXPORTING is_business_partner = is_business_partner
                                     is_invoice_details  = is_invoice_details
                           IMPORTING es_map              = <fs_request>-journal_entry ).

*    journal_entry_test_mode( EXPORTING is_request = ls_request
*                             IMPORTING et_message = et_message ).

    journal_entry_create( EXPORTING is_request         = ls_request
                          IMPORTING ev_document_number = ev_document_number
                                    ev_company_code    = ev_company_code
                                    ev_fiscal_year     = ev_fiscal_year
                                    et_message         = et_message ).

    IF ev_document_number IS NOT INITIAL.

      SELECT SINGLE *
        FROM zarete_dbs_t015
        WHERE invoice_number EQ @is_invoice_details-invoice_number
        AND   id EQ @is_invoice_details-id
        INTO @DATA(ls_t015).
      IF sy-subrc EQ 0.

        APPEND INITIAL LINE TO lt_t015_update ASSIGNING FIELD-SYMBOL(<fs_t015_update>).
        <fs_t015_update>-InvoiceNumber               = ls_t015-invoice_number.
        <fs_t015_update>-Uuid                        = ls_t015-uuid.
        <fs_t015_update>-Id                          = ls_t015-id.
        <fs_t015_update>-AccountingDocument          = ev_document_number.
        <fs_t015_update>-CompanyCode                 = ev_company_code.
        <fs_t015_update>-FiscalYear                  = ev_fiscal_year.
        <fs_t015_update>-AccError                    = ''.
        <fs_t015_update>-%control-AccountingDocument = if_abap_behv=>mk-on.
        <fs_t015_update>-%control-CompanyCode        = if_abap_behv=>mk-on.
        <fs_t015_update>-%control-FiscalYear         = if_abap_behv=>mk-on.
        <fs_t015_update>-%control-AccError           = if_abap_behv=>mk-on.

        MODIFY ENTITIES OF zarete_dbs_dd_t015 ENTITY zarete_dbs_dd_t015
        UPDATE FIELDS ( AccountingDocument CompanyCode FiscalYear AccError ) WITH lt_t015_update
        MAPPED DATA(lt_mapped_t015_up)
        FAILED DATA(lt_failed_t015_up)
        REPORTED DATA(lt_reported_t015_up).

*        COMMIT ENTITIES RESPONSE OF zarete_dbs_dd_t015
*        FAILED DATA(lt_failed_t015_co)
*        REPORTED DATA(lt_reported_t015_co).

      ENDIF.

    ENDIF.

  ENDMETHOD.