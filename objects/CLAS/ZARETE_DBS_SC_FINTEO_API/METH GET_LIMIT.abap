  METHOD get_limit.


    DATA(lo_log) = zarete_dbs_cl_log=>get_factory( ).

    TYPES :
      BEGIN OF struct,
        bankid     TYPE    string,
        identifier TYPE    string,
      END OF struct.

    DATA(lo_request) = __get_request( gv_limiturl ).

    DATA(ls_body) = VALUE struct( bankid = iv_bankid
                                  identifier = iv_identifier
                                       ).

    DATA(lv_json) = /ui2/cl_json=>serialize( data        = ls_body
                                             compress    = abap_true
                                             pretty_name = /ui2/cl_json=>pretty_mode-camel_case ).

    lo_request->append_text(
      EXPORTING
        data = lv_json
    ).

    TRY.
        DATA(lo_limit) = __execute(
          i_method = if_web_http_client=>post
        ).

        DATA(lv_json_response) = lo_limit->get_text( ).

        /ui2/cl_json=>deserialize(
          EXPORTING
            json        = lv_json_response
            pretty_name = /ui2/cl_json=>pretty_mode-none
          CHANGING
            data        = rv_limit ).


    ENDTRY.

    IF rv_limit IS INITIAL.
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