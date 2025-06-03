  METHOD __get_request.

    CLEAR: mv_client, mo_http_destination.
    DATA(lo_log) = zarete_dbs_cl_log=>get_factory( ).

    TRY.
        mo_http_destination = cl_http_destination_provider=>create_by_url( i_url = iv_url ).

        mv_client = cl_web_http_client_manager=>create_by_http_destination( mo_http_destination ).

        ro_request = mv_client->get_http_request( ).

        ro_request->set_header_field(
          i_name  = 'Authorization'                         "#EC *
          i_value = gv_token ).


        ro_request->set_header_fields( VALUE #(
          ( name = 'Accept' value = 'application/json, text/plain, */*'  )      ##NO_TEXT
          ( name = 'Content-Type' value = 'application/json;charset=utf-8'  )   ##NO_TEXT
        ) ).

      CATCH cx_http_dest_provider_error INTO DATA(lt_provider_error).

        DATA(lv_error_msj)  = lt_provider_error->get_longtext( ).
        lo_log->add_log( msgty = if_abap_behv_message=>severity-error
                         msgno = lt_provider_error->if_t100_message~t100key-msgno
                         msgid = lt_provider_error->if_t100_message~t100key-msgid
                         msgv1 = lt_provider_error->if_t100_dyn_msg~msgv1
                         msgv2 = lt_provider_error->if_t100_dyn_msg~msgv2
                         msgv3 = lt_provider_error->if_t100_dyn_msg~msgv3
                         msgv4 = lt_provider_error->if_t100_dyn_msg~msgv4
                         msgtx = lv_error_msj ).



      CATCH cx_web_http_client_error INTO DATA(lt_client_error).
        lv_error_msj = lt_client_error->get_longtext( ).
        lo_log->add_log( msgty = if_abap_behv_message=>severity-error
                         msgno = lt_client_error->if_t100_message~t100key-msgno
                         msgid = lt_client_error->if_t100_message~t100key-msgid
                         msgv1 = lt_client_error->if_t100_dyn_msg~msgv1
                         msgv2 = lt_client_error->if_t100_dyn_msg~msgv2
                         msgv3 = lt_client_error->if_t100_dyn_msg~msgv3
                         msgv4 = lt_client_error->if_t100_dyn_msg~msgv4
                         msgtx = lv_error_msj ).
    ENDTRY.



  ENDMETHOD.