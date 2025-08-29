  METHOD get_invoices.

    DATA: lt_t015_create TYPE TABLE FOR CREATE zarete_dbs_dd_t015,
          lt_t015_update TYPE TABLE FOR UPDATE zarete_dbs_dd_t015,
          lt_t016_create TYPE TABLE FOR CREATE zarete_dbs_dd_t016,
          lt_t016_update TYPE TABLE FOR UPDATE zarete_dbs_dd_t016,
          lt_t017_create TYPE TABLE FOR CREATE zarete_dbs_dd_t017,
          lt_t017_update TYPE TABLE FOR UPDATE zarete_dbs_dd_t017,
          lv_error       TYPE c,
          lv_number      TYPE char7.

    DATA(lo_finteo_invoices) = NEW zarete_dbs_sc_finteo_api( ).

*Finteo'dan gelen faturalar
    DATA(lt_finteo_invoices) = lo_finteo_invoices->get_invoice(
                                                   EXPORTING
                                                   iv_startdate         = iv_startdate
                                                   iv_finishdate        = iv_finishdate
                                                   iv_bankid            = iv_bankid
                                                   iv_partycode         = iv_partycode
                                                   iv_identifier        = iv_identifier
                                                   iv_dbsinvoiceid      = iv_dbsinvoiceid
                                                   iv_statuscode        = iv_statuscode
                                                   iv_statusdescription = iv_statusdescription ).

    LOOP AT lt_finteo_invoices-data ASSIGNING FIELD-SYMBOL(<fs_finteo_invoices>).

      SELECT SINGLE *
        FROM zarete_dbs_t016
        WHERE identifier     EQ @<fs_finteo_invoices>-identifier
        AND   dbs_invoice_id EQ @<fs_finteo_invoices>-dbsinvoiceid
        INTO @DATA(ls_t016).

      IF sy-subrc EQ 0.

        APPEND INITIAL LINE TO lt_t016_update ASSIGNING FIELD-SYMBOL(<fs_t016_update>).
        <fs_t016_update>-Identifier                  = ls_t016-identifier.
        <fs_t016_update>-DbsInvoiceId                = ls_t016-dbs_invoice_id.
        <fs_t016_update>-DueDate                     = <fs_finteo_invoices>-duedate.
        <fs_t016_update>-LastPaymentDate             = <fs_finteo_invoices>-lastpaymentdate.
        <fs_t016_update>-PaymentDescription          = <fs_finteo_invoices>-paymentdescription.
        <fs_t016_update>-StatusCode                  = <fs_finteo_invoices>-statuscode.
        <fs_t016_update>-StatusDescription           = <fs_finteo_invoices>-statusdescription.
        <fs_t016_update>-%control-DueDate            = if_abap_behv=>mk-on.
        <fs_t016_update>-%control-LastPaymentDate    = if_abap_behv=>mk-on.
        <fs_t016_update>-%control-PaymentDescription = if_abap_behv=>mk-on.
        <fs_t016_update>-%control-StatusCode         = if_abap_behv=>mk-on.
        <fs_t016_update>-%control-StatusDescription  = if_abap_behv=>mk-on.

      ELSE.

