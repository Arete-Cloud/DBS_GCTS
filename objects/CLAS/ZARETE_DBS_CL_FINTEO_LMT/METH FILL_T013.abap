  METHOD fill_t013.

    DATA: ls_t013 TYPE zarete_dbs_t013,
          lt_t013 TYPE TABLE OF zarete_dbs_t013.

    LOOP AT it_limit-data INTO DATA(ls_limit).
      MOVE-CORRESPONDING ls_limit TO ls_t013.
      APPEND ls_t013 TO lt_t013.
    ENDLOOP.


    MODIFY zarete_dbs_t013 FROM TABLE @lt_t013.

  ENDMETHOD.