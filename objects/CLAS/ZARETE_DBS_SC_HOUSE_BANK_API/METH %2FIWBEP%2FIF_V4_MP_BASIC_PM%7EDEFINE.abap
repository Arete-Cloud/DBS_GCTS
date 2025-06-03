  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'YY1_HOUSEBANKACCOUNTLINK_CDS' ) ##NO_TEXT.

    def_yy_1_house_bank_account__2( ).

  ENDMETHOD.