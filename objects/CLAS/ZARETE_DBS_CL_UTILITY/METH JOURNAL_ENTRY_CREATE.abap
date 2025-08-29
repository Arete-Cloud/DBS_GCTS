  METHOD journal_entry_create.

    DATA(lo_log) = zarete_dbs_cl_log=>get_factory( ).

    CLEAR: ev_document_number,ev_fiscal_year,ev_company_code.

    DATA ls_mesaj TYPE REF TO if_abap_behv_message.
    TRY.
        DATA(destination) = cl_soap_destination_provider=>create_by_comm_arrangement(
          comm_scenario = 'ZARETE_DBS_CS_S4HANA'
          service_id    = 'ZARETE_DBS_FI_SPRX' ).
        DATA(proxy) = NEW zarete_dbs_co_journal_entry_cr( destination = destination ).
        DATA(ls_request) = VALUE zarete_dbs_journal_entry_bulk( ).

        MOVE-CORRESPONDING is_request TO ls_request.

        proxy->journal_entry_create_request_c( EXPORTING input  = ls_request
                                               IMPORTING output = DATA(ls_response) ).

        LOOP AT ls_response-journal_entry_bulk_create_conf-journal_entry_create_confirmat INTO DATA(ls_journal).

          IF ls_journal-journal_entry_create_confirmat-accounting_document NE '0000000000' AND
             ls_journal-journal_entry_create_confirmat-accounting_document IS NOT INITIAL .
            IF lines( ls_response-journal_entry_bulk_create_conf-journal_entry_create_confirmat ) EQ 1.

              ev_document_number = ls_journal-journal_entry_create_confirmat-accounting_document .
              ev_fiscal_year     = ls_journal-journal_entry_create_confirmat-fiscal_year .
              ev_company_code    = ls_journal-journal_entry_create_confirmat-company_code .

            ENDIF.

            APPEND VALUE #(
            reference_id        = ls_journal-message_header-reference_id-content
            accounting_document = ls_journal-journal_entry_create_confirmat-accounting_document
            company_code        = ls_journal-journal_entry_create_confirmat-company_code
            fiscal_year         = ls_journal-journal_entry_create_confirmat-fiscal_year
            ) TO et_fi_documents.

          ENDIF.

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