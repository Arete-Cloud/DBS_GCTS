  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'com.sap.gateway.srvd_a2x.api_bank_3.v0001' ) ##NO_TEXT.

    def_sap_message( ).
    def_bank_address_type( ).
    def_bank_type( ).
    def_bank_type_2( ).

  ENDMETHOD.