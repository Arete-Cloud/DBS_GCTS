  METHOD if_rap_query_provider~select.

    DATA: lt_limit     TYPE zarete_dbs_sc_finteo_api=>ty_limit,
          lt_limit_tmp TYPE zarete_dbs_sc_finteo_api=>ty_limit.

    DATA(lo_finteo_lmt) = NEW zarete_dbs_sc_finteo_api( ).

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


    CASE mv_entity_cds.
      WHEN 'ZARETE_DBS_DD_FINTEO_LMT_001'.
        io_request->is_total_numb_of_rec_requested(
          RECEIVING
            rv_is_requested = DATA(lv_numb) ).

        IF lv_numb = abap_true.

          SELECT * FROM zarete_dbs_t014 INTO TABLE @DATA(lt_t014).

          LOOP AT lt_t014 ASSIGNING FIELD-SYMBOL(<fs_t014>).

            lo_finteo_lmt->get_limit(
            EXPORTING
            iv_identifier = <fs_t014>-company_identifier
            RECEIVING
            rv_limit      = lt_limit_tmp ).

            IF lt_limit_tmp-status EQ 'OK'.

              me->fill_t013( it_limit = lt_limit iv_company_code = <fs_t014>-company_code ).
              APPEND LINES OF lt_limit_tmp-data TO lt_limit-data.

            ELSE.

              RAISE EXCEPTION NEW zarete_dbs_cl_error( msgid  = 'ZARETE_DBS_MC_001'
                                                       msgno  = '012'
                                                       iv_msg = lt_limit_tmp-statusmessage
                                                       ).

            ENDIF.

          ENDLOOP.

        ENDIF.

    ENDCASE.

    IF lt_limit-data IS NOT INITIAL.

      LOOP AT lt_limit-data INTO DATA(ls_data).
        MOVE-CORRESPONDING ls_data TO <fs_business_data>.
        ASSIGN COMPONENT 'limit' OF STRUCTURE <fs_business_data> TO FIELD-SYMBOL(<fs_toplamlimit>).
        IF sy-subrc EQ 0.
          ASSIGN COMPONENT 'activeLimit' OF STRUCTURE <fs_business_data> TO FIELD-SYMBOL(<fs_kalanlimit>).
          IF sy-subrc EQ 0.
            ASSIGN COMPONENT 'kullanilanLimit' OF STRUCTURE <fs_business_data> TO FIELD-SYMBOL(<fs_kullanilanlimit>).
            IF sy-subrc EQ 0.
              <fs_kullanilanlimit> = <fs_toplamlimit> - <fs_kalanlimit>.
            ENDIF.
          ENDIF.
        ENDIF.

        READ ENTITIES OF zarete_dbs_dd_t012
        ENTITY t012
        ALL FIELDS WITH VALUE #( ( CompanyIdentifier = ls_data-identifier
                                   LimitId           = ls_data-limitid
                                   %control-PartyTaxNumber = ls_data-partytaxnumber ) )
        RESULT DATA(lt_t012).

        READ TABLE lt_t012 ASSIGNING FIELD-SYMBOL(<fs_t012>) WITH KEY CompanyIdentifier = ls_data-identifier
                                                                      PartyTaxNumber    = ls_data-partytaxnumber
                                                                      LimitId           = ls_data-limitid.
        IF sy-subrc EQ 0.
          ASSIGN COMPONENT 'BPNO' OF STRUCTURE <fs_business_data> TO FIELD-SYMBOL(<fs_bpno>).
          IF sy-subrc EQ 0.
            <fs_bpno> = <fs_t012>-BpNo.
          ENDIF.
          ASSIGN COMPONENT 'BPNAME' OF STRUCTURE <fs_business_data> TO FIELD-SYMBOL(<fs_bpname>).
          IF sy-subrc EQ 0.
            <fs_bpname> = <fs_t012>-BpName.
          ENDIF.
          ASSIGN COMPONENT 'BPTAXNUMBER' OF STRUCTURE <fs_business_data> TO FIELD-SYMBOL(<fs_bptaxno>).
          IF sy-subrc EQ 0.
            <fs_bptaxno> = <fs_t012>-BpTaxNumber.
          ENDIF.
        ENDIF.

        APPEND <fs_business_data> TO <ft_business_data>.

        CLEAR <fs_business_data>.
      ENDLOOP.

      DATA(filter_range) =  mc_request_filter->get_as_ranges(  ).

      LOOP AT filter_range ASSIGNING FIELD-SYMBOL(<fs_filter>).
        LOOP AT <ft_business_data> ASSIGNING FIELD-SYMBOL(<fs_limit>).
          ASSIGN COMPONENT <fs_filter>-name OF STRUCTURE <fs_limit> TO FIELD-SYMBOL(<fs_value>).
          IF sy-subrc EQ 0.
            IF <fs_value> NOT IN <fs_filter>-range.
              DELETE <ft_business_data>.
            ENDIF.
          ENDIF.
        ENDLOOP.
      ENDLOOP.

    ENDIF.

    io_response->set_data( it_data = <ft_business_data> ).
    io_response->set_total_number_of_records( iv_total_number_of_records = lines( <ft_business_data> ) ).

  ENDMETHOD.