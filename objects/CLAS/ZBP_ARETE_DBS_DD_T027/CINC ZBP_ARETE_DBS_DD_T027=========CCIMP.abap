CLASS lhc_ZARETE_DBS_DD_T027 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zarete_dbs_dd_t027 RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zarete_dbs_dd_t027.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zarete_dbs_dd_t027.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zarete_dbs_dd_t027.

    METHODS read FOR READ
      IMPORTING keys FOR READ zarete_dbs_dd_t027 RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zarete_dbs_dd_t027.

    METHODS rba_Invoices FOR READ
      IMPORTING keys_rba FOR READ zarete_dbs_dd_t027\_Invoices FULL result_requested RESULT result LINK association_links.
    METHODS cba_Invoices FOR MODIFY
      IMPORTING entities_cba FOR CREATE zarete_dbs_dd_t027\_Invoices.

ENDCLASS.

CLASS lhc_ZARETE_DBS_DD_T027 IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD create.

    DATA(lv) = 'EZG'.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_Invoices.
  ENDMETHOD.

  METHOD cba_Invoices.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZARETE_DBS_DD_T024 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zarete_dbs_dd_t024 RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zarete_dbs_dd_t024.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zarete_dbs_dd_t024.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zarete_dbs_dd_t024.

    METHODS read FOR READ
      IMPORTING keys FOR READ zarete_dbs_dd_t024 RESULT result.

    METHODS rba_Header FOR READ
      IMPORTING keys_rba FOR READ zarete_dbs_dd_t024\_Header FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_ZARETE_DBS_DD_T024 IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD create.
    DATA(lv_debug) = 'X'.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Header.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZARETE_DBS_DD_T027 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZARETE_DBS_DD_T027 IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.