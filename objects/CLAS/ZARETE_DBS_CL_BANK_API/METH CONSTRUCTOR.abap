  METHOD constructor.
    DATA(lo_log) = zarete_dbs_cl_log=>get_factory( ).
    TRY.
        " Create http client
        DATA(go_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
                                                     comm_scenario  = 'ZARETE_DBS_CS_S4HANA'
                                                     service_id     = 'ZARETE_DBS_BANK_REST' ).

        go_http_client = cl_web_http_client_manager=>create_by_http_destination( go_destination ).

        go_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZARETE_DBS_SC_BANK_API'
                                                 proxy_model_version = '0001' )
            io_http_client             = go_http_client
            iv_relative_service_root   = '' ).

        ASSERT go_http_client IS BOUND.


        " Navigate to the resource and create a request for the read operation
        go_request = go_client_proxy->create_resource_for_entity_set( 'BANK_ADDRESS' )->create_request_for_read( ).

      CATCH cx_http_dest_provider_error INTO DATA(lx_dest_provider_error).
        DATA(lv_error_msj) = lx_dest_provider_error->get_longtext(  ).
        lo_log->add_log( msgty = if_abap_behv_message=>severity-error
                         msgno = lx_dest_provider_error->if_t100_message~t100key-msgno
                         msgid = lx_dest_provider_error->if_t100_message~t100key-msgid
                         msgv1 = lx_dest_provider_error->if_t100_dyn_msg~msgv1
                         msgv2 = lx_dest_provider_error->if_t100_dyn_msg~msgv2
                         msgv3 = lx_dest_provider_error->if_t100_dyn_msg~msgv3
                         msgv4 = lx_dest_provider_error->if_t100_dyn_msg~msgv4
                         msgtx = lv_error_msj ).

      CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).

        lv_error_msj = lx_web_http_client_error->get_longtext(  ).
        lo_log->add_log( msgty = if_abap_behv_message=>severity-error
                         msgno = lx_web_http_client_error->if_t100_message~t100key-msgno
                         msgid = lx_web_http_client_error->if_t100_message~t100key-msgid
                         msgv1 = lx_web_http_client_error->if_t100_dyn_msg~msgv1
                         msgv2 = lx_web_http_client_error->if_t100_dyn_msg~msgv2
                         msgv3 = lx_web_http_client_error->if_t100_dyn_msg~msgv3
                         msgv4 = lx_web_http_client_error->if_t100_dyn_msg~msgv4
                         msgtx = lv_error_msj ).

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway) .

        lv_error_msj = lx_gateway->get_longtext( ).
        lo_log->add_log( msgty = if_abap_behv_message=>severity-error
                         msgno = lx_gateway->if_t100_message~t100key-msgno
                         msgid = lx_gateway->if_t100_message~t100key-msgid
                         msgv1 = CONV #( lx_gateway->if_t100_message~t100key-attr1 )
                         msgv2 = CONV #( lx_gateway->if_t100_message~t100key-attr2 )
                         msgv3 = CONV #( lx_gateway->if_t100_message~t100key-attr3 )
                         msgv4 = CONV #( lx_gateway->if_t100_message~t100key-attr4 )
                         msgtx = lv_error_msj ).
    ENDTRY.

  ENDMETHOD.