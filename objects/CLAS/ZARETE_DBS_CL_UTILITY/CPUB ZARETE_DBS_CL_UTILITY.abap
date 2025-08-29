CLASS zarete_dbs_cl_utility DEFINITION
  PUBLIC
  INHERITING FROM cl_abap_behv
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF ty_fi_docu,
             reference_id        TYPE string,
             accounting_document TYPE zarete_dbs_accounting_document,
             company_code        TYPE zarete_dbs_company_code_id,
             fiscal_year         TYPE zarete_dbs_fiscal_year_id,
           END OF ty_fi_docu.

    TYPES: BEGIN OF ty_inv_details,
             invoice_number       TYPE zarete_dbs_t015-invoice_number,
             id                   TYPE zarete_dbs_t015-id,
             bp_no                TYPE zarete_dbs_t012-bp_no,
             posting_date         TYPE string,
             document_date        TYPE string,
             assignment_reference TYPE zarete_dbs_t017-assignment_reference,
             value_date           TYPE zarete_dbs_t017-value_date,
             document_text        TYPE string,
             amount               TYPE p LENGTH 9 DECIMALS 2,
             currency_code        TYPE string,
           END OF ty_inv_details.

    TYPES: BEGIN OF ty_selected_invoices,
             invoice_number         TYPE zarete_dbs_dd_t015-InvoiceNumber,
             partial_invoice_number TYPE zarete_dbs_dd_t016-PartialInvoiceNumber,
             id                     TYPE zarete_dbs_dd_t015-Id,
             bank_code              TYPE zarete_dbs_dd_t012-CompanyBankCode,
             amount                 TYPE zarete_dbs_dd_t016-Amount,
             currency               TYPE zarete_dbs_dd_t016-CurrencyCode,
             customer               TYPE zarete_dbs_dd_t017-Customer,
             message                TYPE char72,
           END OF ty_selected_invoices.

    TYPES: tt_fi_documents      TYPE STANDARD TABLE OF ty_fi_docu WITH DEFAULT KEY,
           tt_selected_invoices TYPE STANDARD TABLE OF ty_selected_invoices WITH DEFAULT KEY.

    METHODS:
      constructor, "fi belgesinin oluşması için constructor
      run, "job kurulacak ana method
      journal_entry_create IMPORTING is_request         TYPE zarete_dbs_journal_entry_bulk OPTIONAL
                           EXPORTING ev_document_number TYPE string
                                     ev_company_code    TYPE string
                                     ev_fiscal_year     TYPE string
                                     et_fi_documents    TYPE tt_fi_documents
                                     et_message         TYPE zarete_dbs_tt_message,
      journal_entry_test_mode IMPORTING is_request TYPE zarete_dbs_journal_entry_bulk OPTIONAL
                              EXPORTING et_message TYPE zarete_dbs_tt_message,
      get_invoices IMPORTING VALUE(iv_startdate)         TYPE string
                             VALUE(iv_finishdate)        TYPE string
                             VALUE(iv_bankid)            TYPE string OPTIONAL
                             VALUE(iv_partycode)         TYPE string OPTIONAL
                             VALUE(iv_identifier)        TYPE string OPTIONAL
                             VALUE(iv_dbsinvoiceid)      TYPE string OPTIONAL
                             VALUE(iv_statuscode)        TYPE int4   OPTIONAL
                             VALUE(iv_statusdescription) TYPE string OPTIONAL,
      customer_bank IMPORTING is_business_partner TYPE zarete_dbs_t012 OPTIONAL
                              is_invoice_details  TYPE ty_inv_details OPTIONAL
                    EXPORTING ev_document_number  TYPE string
                              ev_company_code     TYPE string
                              ev_fiscal_year      TYPE string
                              et_message          TYPE zarete_dbs_tt_message,
      customer_bank_mapping IMPORTING is_business_partner TYPE zarete_dbs_t012 OPTIONAL
                                      is_invoice_details  TYPE ty_inv_details OPTIONAL
                            EXPORTING es_map              TYPE zarete_dbs_journal_entry_cre18,
      create_number_range_interval EXPORTING ev_error TYPE c,
      get_number_next EXPORTING ev_number TYPE char7,
      bp_list,
      bank_list,
      update_due_date IMPORTING iv_invoice_number TYPE zarete_dbs_t015-invoice_number
                                iv_due_date       TYPE string,
      send_invoice CHANGING ct_invoices TYPE  tt_selected_invoices,
      delete_invoice CHANGING ct_invoices TYPE tt_selected_invoices,
      create_acc_doc CHANGING ct_invoices TYPE tt_selected_invoices.

