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
    TYPES: tt_fi_documents    TYPE STANDARD TABLE OF ty_fi_docu WITH DEFAULT KEY.

    METHODS:
      constructor, "fı belgesinin oluşması için constructor
      run, "job kurulacak ana method
      journal_entry_create IMPORTING is_request         TYPE zarete_dbs_journal_entry_bulk OPTIONAL
                           EXPORTING ev_document_number TYPE string
                                     ev_company_code    TYPE string
                                     ev_fiscal_year     TYPE string
                                     et_fi_documents    TYPE tt_fi_documents
                                     et_message         TYPE zarete_dbs_tt_message,
      journal_entry_test_mode IMPORTING is_request TYPE zarete_dbs_journal_entry_bulk OPTIONAL
                              EXPORTING et_message TYPE zarete_dbs_tt_message.

