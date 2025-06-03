  METHOD journal_entry_test_mode.


    DATA(lo_log) = zarete_dbs_cl_log=>get_factory( ).
    DATA ls_mesaj TYPE REF TO if_abap_behv_message.
    TRY.
        DATA(destination) = cl_soap_destination_provider=>create_by_comm_arrangement(
          comm_scenario = 'ZARETE_DBS_CS_S4HANA'
          service_id    = 'ZARETE_DBS_FI_SPRX' ).
        DATA(proxy) = NEW zarete_dbs_co_journal_entry_cr( destination = destination ).
        DATA(ls_request) = VALUE zarete_dbs_journal_entry_bulk( ).

        MOVE-CORRESPONDING is_request TO ls_request.

        ls_request-journal_entry_bulk_create_requ-message_header-test_data_indicator = 'X'.

        LOOP AT ls_request-journal_entry_bulk_create_requ-journal_entry_create_request ASSIGNING FIELD-SYMBOL(<fs_doc>).
          <fs_doc>-message_header-test_data_indicator = 'X'.
        ENDLOOP.


        proxy->journal_entry_create_request_c( EXPORTING input  = ls_request
                                               IMPORTING output = DATA(ls_response) ).

        LOOP AT ls_response-journal_entry_bulk_create_conf-journal_entry_create_confirmat INTO DATA(ls_journal).

          LOOP AT ls_journal-log-item INTO DATA(ls_log).
            IF ls_log-severity_code > 1.
              DATA(lv_error_msj) = ls_log-note.

              lo_log->add_log( msgty = if_abap_behv_message=>severity-error
                               msgtx = CONV #( lv_error_msj ) ).

              ls_mesaj = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                text     = ls_log-note ).

              APPEND ls_mesaj TO et_message.

            ENDIF.
          ENDLOOP.
        ENDLOOP.

      CATCH cx_soap_destination_error INTO DATA(lc_cx).
        lv_error_msj = lc_cx->get_longtext(  ).

        lo_log->add_log( msgty = if_abap_behv_message=>severity-error
                         msgno = lc_cx->if_t100_message~t100key-msgno
                         msgid = lc_cx->if_t100_message~t100key-msgid
                         msgv1 = lc_cx->if_t100_dyn_msg~msgv1
                         msgv2 = lc_cx->if_t100_dyn_msg~msgv2
                         msgv3 = lc_cx->if_t100_dyn_msg~msgv3
                         msgv4 = lc_cx->if_t100_dyn_msg~msgv4
                         msgtx = CONV #( lv_error_msj ) ).

      CATCH cx_ai_system_fault INTO DATA(lc_cx_fault).
        lv_error_msj = lc_cx_fault->get_longtext(  ).

        lo_log->add_log( msgty = if_abap_behv_message=>severity-error
                         msgtx = CONV #( lv_error_msj ) ).
    ENDTRY.

  ENDMETHOD.