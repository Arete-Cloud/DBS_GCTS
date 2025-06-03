CLASS lhc_t012 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR t012 RESULT result.

ENDCLASS.

CLASS lhc_t012 IMPLEMENTATION.

  METHOD get_global_authorizations.

  result-%delete = if_abap_behv=>auth-allowed.
  result-%update = if_abap_behv=>auth-allowed.
  ENDMETHOD.

ENDCLASS.