*        APPEND INITIAL LINE TO lt_t016_create ASSIGNING FIELD-SYMBOL(<fs_t016_create>).
*        <fs_t016_create>-Identifier                           = <fs_finteo_invoices>-Identifier.
*        <fs_t016_create>-DbsInvoiceId                         = <fs_finteo_invoices>-DbsInvoiceId.
*        <fs_t016_create>-Amount                               = <fs_finteo_invoices>-Amount.
*        <fs_t016_create>-CurrencyCode                         = <fs_finteo_invoices>-CurrencyCode.
*        <fs_t016_create>-DueDate                              = <fs_finteo_invoices>-DueDate.
*        <fs_t016_create>-InvoiceNumber                        = <fs_finteo_invoices>-InvoiceNumber.
*        <fs_t016_create>-InvoiceAmountDue                     = <fs_finteo_invoices>-InvoiceAmountDue.
*        <fs_t016_create>-LastPaymentDate                      = <fs_finteo_invoices>-LastPaymentDate.
*        <fs_t016_create>-PartialGuaranteedAmount              = <fs_finteo_invoices>-PartialGuaranteedAmount.
*        <fs_t016_create>-AmountRemainingBeforePaymen          = <fs_finteo_invoices>-AmountRemainingBeforePayment.
*        <fs_t016_create>-PaymentDescription                   = <fs_finteo_invoices>-PaymentDescription.
*        <fs_t016_create>-StatusCode                           = <fs_finteo_invoices>-StatusCode.
*        <fs_t016_create>-StatusDescription                    = <fs_finteo_invoices>-StatusDescription.
*        <fs_t016_create>-TransactionDate                      = <fs_finteo_invoices>-TransactionDate.
*        <fs_t016_create>-DbsAccountId                         = <fs_finteo_invoices>-DbsAccountId.
*        <fs_t016_create>-PartyCode                            = <fs_finteo_invoices>-PartyCode.
*        <fs_t016_create>-PartyTitle                           = <fs_finteo_invoices>-PartyTitle.
*        <fs_t016_create>-PartyTaxNumber                       = <fs_finteo_invoices>-PartyTaxNumber.
*        <fs_t016_create>-BankCode                             = <fs_finteo_invoices>-BankCode.
*        <fs_t016_create>-BankName                             = <fs_finteo_invoices>-BankName.
*        <fs_t016_create>-%control-Identifier                  = if_abap_behv=>mk-on.
*        <fs_t016_create>-%control-DbsInvoiceId                = if_abap_behv=>mk-on.
*        <fs_t016_create>-%control-Amount                      = if_abap_behv=>mk-on.
*        <fs_t016_create>-%control-CurrencyCode                = if_abap_behv=>mk-on.
*        <fs_t016_create>-%control-DueDate                     = if_abap_behv=>mk-on.
*        <fs_t016_create>-%control-InvoiceNumber               = if_abap_behv=>mk-on.
*        <fs_t016_create>-%control-InvoiceAmountDue            = if_abap_behv=>mk-on.
*        <fs_t016_create>-%control-LastPaymentDate             = if_abap_behv=>mk-on.
*        <fs_t016_create>-%control-PartialGuaranteedAmount     = if_abap_behv=>mk-on.
*        <fs_t016_create>-%control-AmountRemainingBeforePaymen = if_abap_behv=>mk-on.
*        <fs_t016_create>-%control-PaymentDescription          = if_abap_behv=>mk-on.
*        <fs_t016_create>-%control-StatusCode                  = if_abap_behv=>mk-on.
*        <fs_t016_create>-%control-StatusDescription           = if_abap_behv=>mk-on.
*        <fs_t016_create>-%control-TransactionDate             = if_abap_behv=>mk-on.
*        <fs_t016_create>-%control-DbsAccountId                = if_abap_behv=>mk-on.
*        <fs_t016_create>-%control-PartyCode                   = if_abap_behv=>mk-on.
*        <fs_t016_create>-%control-PartyTitle                  = if_abap_behv=>mk-on.
*        <fs_t016_create>-%control-PartyTaxNumber              = if_abap_behv=>mk-on.
*        <fs_t016_create>-%control-BankCode                    = if_abap_behv=>mk-on.
*        <fs_t016_create>-%control-BankName                    = if_abap_behv=>mk-on.

      ENDIF.

      SELECT SINGLE * FROM zarete_dbs_t015 WHERE invoice_number EQ @<fs_finteo_invoices>-invoicenumber
                                           AND   dbs_invoice_id EQ @<fs_finteo_invoices>-dbsinvoiceid INTO @DATA(ls_t015).
      IF sy-subrc EQ 0.

        APPEND INITIAL LINE TO lt_t015_update ASSIGNING FIELD-SYMBOL(<fs_t015_update>).
        <fs_t015_update>-InvoiceNumber          = ls_t015-invoice_number.
        <fs_t015_update>-Uuid                   = ls_t015-uuid.
        <fs_t015_update>-Id                     = ls_t015-id.
        <fs_t015_update>-statu                  = <fs_finteo_invoices>-statusdescription.
        <fs_t015_update>-DbsInvoiceId           = <fs_finteo_invoices>-dbsinvoiceid.
        <fs_t015_update>-DbsAccountId           = <fs_finteo_invoices>-dbsaccountid.
