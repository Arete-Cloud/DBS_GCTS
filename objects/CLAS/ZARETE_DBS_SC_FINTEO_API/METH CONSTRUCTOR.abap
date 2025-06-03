  METHOD constructor.
    TYPES:
      BEGIN OF ty_token_json,
        access_token  TYPE string,
        token_type    TYPE string,
        id_token      TYPE string,
        refresh_token TYPE string,
        expires_in    TYPE i,
        scope         TYPE string,
        jti           TYPE string,
      END OF ty_token_json.

    TRY.
        DATA(lo_log) = zarete_dbs_cl_log=>get_factory( ).
        DATA lr_cscn TYPE if_com_scenario_factory=>ty_query-cscn_id_range. " communication scenario objects
        DATA(lo_factory) = cl_com_arrangement_factory=>create_instance( ).

        lr_cscn = VALUE #( ( sign = 'I' option = 'EQ' low = 'ZARETE_DBS_CS_FINTEO' ) ). "#EC *

        lo_factory->query_ca( EXPORTING is_query           = VALUE #( cscn_id_range = lr_cscn )
                              IMPORTING et_com_arrangement = DATA(lt_ca) ).

        READ TABLE lt_ca INTO DATA(lo_ca) INDEX 1.

        DATA(lt_properties) = lo_ca->get_properties( ).

        LOOP AT lt_properties INTO DATA(ls_property).
          CASE ls_property-name.

            WHEN 'INVOICE URL'.
              gv_invoiceurl = ls_property-values[ 1 ].
            WHEN 'LIMIT URL'.
              gv_limiturl = ls_property-values[ 1 ].
            WHEN 'USERNAME'.
              DATA(lv_username) = ls_property-values[ 1 ].
            WHEN 'PASSWORD'.
              DATA(lv_password) = ls_property-values[ 1 ].
          ENDCASE.
        ENDLOOP.

        mo_http_destination = cl_http_destination_provider=>create_by_comm_arrangement(
          comm_scenario  = 'ZARETE_DBS_CS_FINTEO'
          service_id     = 'ZARETE_DBS_FINTEO_API_REST'
          comm_system_id = lo_ca->get_comm_system_id( ) ).

        mv_client = cl_web_http_client_manager=>create_by_http_destination( mo_http_destination ).

        DATA(request) = mv_client->get_http_request( ).
        DATA(body) = |grant_type=password&username={ lv_username }&password={ lv_password }|. "#EC *

        request->set_header_fields( VALUE #( ( name  = 'Content-Type'
                                               value = 'application/x-www-form-urlencoded; charset=UTF-8' ) "#EC *
                                             ( name  = 'Accept' "#EC *
                                               value = 'application/json' ) "#EC *
                                             ( name  = 'Content-Length' "#EC *
                                               value = strlen( body ) ) ) ).

        request->append_text( body ).
        DATA(token_response) = mv_client->execute( if_web_http_client=>post ).
        DATA(token) = VALUE ty_token_json( ).
        " TODO: variable is assigned but never used (ABAP cleaner)
        DATA(response) = token_response->get_text( ).
        /ui2/cl_json=>deserialize( EXPORTING json = token_response->get_text( )
                                   CHANGING  data = token ).

        IF token-access_token IS INITIAL.
          RAISE EXCEPTION TYPE cx_web_message_error
                MESSAGE ID 'ZARETE_DBS_MC_001'
                TYPE 'E'
                NUMBER '001'.
        ENDIF.

        gv_token = |Bearer { token-access_token }|.         "#EC *

      CATCH cx_web_message_error INTO DATA(lt_webmessage_error).
        DATA(lv_error_msj) = lt_webmessage_error->get_longtext( ).

        lo_log->add_log( msgty = if_abap_behv_message=>severity-error
                         msgno = lt_webmessage_error->if_t100_message~t100key-msgno
                         msgid = lt_webmessage_error->if_t100_message~t100key-msgid
                         msgv1 = lt_webmessage_error->if_t100_dyn_msg~msgv1
                         msgv2 = lt_webmessage_error->if_t100_dyn_msg~msgv2
                         msgv3 = lt_webmessage_error->if_t100_dyn_msg~msgv3
                         msgv4 = lt_webmessage_error->if_t100_dyn_msg~msgv4
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

      CATCH cx_http_dest_provider_error INTO DATA(lt_provider_error).

        lv_error_msj = lt_provider_error->get_longtext( ).
        lo_log->add_log( msgty = if_abap_behv_message=>severity-error
                         msgno = lt_provider_error->if_t100_message~t100key-msgno
                         msgid = lt_provider_error->if_t100_message~t100key-msgid
                         msgv1 = lt_provider_error->if_t100_dyn_msg~msgv1
                         msgv2 = lt_provider_error->if_t100_dyn_msg~msgv2
                         msgv3 = lt_provider_error->if_t100_dyn_msg~msgv3
                         msgv4 = lt_provider_error->if_t100_dyn_msg~msgv4
                         msgtx = lv_error_msj ).

    ENDTRY.
  ENDMETHOD.