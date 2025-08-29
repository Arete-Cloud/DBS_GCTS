  METHOD if_rap_query_provider~select.

     DATA mc_request_aggregation TYPE REF TO if_rap_query_aggregation.
    DATA mc_request_filter      TYPE REF TO if_rap_query_filter.
    DATA mc_request_paging      TYPE REF TO if_rap_query_paging.
    DATA mv_request_page_size   TYPE i VALUE 100.
    DATA mv_request_offset      TYPE i.
    DATA mv_entity_cds          TYPE string.
    DATA mv_entity_name         TYPE string.
    DATA lo_filter_factory      TYPE REF TO /iwbep/if_cp_filter_factory.
    DATA lo_filter_node         TYPE REF TO /iwbep/if_cp_filter_node.
    DATA lo_filter_node_root    TYPE REF TO /iwbep/if_cp_filter_node.
    DATA lt_range               TYPE RANGE OF string.
    DATA ls_business_data       TYPE REF TO data.
    DATA lt_business_data       TYPE REF TO data.


    FIELD-SYMBOLS : <fs_business_data> TYPE any .
    FIELD-SYMBOLS : <ft_business_data> TYPE STANDARD TABLE.

    mv_entity_cds          = io_request->get_entity_id( ).
    mc_request_aggregation = io_request->get_aggregation(  ).
    mc_request_filter      = io_request->get_filter( ).
    mc_request_paging      = io_request->get_paging( ).
    mv_request_page_size   = mc_request_paging->get_page_size( ).
    mv_request_offset      = mc_request_paging->get_offset( ).
    DATA(mc_request_sort)  = io_request->get_sort_elements(  ).

    DATA(lo_log) = zarete_dbs_cl_log=>get_factory( ).

    CREATE DATA ls_business_data TYPE (mv_entity_cds).
    ASSIGN ls_business_data->* TO <fs_business_data>.

    CREATE DATA lt_business_data TYPE TABLE OF (mv_entity_cds).
    ASSIGN lt_business_data->* TO <ft_business_data>.

 TRY.
        DATA(filter_range) =  mc_request_filter->get_as_ranges(  ).
        " Create http client

        IF filter_range IS NOT INITIAL.
          lo_filter_factory = go_request->create_filter_factory( ).
          LOOP AT filter_range INTO DATA(ls_range).
            lo_filter_node  = lo_filter_factory->create_by_range( iv_property_path     = ls_range-name
                                                                  it_range             = ls_range-range ).
            IF lo_filter_node_root IS INITIAL.
              lo_filter_node_root = lo_filter_node.
            ELSE.
              lo_filter_node_root = lo_filter_node_root->and( lo_filter_node ).
            ENDIF.
          ENDLOOP.
          " Create the filter tree

          go_request->set_filter( lo_filter_node_root ).

        ENDIF.
        go_request->set_top( mv_request_page_size )->set_skip( mv_request_offset ).

        go_response = go_request->execute( ).
         go_response->get_business_data( IMPORTING et_business_data = gt_business_data ).

          IF gt_business_data IS NOT INITIAL.

          LOOP AT gt_business_data INTO DATA(ls_data).

            MOVE-CORRESPONDING ls_data TO <fs_business_data>.
            APPEND <fs_business_data> TO <ft_business_data>.

          ENDLOOP.

          io_response->set_data( it_data = <ft_business_data> ).
          io_response->set_total_number_of_records( iv_total_number_of_records = lines( <ft_business_data> ) ).

  ENDIF.

   CATCH cx_rap_query_filter_no_range INTO DATA(lx_filter).
        DATA(lv_error_msj) = lx_filter->get_longtext(  ).
        lo_log->add_log( msgty = if_abap_behv_message=>severity-error
                         msgno = lx_filter->if_t100_message~t100key-msgno
                         msgid = lx_filter->if_t100_message~t100key-msgid
                         msgv1 = lx_filter->if_t100_dyn_msg~msgv1
                         msgv2 = lx_filter->if_t100_dyn_msg~msgv2
                         msgv3 = lx_filter->if_t100_dyn_msg~msgv3
                         msgv4 = lx_filter->if_t100_dyn_msg~msgv4
                         msgtx = lv_error_msj ).



        "handle exception
      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        lv_error_msj = lx_remote->get_longtext(  ).

        lo_log->add_log( msgty = if_abap_behv_message=>severity-error
                         msgno = lx_remote->if_t100_message~t100key-msgno
                         msgid = lx_remote->if_t100_message~t100key-msgid
                         msgv1 = CONV #( lx_remote->if_t100_message~t100key-attr1 )
                         msgv2 = CONV #( lx_remote->if_t100_message~t100key-attr2 )
                         msgv3 = CONV #( lx_remote->if_t100_message~t100key-attr3 )
                         msgv4 = CONV #( lx_remote->if_t100_message~t100key-attr4 )
                         msgtx = lv_error_msj ).

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).

        lv_error_msj = lx_gateway->get_longtext( ).
        lo_log->add_log( msgty = if_abap_behv_message=>severity-error
                         msgno = lx_gateway->if_t100_message~t100key-msgno
                         msgid = lx_gateway->if_t100_message~t100key-msgid
                         msgv1 = CONV #( lx_gateway->if_t100_message~t100key-attr1 )
                         msgv2 = CONV #( lx_gateway->if_t100_message~t100key-attr2 )
                         msgv3 = CONV #( lx_gateway->if_t100_message~t100key-attr3 )
                         msgv4 = CONV #( lx_gateway->if_t100_message~t100key-attr4 )
                         msgtx = lv_error_msj ).


      CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).

        lv_error_msj = lx_web_http_client_error->get_longtext( ).
        lo_log->add_log( msgty = if_abap_behv_message=>severity-error
                         msgno = lx_web_http_client_error->if_t100_message~t100key-msgno
                         msgid = lx_web_http_client_error->if_t100_message~t100key-msgid
                         msgv1 = lx_web_http_client_error->if_t100_dyn_msg~msgv1
                         msgv2 = lx_web_http_client_error->if_t100_dyn_msg~msgv2
                         msgv3 = lx_web_http_client_error->if_t100_dyn_msg~msgv3
                         msgv4 = lx_web_http_client_error->if_t100_dyn_msg~msgv4
                         msgtx = lv_error_msj ).

        RAISE SHORTDUMP lx_web_http_client_error.
    ENDTRY.


  ENDMETHOD.