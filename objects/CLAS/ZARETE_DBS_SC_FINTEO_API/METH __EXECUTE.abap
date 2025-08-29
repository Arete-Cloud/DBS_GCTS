  METHOD __execute.

    DATA(lo_log) = zarete_dbs_cl_log=>get_factory( ).
    TRY.
        ro_response = mv_client->execute( i_method = i_method ).
        DATA(response_body) = ro_response->get_text( ).
        DATA(response_headers) = ro_response->get_header_fields( ).
      CATCH cx_web_message_error INTO DATA(lo_message_error).

        DATA(lv_error_msj) = lo_message_error->get_longtext( ).

        lo_log->add_log( msgty = if_abap_behv_message=>severity-error
                         msgno = lo_message_error->if_t100_message~t100key-msgno
                         msgid = lo_message_error->if_t100_message~t100key-msgid
                         msgv1 = lo_message_error->if_t100_dyn_msg~msgv1
                         msgv2 = lo_message_error->if_t100_dyn_msg~msgv2
                         msgv3 = lo_message_error->if_t100_dyn_msg~msgv3
                         msgv4 = lo_message_error->if_t100_dyn_msg~msgv4
                         msgtx = lv_error_msj ).

      CATCH cx_web_http_client_error INTO DATA(lo_http_error).

        lv_error_msj = lo_http_error->get_longtext( ).
        lo_log->add_log( msgty = if_abap_behv_message=>severity-error
                         msgno = lo_http_error->if_t100_message~t100key-msgno
                         msgid = lo_http_error->if_t100_message~t100key-msgid
                         msgv1 = lo_http_error->if_t100_dyn_msg~msgv1
                         msgv2 = lo_http_error->if_t100_dyn_msg~msgv2
                         msgv3 = lo_http_error->if_t100_dyn_msg~msgv3
                         msgv4 = lo_http_error->if_t100_dyn_msg~msgv4
                         msgtx = lv_error_msj ).


    ENDTRY.

  ENDMETHOD.