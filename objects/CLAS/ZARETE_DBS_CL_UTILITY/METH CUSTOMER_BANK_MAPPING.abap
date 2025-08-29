  METHOD customer_bank_mapping.

    DATA: r_descr TYPE REF TO cl_abap_structdescr,
          gt_comp TYPE abap_component_tab.

    FIELD-SYMBOLS: <fs_journal_entry> TYPE any.

    SELECT * FROM zarete_dbs_t006 WHERE sap_kayit_ornegi = '*' INTO TABLE @DATA(lt_sabit).
    SORT lt_sabit DESCENDING BY sap_kayit_ornegi .
    SORT lt_sabit DESCENDING BY sap_alan_adi.
    DELETE ADJACENT DUPLICATES FROM lt_sabit COMPARING sap_alan_adi.

    r_descr ?= cl_abap_typedescr=>describe_by_data( es_map ).
    gt_comp = r_descr->get_components( ).
    LOOP AT lt_sabit INTO DATA(ls_sabit).

      TRANSLATE ls_sabit-sap_alan_adi TO UPPER CASE.
      READ TABLE gt_comp WITH KEY name = ls_sabit-sap_alan_adi INTO DATA(ls_comp).

      IF sy-subrc = 0.
        ASSIGN COMPONENT ls_comp-name OF STRUCTURE es_map TO <fs_journal_entry>.
        <fs_journal_entry> = ls_sabit-sap_alan_degeri.
      ENDIF.

    ENDLOOP.

    es_map-posting_date                = is_invoice_details-posting_date.
    es_map-document_date               = is_invoice_details-document_date.
    es_map-tax_determination_date      = is_invoice_details-document_date.
    es_map-original_reference_document = is_invoice_details-invoice_number.

    APPEND INITIAL LINE TO es_map-debtor_item ASSIGNING FIELD-SYMBOL(<fs_debtor_item>).
    <fs_debtor_item>-reference_document_item                      = '1'.
    <fs_debtor_item>-debtor                                       = is_business_partner-bp_no.
    <fs_debtor_item>-amount_in_transaction_currency-currency_code = is_invoice_details-currency_code.
    <fs_debtor_item>-amount_in_transaction_currency-content       = is_invoice_details-amount *  -1 .
    <fs_debtor_item>-amount_in_company_code_currenc-currency_code = is_invoice_details-currency_code.
    <fs_debtor_item>-amount_in_company_code_currenc-content       = is_invoice_details-amount *  -1 .
    <fs_debtor_item>-document_item_text                           = is_invoice_details-document_text.

    APPEND INITIAL LINE TO es_map-item  ASSIGNING FIELD-SYMBOL(<fs_item>).
    <fs_item>-reference_document_item                      = '2'.
    <fs_item>-amount_in_transaction_currency-currency_code = is_invoice_details-currency_code.
    <fs_item>-amount_in_transaction_currency-content       = is_invoice_details-amount.
    <fs_item>-amount_in_company_code_currenc-currency_code = is_invoice_details-currency_code.
    <fs_item>-amount_in_company_code_currenc-content       = is_invoice_details-amount.
    <fs_item>-document_item_text                           = is_invoice_details-document_text.
    <fs_item>-assignment_reference                         = is_invoice_details-assignment_reference.
    <fs_item>-value_date                                   = is_invoice_details-value_date.
    <fs_item>-glaccount-content                            = is_business_partner-glaccount.
    <fs_item>-house_bank                                   = is_business_partner-house_bank.
    <fs_item>-house_bank_account                           = is_business_partner-house_bank_account.

  ENDMETHOD.