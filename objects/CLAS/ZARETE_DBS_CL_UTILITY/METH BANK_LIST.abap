  METHOD bank_list.

    DATA: lt_t019_create TYPE TABLE FOR CREATE zarete_dbs_dd_t019,
          lt_t019_update TYPE TABLE FOR UPDATE zarete_dbs_dd_t019,
          lt_bank_list   TYPE TABLE OF zarete_dbs_t019.

    SELECT DISTINCT bankcode,
                    bankname
    FROM zarete_dbs_t013
    INTO TABLE @DATA(lt_t013).


    LOOP AT lt_t013 ASSIGNING FIELD-SYMBOL(<fs_bank_list>).

      SELECT SINGLE * FROM zarete_dbs_t019 WHERE bank_code EQ @<fs_bank_list>-bankcode INTO @DATA(ls_t019).
      IF sy-subrc NE 0.
        APPEND INITIAL LINE TO lt_t019_create ASSIGNING FIELD-SYMBOL(<fs_create>).
        <fs_create>-BankCode          = <fs_bank_list>-bankcode.
        <fs_create>-BankName          = <fs_bank_list>-bankname.
        <fs_create>-%control-BankCode = if_abap_behv=>mk-on.
        <fs_create>-%control-BankName = if_abap_behv=>mk-on.

      ENDIF.

    ENDLOOP.

**
    APPEND INITIAL LINE TO lt_t019_create ASSIGNING FIELD-SYMBOL(<fs_create_dummy>).
    <fs_create_dummy>-BankCode          = '0062'.
    <fs_create_dummy>-BankName          = 'Garanti Bankası'.
    <fs_create_dummy>-%control-BankCode = if_abap_behv=>mk-on.
    <fs_create_dummy>-%control-BankName = if_abap_behv=>mk-on.

    APPEND INITIAL LINE TO lt_t019_create ASSIGNING <fs_create_dummy>.
    <fs_create_dummy>-BankCode          = '0064'.
    <fs_create_dummy>-BankName          = 'Türkiye İş Bankası'.
    <fs_create_dummy>-%control-BankCode = if_abap_behv=>mk-on.
    <fs_create_dummy>-%control-BankName = if_abap_behv=>mk-on.
**

    MODIFY ENTITIES OF zarete_dbs_dd_t019 ENTITY zarete_dbs_dd_t019
    CREATE AUTO FILL CID WITH lt_t019_create
    MAPPED DATA(lt_mapped_t019_cr)
    FAILED DATA(lt_failed_t019_cr)
    REPORTED DATA(lt_reported_t019_cr).

    COMMIT ENTITIES RESPONSE OF zarete_dbs_dd_t019
    FAILED DATA(lt_failed_t019_co)
    REPORTED DATA(lt_reported_t019_co).

  ENDMETHOD.