*        <fs_t015_update>-%control-InvoiceNumber = if_abap_behv=>mk-on.
        <fs_t015_update>-%control-statu         = if_abap_behv=>mk-on.
        <fs_t015_update>-%control-DbsInvoiceId  = if_abap_behv=>mk-on.
        <fs_t015_update>-%control-DbsAccountId  = if_abap_behv=>mk-on.

      ELSE.
*        "Finteoya manuel fatura yükleme durumunda burada başka bir case oluşur. Faturanın finteoda olması ve sap de olmaması gibi
*        "Bu konu finteo ile konuşulmalı ki kullanıcı manuel fatura yükleyemesin.
*        create_number_range_interval( IMPORTING ev_error = lv_error ).
*        IF lv_error NE abap_true.
*          get_number_next( IMPORTING ev_number = lv_number ).
*        ENDIF.
*
*
*        APPEND INITIAL LINE TO lt_t015_create ASSIGNING FIELD-SYMBOL(<fs_t015_create>).
*        <fs_t015_create>-InvoiceNumber            = <fs_finteo_invoices>-invoicenumber.
*        <fs_t015_create>-Id                       = lv_number.
*        <fs_t015_create>-ScenarioType             = '120-102'.
*        <fs_t015_create>-statu                    = <fs_finteo_invoices>-statusdescription.
*        <fs_t015_create>-DbsInvoiceId             = <fs_finteo_invoices>-dbsinvoiceid.
*        <fs_t015_create>-DbsAccountId             = <fs_finteo_invoices>-dbsaccountid.
*        <fs_t015_create>-TransactionDate          = <fs_finteo_invoices>-transactiondate.
*        <fs_t015_create>-%control-InvoiceNumber   = if_abap_behv=>mk-on.
*        <fs_t015_create>-%control-Id              = if_abap_behv=>mk-on.
*        <fs_t015_create>-%control-ScenarioType    = if_abap_behv=>mk-on.
*        <fs_t015_create>-%control-statu           = if_abap_behv=>mk-on.
*        <fs_t015_create>-%control-DbsInvoiceId    = if_abap_behv=>mk-on.
*        <fs_t015_create>-%control-DbsAccountId    = if_abap_behv=>mk-on.
*        <fs_t015_create>-%control-TransactionDate = if_abap_behv=>mk-on.
      ENDIF.

    ENDLOOP.


*    MODIFY ENTITIES OF zarete_dbs_dd_t015 ENTITY zarete_dbs_dd_t015
*    CREATE AUTO FILL CID WITH lt_t015_create
*    MAPPED DATA(lt_mapped_t015_cr)
*    FAILED DATA(lt_failed_t015_cr)
*    REPORTED DATA(lt_reported_t015_cr).

    MODIFY ENTITIES OF zarete_dbs_dd_t015 ENTITY zarete_dbs_dd_t015
    UPDATE FIELDS ( Statu DbsAccountId DbsInvoiceId ) WITH lt_t015_update
    MAPPED DATA(lt_mapped_t015_up)
    FAILED DATA(lt_failed_t015_up)
    REPORTED DATA(lt_reported_t015_up).

    CLEAR: lt_t015_create, lt_t015_update.
    COMMIT ENTITIES RESPONSE OF zarete_dbs_dd_t015
    FAILED DATA(lt_failed_t015_co)
    REPORTED DATA(lt_reported_t015_co).


*    MODIFY ENTITIES OF zarete_dbs_dd_t016 ENTITY zarete_dbs_dd_t016
*    CREATE AUTO FILL CID WITH lt_t016_create
*    MAPPED DATA(lt_mapped_t016_cr)
*    FAILED DATA(lt_failed_t016_cr)
*    REPORTED DATA(lt_reported_t016_cr).

    MODIFY ENTITIES OF zarete_dbs_dd_t016 ENTITY zarete_dbs_dd_t016
    UPDATE FIELDS ( DueDate LastPaymentDate PaymentDescription StatusCode StatusDescription ) WITH lt_t016_update
    MAPPED DATA(lt_mapped_t016_up)
    FAILED DATA(lt_failed_t016_up)
    REPORTED DATA(lt_reported_t016_up).

    CLEAR: lt_t015_create, lt_t015_update,lv_error, lv_number.
    COMMIT ENTITIES RESPONSE OF zarete_dbs_dd_t016
    FAILED DATA(lt_failed_t016_co)
    REPORTED DATA(lt_reported_t016_co).


