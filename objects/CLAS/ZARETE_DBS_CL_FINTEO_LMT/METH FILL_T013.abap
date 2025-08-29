  METHOD fill_t013.

    DATA: ls_t013 TYPE zarete_dbs_t013,
          lt_t013 TYPE TABLE OF zarete_dbs_t013,
          lt_t012 TYPE TABLE OF zarete_dbs_t012.

    LOOP AT it_limit-data INTO DATA(ls_limit).
      MOVE-CORRESPONDING ls_limit TO ls_t013.
      APPEND ls_t013 TO lt_t013.

      SELECT SINGLE *
      FROM zarete_dbs_t012
      WHERE company_identifier EQ @ls_limit-identifier
      AND   limit_id EQ @ls_limit-limitid
      INTO @DATA(ls_t012).
      IF sy-subrc NE 0.
        APPEND INITIAL LINE TO lt_t012 ASSIGNING FIELD-SYMBOL(<fs_t012>).
        <fs_t012>-client = sy-mandt.
        <fs_t012>-company_identifier = ls_limit-identifier.
        <fs_t012>-limit_id = ls_limit-limitid.
        <fs_t012>-company_code = iv_company_code.
        <fs_t012>-company_bank_code = ls_limit-bankcode.
        <fs_t012>-bp_tax_number = ls_limit-partytaxnumber.
      ENDIF.

    ENDLOOP.

    MODIFY zarete_dbs_t013 FROM TABLE @lt_t013.
    MODIFY zarete_dbs_t012 FROM TABLE @lt_t012.

  ENDMETHOD.