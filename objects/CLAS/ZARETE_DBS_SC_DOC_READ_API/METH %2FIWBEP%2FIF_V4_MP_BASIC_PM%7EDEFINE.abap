  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'API_OPLACCTGDOCITEMCUBE_SRV' ) ##NO_TEXT.

    def_a_operational_acctg_doc__2( ).

  ENDMETHOD.