*SAP'den gelen faturalar
    READ ENTITIES OF zarete_dbs_dd_doc_read_001
    ENTITY zarete_dbs_dd_doc_read_001
    ALL FIELDS WITH VALUE #( (  ) )
    RESULT DATA(lt_sap_invoices).

    DELETE lt_sap_invoices WHERE customer IS INITIAL.

    LOOP AT lt_sap_invoices ASSIGNING FIELD-SYMBOL(<fs_sap_invoices>).

      SELECT SINGLE *
        FROM zarete_dbs_t017
        WHERE company_code             EQ @<fs_sap_invoices>-company_code
        AND   fiscal_year              EQ @<fs_sap_invoices>-fiscal_year
        AND   accounting_document      EQ @<fs_sap_invoices>-accounting_document
        AND   accounting_document_item EQ @<fs_sap_invoices>-accounting_document_item
        AND   document_reference_id    EQ @<fs_sap_invoices>-document_reference_id
        INTO @DATA(ls_t017).

      IF sy-subrc EQ 0.

        APPEND INITIAL LINE TO lt_t017_update ASSIGNING FIELD-SYMBOL(<fs_t017_update>).
        <fs_t017_update>-CompanyCode                     = ls_t017-company_code.
        <fs_t017_update>-FiscalYear                      = ls_t017-fiscal_year.
        <fs_t017_update>-AccountingDocument              = ls_t017-accounting_document.
        <fs_t017_update>-AccountingDocumentItem          = ls_t017-accounting_document_item.
        <fs_t017_update>-DocumentReferenceId             = ls_t017-document_reference_id.
        <fs_t017_update>-DocumentItemText                = <fs_sap_invoices>-document_item_text.
        <fs_t017_update>-NetDueDate                      = <fs_sap_invoices>-net_due_date.
        <fs_t017_update>-CustomerName                    = <fs_sap_invoices>-customer_name.
*        <fs_t017_update>-%control-CompanyCode            = if_abap_behv=>mk-on.
*        <fs_t017_update>-%control-FiscalYear             = if_abap_behv=>mk-on.
*        <fs_t017_update>-%control-AccountingDocument     = if_abap_behv=>mk-on.
*        <fs_t017_update>-%control-AccountingDocumentItem = if_abap_behv=>mk-on.
*        <fs_t017_update>-%control-DocumentReferenceId    = if_abap_behv=>mk-on.
        <fs_t017_update>-%control-DocumentItemText       = if_abap_behv=>mk-on.
        <fs_t017_update>-%control-NetDueDate             = if_abap_behv=>mk-on.
        <fs_t017_update>-%control-CustomerName           = if_abap_behv=>mk-on.

