  METHOD update_due_date.

    DATA: lt_t016_update TYPE TABLE FOR UPDATE zarete_dbs_dd_t016.

    DATA(lo_send) = NEW zarete_dbs_sc_finteo_api( ).
    DATA(lo_log) = zarete_dbs_cl_log=>get_factory( ).

    SELECT * FROM zarete_dbs_t016 WHERE invoice_number = @iv_invoice_number INTO TABLE @DATA(lt_t016).

    LOOP AT lt_t016 ASSIGNING FIELD-SYMBOL(<fs_t016>).

      DATA(lv_invoice_number) =  COND #( WHEN <fs_t016>-partial_invoice_number IS NOT INITIAL THEN <fs_t016>-partial_invoice_number
                                         ELSE <fs_t016>-invoice_number ).
*İlgili faturanın vade tarihi hariş tüm alanları aynı, vade tarihi SAP'den gelen güncel vade tarihi olacak şekilde
*Finteo'ya gönderilir
      lo_send->update_invoice(
        EXPORTING
          iv_bankeftcode    = CONV string( <fs_t016>-bank_code )
          iv_partycode      = <fs_t016>-party_code
          iv_identifier     = CONV string( <fs_t016>-identifier )
          iv_amount         = CONV zarete_dbs_de_finteo_amount( <fs_t016>-amount )
          iv_invoicenumber  = CONV string( lv_invoice_number )
          iv_invoiceduedate = iv_due_date
          iv_currencycode   = <fs_t016>-currency_code
        RECEIVING
          rv_update_invoice = DATA(ls_result)
      ).

      IF ls_result-status EQ 'OK'.

*Başarılı güncellemenin ardından ilgili fatura sorgulanır
*Finteo iş günü olmayan vade tarihlerinde en yakın iş gününe göre düzenleme yaptığı için
*SAP'den gelen vade tarihini direkt kullanamıyoruz
        DATA(lv_startdate) = iv_due_date+0(4) && '-01-01' .
        DATA(lv_enddate)   = iv_due_date .

        lo_send->get_invoice(
          EXPORTING
            iv_startdate         = lv_startdate
            iv_finishdate        = lv_enddate
            iv_dbsinvoiceid      = ls_result-data-dbsinvoiceid
          RECEIVING
            rv_invoice           = DATA(ls_invoice)
        ).

        IF ls_invoice-status EQ 'OK'.

*Finteo'dan alınan vade tarihi ile Finteo faturaları tablosu vade tarihi alanı güncellenir
          LOOP AT ls_invoice-data ASSIGNING FIELD-SYMBOL(<fs_data>).

            APPEND INITIAL LINE TO lt_t016_update ASSIGNING FIELD-SYMBOL(<fs_t016_update>).
            <fs_t016_update>-Identifier                  = <fs_t016>-identifier.
            <fs_t016_update>-DbsInvoiceId                = <fs_t016>-dbs_invoice_id.
            <fs_t016_update>-DueDate                     = <fs_data>-duedate.
            <fs_t016_update>-%control-DueDate            = if_abap_behv=>mk-on.

            lo_log->set_sapinvoiceno( iv_sapinvoiceno = <fs_t016>-invoice_number
                                      iv_id           = <fs_t016>-id
                                      iv_bankcode     = <fs_t016>-bank_code ).
            lo_log->add_log( msgty = if_abap_behv_message=>severity-success
                             msgno = '011'  ).

          ENDLOOP.

        ENDIF.

      ENDIF.

    ENDLOOP.

    MODIFY ENTITIES OF zarete_dbs_dd_t016 ENTITY zarete_dbs_dd_t016
    UPDATE FIELDS ( DueDate ) WITH lt_t016_update
    MAPPED DATA(lt_mapped_t016_up)
    FAILED DATA(lt_failed_t016_up)
    REPORTED DATA(lt_reported_t016_up).

    COMMIT ENTITIES RESPONSE OF zarete_dbs_dd_t016
    FAILED DATA(lt_failed_t016_co)
    REPORTED DATA(lt_reported_t016_co).

  ENDMETHOD.