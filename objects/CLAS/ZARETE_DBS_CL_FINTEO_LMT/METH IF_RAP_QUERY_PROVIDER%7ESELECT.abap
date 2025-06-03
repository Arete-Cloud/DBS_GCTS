  METHOD if_rap_query_provider~select.

    DATA lt_limit TYPE zarete_dbs_sc_finteo_api=>ty_limit.

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
            rv_is_requested = data(lv_numb)
        ).
        if lv_numb = abap_true.
          lo_finteo_lmt->get_limit(
      EXPORTING
        iv_identifier = '5760511994'
      RECEIVING
        rv_limit      = lt_limit ).

          me->fill_t013( it_limit = lt_limit ).
        ENDIF.
    ENDCASE.

    IF lt_limit-data IS NOT INITIAL.

      LOOP AT lt_limit-data INTO DATA(ls_data).
        MOVE-CORRESPONDING ls_data TO <fs_business_data>.

        APPEND <fs_business_data> TO <ft_business_data>.

      ENDLOOP.


      io_response->set_data( it_data = <ft_business_data> ).
      io_response->set_total_number_of_records( iv_total_number_of_records = lines( <ft_business_data> ) ).

    ENDIF.

  ENDMETHOD.