  METHOD delete_invoice.

    DATA(lo_log) = zarete_dbs_cl_log=>get_factory( ).

    DATA(lv_sendinvoiceurl) = CONV string( gv_sendinvoiceurl && '/' && iv_invoiceno ).
    DATA(lo_request) = __get_request( lv_sendinvoiceurl ).

    TRY.
        DATA(lo_invoice) = __execute(
          i_method = if_web_http_client=>delete
        ).

        DATA(lv_json_response) = lo_invoice->get_text( ).

        /ui2/cl_json=>deserialize(
          EXPORTING
            json        = lv_json_response
            pretty_name = /ui2/cl_json=>pretty_mode-none
          CHANGING
            data        = rv_delete_invoice ).

    ENDTRY.

*    IF rv_delete_invoice IS INITIAL.
*      lo_log->add_log(
*                   msgno = '002'
*                   msgty = if_abap_behv_message=>severity-information
*                 ).
*    ELSE.
*      lo_log->add_log(
*              msgno = '004'
*              msgty = if_abap_behv_message=>severity-success
*            ).
*    ENDIF.

  ENDMETHOD.