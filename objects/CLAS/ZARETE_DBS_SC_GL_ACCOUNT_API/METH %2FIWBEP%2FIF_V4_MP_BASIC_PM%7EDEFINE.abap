  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'API_GLACCOUNTINCHARTOFACCOUNTS_SRV' ) ##NO_TEXT.

    def_a_glaccount_in_chart_of__2( ).
    def_a_glaccount_text_type( ).

  ENDMETHOD.