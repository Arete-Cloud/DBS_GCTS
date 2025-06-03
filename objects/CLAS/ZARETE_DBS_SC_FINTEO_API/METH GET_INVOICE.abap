  METHOD get_invoice.


    DATA(lo_log) = zarete_dbs_cl_log=>get_factory( ).

    TYPES :
      BEGIN OF struct,
        startdate         TYPE    string,
        finishdate           TYPE    string,
        bankid            TYPE    string,
        partycode         TYPE    string,
        identifier        TYPE    string,
        dbsinvoiceid      TYPE    string,
        statuscode        TYPE    int4,
        statusdescription TYPE    string,
      END OF struct.

    DATA(lo_request) = __get_request( gv_invoiceurl ).

    DATA(ls_body) = VALUE struct( startdate = iv_startdate
                                  finishdate = iv_finishdate
                                  bankid = iv_bankid
                                  partycode = iv_partycode
                                  identifier = iv_identifier
                                  dbsinvoiceid = iv_dbsinvoiceid
                                  statuscode = iv_statuscode
                                  statusdescription = iv_statusdescription
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
          i_method = if_web_http_client=>post
        ).

        DATA(lv_json_response) = lo_invoice->get_text( ).

        /ui2/cl_json=>deserialize(
          EXPORTING
            json        = lv_json_response
            pretty_name = /ui2/cl_json=>pretty_mode-none
          CHANGING
            data        = rv_invoice ).


    ENDTRY.

    IF rv_invoice IS INITIAL.
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