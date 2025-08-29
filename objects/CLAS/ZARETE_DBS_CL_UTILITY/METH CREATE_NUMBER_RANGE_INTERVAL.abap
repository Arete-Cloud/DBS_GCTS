  METHOD create_number_range_interval.

    DATA: lt_interval TYPE cl_numberrange_intervals=>nr_interval.

    TRY.
        cl_numberrange_runtime=>number_status( EXPORTING nr_range_nr = '01' object = 'ZDBS_ID'
                                               IMPORTING number      = DATA(lv_check) ).
        SHIFT lv_check LEFT DELETING LEADING '0'.
      CATCH cx_nr_object_not_found INTO DATA(lx_no_obj_found).
      CATCH cx_number_ranges INTO DATA(cx_number_ranges).
    ENDTRY.

    IF lv_check IS INITIAL.

      lt_interval = VALUE #( ( subobject = '' nrrangenr = '01' fromnumber = '1000000' tonumber = '9999999' procind = 'I' ) ).

      TRY.
          cl_numberrange_intervals=>create( EXPORTING interval = lt_interval object = 'ZDBS_ID'
                                            IMPORTING error = ev_error error_inf = DATA(lv_error_inf) error_iv  = DATA(lv_error_iv) ).
        CATCH cx_nr_object_not_found INTO lx_no_obj_found.
        CATCH cx_number_ranges INTO cx_number_ranges.
      ENDTRY.

    ENDIF.

  ENDMETHOD.