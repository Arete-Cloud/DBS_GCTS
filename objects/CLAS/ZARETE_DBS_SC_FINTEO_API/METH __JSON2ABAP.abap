  METHOD __json2abap.

    DATA(lo_input_struct)   = CAST cl_abap_structdescr( cl_abap_structdescr=>describe_by_data( p_data = ir_input_data ) ).
    DATA(lo_target_struct)  = CAST cl_abap_structdescr( cl_abap_structdescr=>describe_by_data( p_data = cr_abap_data ) ).

    LOOP AT lo_input_struct->components ASSIGNING FIELD-SYMBOL(<ls_component>).
      IF line_exists( lo_target_struct->components[ name = <ls_component>-name ] ).
        ASSIGN COMPONENT <ls_component>-name OF STRUCTURE ir_input_data TO FIELD-SYMBOL(<field_in_data>).
        ASSIGN COMPONENT <ls_component>-name OF STRUCTURE cr_abap_data TO FIELD-SYMBOL(<field_out_data>).

        IF lo_target_struct->components[ name = <ls_component>-name ]-type_kind = cl_abap_typedescr=>typekind_xstring.
          <field_out_data> = cl_web_http_utility=>decode_x_base64( <field_in_data>->* ).
        ELSE.
          <field_out_data> = <field_in_data>->*.
        ENDIF.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.