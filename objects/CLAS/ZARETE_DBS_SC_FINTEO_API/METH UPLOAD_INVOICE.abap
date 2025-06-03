  METHOD upload_invoice.


    DATA(lo_log) = zarete_dbs_cl_log=>get_factory( ).

    TYPES :
      BEGIN OF struct,
        bankeftcode    TYPE    string,
        partycode      TYPE    string,
        identifier     TYPE    string,
        amount         TYPE    zarete_dbs_de_finteo_amount,
        invoicenumber  TYPE    string,
        invoiceduedate TYPE    string,
        currencycode   TYPE    string,
      END OF struct.

    DATA(lo_request) = __get_request( gv_invoiceurl ).

    DATA(ls_body) = VALUE struct( bankeftcode = iv_bankeftcode
                                  partycode = iv_partycode
                                  identifier = iv_identifier
                                  amount = iv_amount
                                  invoicenumber = iv_invoicenumber
                                  invoiceduedate = iv_invoiceduedate
                                  currencycode = iv_currencycode
                                       ).

    DATA(lv_json) = /ui2/cl_json=>serialize( data        = ls_body
                                             compress    = abap_true
                                             pretty_name = /ui2/cl_json=>pretty_mode-camel_case ).

    lo_request->append_text(
      EXPORTING
        data = lv_json
    ).

    TRY.
        DATA(lo_invoice) = __execute(
          i_method = if_web_http_client=>put
        ).

        DATA(lv_json_response) = lo_invoice->get_text( ).

        /ui2/cl_json=>deserialize(
          EXPORTING
            json        = lv_json_response
            pretty_name = /ui2/cl_json=>pretty_mode-none
          CHANGING
            data        = rv_upload_invoice ).


    ENDTRY.

    IF rv_upload_invoice IS INITIAL.
      lo_log->add_log(
                   msgno = '002'
                   msgty = if_abap_behv_message=>severity-information
                 ).
    ELSE.
      lo_log->add_log(
              msgno = '004'
              msgty = if_abap_behv_message=>severity-success
            ).
    ENDIF.


  ENDMETHOD. "#EC CI_VALPAR