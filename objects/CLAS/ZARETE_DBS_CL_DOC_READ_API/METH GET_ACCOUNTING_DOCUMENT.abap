  METHOD get_accounting_document.


    DATA(lo_log) = zarete_dbs_cl_log=>get_factory( ).
    DATA: lt_data          TYPE TABLE OF zarete_dbs_dd_doc_read_001,
          ls_data          TYPE zarete_dbs_dd_doc_read_001,
          lt_business_data TYPE zarete_dbs_sc_doc_read_api=>tyt_a_operational_acctg_doc__2.


    DATA lo_filter_factory      TYPE REF TO /iwbep/if_cp_filter_factory.
    DATA lo_filter_node         TYPE REF TO /iwbep/if_cp_filter_node.
    DATA lo_filter_node_root    TYPE REF TO /iwbep/if_cp_filter_node.
    DATA lo_expand_root         TYPE REF TO /iwbep/if_cp_expand_node.
    DATA lo_expand              TYPE REF TO /iwbep/if_cp_expand_node.
    DATA  lo_filter_node_1      TYPE REF TO /iwbep/if_cp_filter_node.
    DATA lt_range TYPE RANGE OF string.

    DATA:  filter_range TYPE if_rap_query_filter=>tt_name_range_pairs.

    TRY.

        filter_range = VALUE #( ( name = 'DEBIT_CREDIT_CODE'        range = VALUE #( ( sign = 'I' option = 'EQ' low = 'H'  ) ) )
*                               ( name = 'PAYMENT_METHOD'           range = VALUE #( ( sign = 'I' option = 'EQ' low = 'H'  ) ) )
                                ( name = 'IS_CLEARED'               range = VALUE #( ( sign = 'I' option = 'EQ' low = ' '  ) ) )
                                ( name = 'IS_REVERSED'              range = VALUE #( ( sign = 'I' option = 'EQ' low = ' '  ) ) )
                                ( name = 'ACCOUNTING_DOCUMENT_TYPE' range = VALUE #( ( sign = 'I' option = 'EQ' low = 'DZ' ) ) )
*                                ( name = 'LEDGER'                   range = VALUE #( ( sign = 'I' option = 'EQ' low = '0L' ) ) )
                               ).

        IF it_filter IS NOT INITIAL.
          APPEND LINES OF it_filter TO filter_range.
        ENDIF.

        IF filter_range IS NOT INITIAL.
*
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


        go_response = go_request->execute( ).
        go_response->get_business_data( IMPORTING et_business_data = lt_business_data ).


        IF lt_business_data IS NOT INITIAL.

          LOOP AT lt_business_data INTO DATA(ls_business_data).

            MOVE-CORRESPONDING ls_business_data TO ls_data.
            APPEND ls_data TO lt_data.
          ENDLOOP.

        ENDIF.

        et_business_data = lt_data.

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