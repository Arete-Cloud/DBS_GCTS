  METHOD get_taxnumber.
 DATA(lo_log) = zarete_dbs_cl_log=>get_factory( ).

    DATA lo_filter_factory      TYPE REF TO /iwbep/if_cp_filter_factory.
    DATA lo_filter_node         TYPE REF TO /iwbep/if_cp_filter_node.
    DATA lo_filter_node_root    TYPE REF TO /iwbep/if_cp_filter_node.
    DATA lo_expand_root         TYPE REF TO /iwbep/if_cp_expand_node.
    DATA lo_expand              TYPE REF TO /iwbep/if_cp_expand_node.

    DATA:lt_business_data TYPE TABLE OF ty_data.



    TRY.
        lo_expand_root = go_request->create_expand_node( ).
        lo_expand = lo_expand_root->add_expand( 'TO_BUSINESS_PARTNER_TAX' ).
      CATCH /iwbep/cx_gateway.
        CLEAR lo_expand_root.
    ENDTRY.
    " Execute the request and retrieve the business data
    TRY.

        IF it_filter IS NOT INITIAL.
          lo_filter_factory = go_request->create_filter_factory( ).
          LOOP AT it_filter INTO DATA(ls_range).
            lo_filter_node  = lo_filter_factory->create_by_range( iv_property_path     = ls_range-name
                                                                  it_range             = ls_range-range ).
            IF lo_filter_node_root IS INITIAL.
              lo_filter_node_root = lo_filter_node.
            ELSE.
              lo_filter_node_root = lo_filter_node_root->and( lo_filter_node ).
            ENDIF.
          ENDLOOP.
          go_request->set_filter( lo_filter_node_root ).
          " Create the filter tree

        ENDIF.

        go_response = go_request->execute( ).
        go_response->get_business_data( IMPORTING et_business_data = lt_business_data ).
        MOVE-CORRESPONDING lt_business_data TO et_business_data.
 CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        DATA(lv_error_msj) = lx_remote->get_longtext(  ).

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


    ENDTRY.


  ENDMETHOD.