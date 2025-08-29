CLASS zarete_dbs_cl_log DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zarete_dbs_if_log .

    ALIASES: sapinvoiceno FOR zarete_dbs_if_log~sapinvoiceno,
             id           FOR zarete_dbs_if_log~id,
             bankcode    FOR zarete_dbs_if_log~bankcode.

    CLASS-DATA mo_factory TYPE REF TO zarete_dbs_if_log.

    CLASS-METHODS : get_factory RETURNING VALUE(ro_log) TYPE REF TO zarete_dbs_if_log.