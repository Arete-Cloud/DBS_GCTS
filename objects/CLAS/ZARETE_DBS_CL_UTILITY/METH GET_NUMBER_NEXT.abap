  METHOD get_number_next.

*    SELECT MAX( id ) FROM zarete_dbs_t015 INTO @DATA(lv_max_id).
*
*    ev_number = lv_max_id + 1.

    TRY.
        cl_numberrange_runtime=>number_get( EXPORTING nr_range_nr = '01' object = 'ZDBS_ID' quantity = 0000001
                                            IMPORTING number = DATA(lv_number) ).
        SHIFT lv_number LEFT DELETING LEADING '0'.
        ev_number = lv_number.
      CATCH cx_nr_object_not_found.
      CATCH cx_number_ranges.
      CATCH cx_root.
    ENDTRY.

  ENDMETHOD.