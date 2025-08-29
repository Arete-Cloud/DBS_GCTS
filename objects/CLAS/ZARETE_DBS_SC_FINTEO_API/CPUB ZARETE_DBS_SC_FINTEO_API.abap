CLASS zarete_dbs_sc_finteo_api DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES:
      BEGIN OF ty_limit_data,
        limitId              TYPE int4,
        identifier           TYPE string,
        partyCode            TYPE string,
        partyTaxNumber       TYPE string,
        partyTitle           TYPE string,
        limit                TYPE p LENGTH 9 DECIMALS 2,
        activeLimit          TYPE p LENGTH 9 DECIMALS 2,
        pendingInvoiceCount  TYPE int4,
        pendingInvoiceAmount TYPE p LENGTH 9 DECIMALS 2,
        bankCode             TYPE string,
        bankName             TYPE string,
        currencyCode         TYPE  string,
      END OF ty_limit_data,

      BEGIN OF ty_limit,
        status        TYPE string,
        statusMessage TYPE string,
        data          TYPE STANDARD TABLE OF ty_limit_data WITH DEFAULT KEY,
      END OF ty_limit,

      BEGIN OF ty_invoice_data,
        identifier                   TYPE string,
        dbsInvoiceId                 TYPE string,
        amount                       TYPE p LENGTH 9 DECIMALS 2,
        currencyCode                 TYPE string,
        dueDate                      TYPE string,
        invoiceNumber                TYPE string,
        invoiceAmountDue             TYPE p LENGTH 9 DECIMALS 2,
        lastPaymentDate              TYPE string,
        partialGuaranteedAmount      TYPE p LENGTH 9 DECIMALS 2,
        amountRemainingBeforePayment TYPE p LENGTH 9 DECIMALS 2,
        paymentDescription           TYPE string,
        statusCode                   TYPE int4,
        statusDescription            TYPE string,
        transactionDate              TYPE string,
        dbsAccountId                 TYPE int4,
        partyCode                    TYPE string,
        partyTitle                   TYPE string,
        partyTaxNumber               TYPE string,
        bankCode                     TYPE string,
        bankName                     TYPE string,
      END OF ty_invoice_data,

      BEGIN OF ty_invoice,
        status        TYPE string,
        statusMessage TYPE string,
        data          TYPE STANDARD TABLE OF ty_invoice_data WITH DEFAULT KEY,
      END OF ty_invoice,

      BEGIN OF ty_upload_invoice_data,
        dbsInvoiceId TYPE string,
      END OF ty_upload_invoice_data,

      BEGIN OF ty_upload_invoice,
        status        TYPE string,
        statusMessage TYPE string,
        data          TYPE ty_upload_invoice_data,
      END OF ty_upload_invoice,

      BEGIN OF ty_delete_invoice,
        status        TYPE string,
        statusMessage TYPE string,
      END OF ty_delete_invoice.

    METHODS:
      constructor RAISING cx_web_message_error,

      is_connection RETURNING VALUE(ev_ok) TYPE abap_boolean,

      get_limit  IMPORTING
                           VALUE(iv_bankid)     TYPE string OPTIONAL
                           VALUE(iv_identifier) TYPE string OPTIONAL
                 RETURNING VALUE(rv_limit)      TYPE ty_limit,


      get_invoice
        IMPORTING VALUE(iv_startdate)         TYPE string
                  VALUE(iv_finishdate)        TYPE string
                  VALUE(iv_bankid)            TYPE string OPTIONAL
                  VALUE(iv_partycode)         TYPE string OPTIONAL
                  VALUE(iv_identifier)        TYPE string OPTIONAL
                  VALUE(iv_dbsinvoiceid)      TYPE string OPTIONAL
                  VALUE(iv_statuscode)        TYPE int4 OPTIONAL
                  VALUE(iv_statusdescription) TYPE string OPTIONAL
        RETURNING VALUE(rv_invoice)           TYPE ty_invoice,

      upload_invoice
        IMPORTING VALUE(iv_bankeftcode)    TYPE string
                  VALUE(iv_partycode)      TYPE string
                  VALUE(iv_identifier)     TYPE string
                  VALUE(iv_amount)         TYPE zarete_dbs_de_finteo_amount
                  VALUE(iv_invoicenumber)  TYPE string
                  VALUE(iv_invoiceduedate) TYPE string
                  VALUE(iv_currencycode)   TYPE string
        RETURNING VALUE(rv_upload_invoice) TYPE ty_upload_invoice,

      update_invoice
        IMPORTING VALUE(iv_bankeftcode)    TYPE string
                  VALUE(iv_partycode)      TYPE string
                  VALUE(iv_identifier)     TYPE string
                  VALUE(iv_amount)         TYPE zarete_dbs_de_finteo_amount
                  VALUE(iv_invoicenumber)  TYPE string
                  VALUE(iv_invoiceduedate) TYPE string
                  VALUE(iv_currencycode)   TYPE string
        RETURNING VALUE(rv_update_invoice) TYPE ty_upload_invoice,

      delete_invoice
        IMPORTING VALUE(iv_invoiceno)      TYPE string
        RETURNING VALUE(rv_delete_invoice) TYPE ty_delete_invoice.

    DATA:
      mo_http_destination TYPE REF TO if_http_destination,
      mv_client           TYPE REF TO if_web_http_client,
      gv_limiturl         TYPE string,
      gv_invoiceurl       TYPE string,
      gv_sendinvoiceurl   TYPE string,
      gv_token            TYPE string.

    METHODS:
      __get_request
        IMPORTING iv_url            TYPE string
        RETURNING VALUE(ro_request) TYPE REF TO if_web_http_request,
      __json2abap
        IMPORTING
          ir_input_data TYPE data
        CHANGING
          cr_abap_data  TYPE data,
      __execute
        IMPORTING
                  i_method           TYPE if_web_http_client=>method
        RETURNING VALUE(ro_response) TYPE REF TO if_web_http_response.