*Eğer SAP sisteminde net vade tarihi güncellendiyse sap faturaları tablosundaki tarihten farklı olacaktır
*Bu sebeple Finteo'ya net vade tarihinin güncel hali iletilmelidir
        IF ls_t017-net_due_date NE <fs_sap_invoices>-net_due_date.
          update_due_date( iv_invoice_number = ls_t017-document_reference_id
                           iv_due_date       = CONV string( <fs_sap_invoices>-net_due_date ) ).
        ENDIF.

      ELSE.

        create_number_range_interval( IMPORTING ev_error = lv_error ).
        IF lv_error NE abap_true.
          get_number_next( IMPORTING ev_number = lv_number ).
        ENDIF.

        APPEND INITIAL LINE TO lt_t017_create ASSIGNING FIELD-SYMBOL(<fs_t017_create>).
        <fs_t017_create>-CompanyCode                      = <fs_sap_invoices>-company_code.
        <fs_t017_create>-FiscalYear                       = <fs_sap_invoices>-fiscal_year.
        <fs_t017_create>-AccountingDocument               = <fs_sap_invoices>-accounting_document.
        <fs_t017_create>-AccountingDocumentItem           = <fs_sap_invoices>-accounting_document_item.
        <fs_t017_create>-DocumentReferenceId              = <fs_sap_invoices>-document_reference_id.
        <fs_t017_create>-DebitCreditCode                  = <fs_sap_invoices>-debit_credit_code.
        <fs_t017_create>-DocumentItemText                 = <fs_sap_invoices>-document_item_text.
        <fs_t017_create>-Customer                         = <fs_sap_invoices>-customer.
        <fs_t017_create>-CustomerName                     = <fs_sap_invoices>-customer_name.
        <fs_t017_create>-PostingDate                      = <fs_sap_invoices>-posting_date.
        <fs_t017_create>-DocumentDate                     = <fs_sap_invoices>-document_date.
        <fs_t017_create>-NetDueDate                       = <fs_sap_invoices>-net_due_date.
        <fs_t017_create>-ValueDate                        = <fs_sap_invoices>-value_date.
        <fs_t017_create>-HouseBank                        = <fs_sap_invoices>-house_bank.
        <fs_t017_create>-AccountingDocumentType           = <fs_sap_invoices>-accounting_document_type.
        <fs_t017_create>-AmountInTransactionCurr          = abs( <fs_sap_invoices>-amount_in_transaction_curr ).
        <fs_t017_create>-TransactionCurrency              = <fs_sap_invoices>-transaction_currency.
        <fs_t017_create>-AssignmentReference              = <fs_sap_invoices>-assignment_reference.
        <fs_t017_create>-%control-CompanyCode             = if_abap_behv=>mk-on.
        <fs_t017_create>-%control-FiscalYear              = if_abap_behv=>mk-on.
        <fs_t017_create>-%control-AccountingDocument      = if_abap_behv=>mk-on.
        <fs_t017_create>-%control-AccountingDocumentItem  = if_abap_behv=>mk-on.
        <fs_t017_create>-%control-DocumentReferenceId     = if_abap_behv=>mk-on.
        <fs_t017_create>-%control-DebitCreditCode         = if_abap_behv=>mk-on.
        <fs_t017_create>-%control-DocumentItemText        = if_abap_behv=>mk-on.
        <fs_t017_create>-%control-Customer                = if_abap_behv=>mk-on.
        <fs_t017_create>-%control-CustomerName            = if_abap_behv=>mk-on.
        <fs_t017_create>-%control-PostingDate             = if_abap_behv=>mk-on.
        <fs_t017_create>-%control-DocumentDate            = if_abap_behv=>mk-on.
        <fs_t017_create>-%control-NetDueDate              = if_abap_behv=>mk-on.
        <fs_t017_create>-%control-ValueDate               = if_abap_behv=>mk-on.
        <fs_t017_create>-%control-HouseBank               = if_abap_behv=>mk-on.
        <fs_t017_create>-%control-AccountingDocumentType  = if_abap_behv=>mk-on.
        <fs_t017_create>-%control-AmountInTransactionCurr = if_abap_behv=>mk-on.
        <fs_t017_create>-%control-TransactionCurrency     = if_abap_behv=>mk-on.
        <fs_t017_create>-%control-AssignmentReference     = if_abap_behv=>mk-on.

      ENDIF.

      SELECT SINGLE * FROM zarete_dbs_t015 WHERE invoice_number EQ @<fs_sap_invoices>-document_reference_id INTO @ls_t015.
      IF sy-subrc EQ 0.

        READ TABLE lt_finteo_invoices-data ASSIGNING <fs_finteo_invoices> WITH KEY invoicenumber = <fs_sap_invoices>-document_reference_id.
        IF sy-subrc EQ 0.
          APPEND INITIAL LINE TO lt_t015_update ASSIGNING <fs_t015_update>.
          <fs_t015_update>-InvoiceNumber        = ls_t015-invoice_number.
          <fs_t015_update>-Uuid                 = ls_t015-uuid.
          <fs_t015_update>-Id                   = ls_t015-id.
          <fs_t015_update>-statu                = <fs_finteo_invoices>-statusdescription.
          <fs_t015_update>-DbsInvoiceId         = <fs_finteo_invoices>-dbsinvoiceid.
          <fs_t015_update>-DbsAccountId         = <fs_finteo_invoices>-dbsaccountid.
