  METHOD get_factory.
    IF mo_factory IS INITIAL.
      mo_factory = NEW zarete_dbs_cl_log(  ).
    ENDIF.
    ro_log = mo_factory.
  ENDMETHOD.