*        <fs_t015_update>-%control-InvoiceNumber = if_abap_behv=>mk-on.
*        <fs_t015_update>-%control-Uuid          = if_abap_behv=>mk-on.
          <fs_t015_update>-%control-statu         = if_abap_behv=>mk-on.
          <fs_t015_update>-%control-DbsInvoiceId  = if_abap_behv=>mk-on.
          <fs_t015_update>-%control-DbsAccountId  = if_abap_behv=>mk-on.
        ENDIF.

      ELSE.

*        create_number_range_interval( IMPORTING ev_error = lv_error ).
*        IF lv_error NE abap_true.
*          get_number_next( IMPORTING ev_number = lv_number ).
*        ENDIF.

        APPEND INITIAL LINE TO lt_t015_create ASSIGNING FIELD-SYMBOL(<fs_t015_create>).
        <fs_t015_create>-InvoiceNumber            = <fs_sap_invoices>-document_reference_id.
        <fs_t015_create>-Id                       = lv_number.
        <fs_t015_create>-TransactionDate          = <fs_sap_invoices>-document_date.
        <fs_t015_create>-ScenarioType             = '120-102'.
        <fs_t015_create>-%control-InvoiceNumber   = if_abap_behv=>mk-on.
        <fs_t015_create>-%control-Id              = if_abap_behv=>mk-on.
        <fs_t015_create>-%control-ScenarioType    = if_abap_behv=>mk-on.
        <fs_t015_create>-%control-TransactionDate = if_abap_behv=>mk-on.

        READ TABLE lt_finteo_invoices-data ASSIGNING <fs_finteo_invoices> WITH KEY invoicenumber = <fs_sap_invoices>-document_reference_id.
        IF sy-subrc EQ 0.
          <fs_t015_create>-statu                  = <fs_finteo_invoices>-statusdescription.
          <fs_t015_create>-DbsInvoiceId           = <fs_finteo_invoices>-dbsinvoiceid.
          <fs_t015_create>-DbsAccountId           = <fs_finteo_invoices>-dbsaccountid.
          <fs_t015_create>-%control-statu         = if_abap_behv=>mk-on.
          <fs_t015_create>-%control-DbsInvoiceId  = if_abap_behv=>mk-on.
          <fs_t015_create>-%control-DbsAccountId  = if_abap_behv=>mk-on.
        ENDIF.

      ENDIF.

    ENDLOOP.

    MODIFY ENTITIES OF zarete_dbs_dd_t015 ENTITY zarete_dbs_dd_t015
    CREATE AUTO FILL CID WITH lt_t015_create
    MAPPED DATA(lt_mapped_t015_2_cr)
    FAILED DATA(lt_failed_t015_2_cr)
    REPORTED DATA(lt_reported_t015_2_cr).

    MODIFY ENTITIES OF zarete_dbs_dd_t015 ENTITY zarete_dbs_dd_t015
    UPDATE FIELDS ( Statu DbsAccountId DbsInvoiceId ) WITH lt_t015_update
    MAPPED DATA(lt_mapped_t015_2_up)
    FAILED DATA(lt_failed_t015_2_up)
    REPORTED DATA(lt_reported_t015_2_up).

    COMMIT ENTITIES RESPONSE OF zarete_dbs_dd_t015
    FAILED DATA(lt_failed_t015_2_co)
    REPORTED DATA(lt_reported_t015_2_co).


    MODIFY ENTITIES OF zarete_dbs_dd_t017 ENTITY zarete_dbs_dd_t017
    CREATE AUTO FILL CID WITH lt_t017_create
    MAPPED DATA(lt_mapped_t017_cr)
    FAILED DATA(lt_failed_t017_cr)
    REPORTED DATA(lt_reported_t017_cr).

    MODIFY ENTITIES OF zarete_dbs_dd_t017 ENTITY zarete_dbs_dd_t017
    UPDATE FIELDS (  DocumentItemText NetDueDate CustomerName  ) WITH lt_t017_update
    MAPPED DATA(lt_mapped_t017_up)
    FAILED DATA(lt_failed_t017_up)
    REPORTED DATA(lt_reported_t017_up).

    COMMIT ENTITIES RESPONSE OF zarete_dbs_dd_t017
    FAILED DATA(lt_failed_t017_co)
    REPORTED DATA(lt_reported_t017_co).


  ENDMETHOD.