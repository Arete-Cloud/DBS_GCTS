  METHOD bp_list.

    DATA: lt_t018_create TYPE TABLE FOR CREATE zarete_dbs_dd_t018,
          lt_t018_update TYPE TABLE FOR UPDATE zarete_dbs_dd_t018.

    READ ENTITIES OF zarete_dbs_dd_bp_001
    ENTITY zarete_dbs_dd_bp_001
    ALL FIELDS WITH VALUE #( (  ) )
    RESULT DATA(lt_bp_list).

    LOOP AT lt_bp_list ASSIGNING FIELD-SYMBOL(<fs_bp_list>).

      SELECT SINGLE * FROM zarete_dbs_t018 WHERE business_partner EQ @<fs_bp_list>-bptax_number INTO @DATA(ls_t018).
      IF sy-subrc EQ 0.
        APPEND INITIAL LINE TO lt_t018_update ASSIGNING FIELD-SYMBOL(<fs_update>).
        <fs_update>-BusinessPartner                  = ls_t018-business_partner.
        <fs_update>-BusinessPartnerFullName          = <fs_bp_list>-business_partner_full_name.
        <fs_update>-BptaxNumber                      = <fs_bp_list>-bptax_number.
        <fs_update>-%control-BusinessPartnerFullName = if_abap_behv=>mk-on.
        <fs_update>-%control-BptaxNumber             = if_abap_behv=>mk-on.
      ELSE.
        APPEND INITIAL LINE TO lt_t018_create ASSIGNING FIELD-SYMBOL(<fs_create>).
        <fs_create>-BusinessPartner                  = <fs_bp_list>-business_partner.
        <fs_create>-BusinessPartnerFullName          = <fs_bp_list>-business_partner_full_name.
        <fs_create>-BptaxNumber                      = <fs_bp_list>-bptax_number.
        <fs_create>-%control-BusinessPartner         = if_abap_behv=>mk-on.
        <fs_create>-%control-BusinessPartnerFullName = if_abap_behv=>mk-on.
        <fs_create>-%control-BptaxNumber             = if_abap_behv=>mk-on.
      ENDIF.

    ENDLOOP.

    MODIFY ENTITIES OF zarete_dbs_dd_t018 ENTITY zarete_dbs_dd_t018
    CREATE AUTO FILL CID WITH lt_t018_create
    MAPPED DATA(lt_mapped_t018_cr)
    FAILED DATA(lt_failed_t018_cr)
    REPORTED DATA(lt_reported_t018_cr).

    MODIFY ENTITIES OF zarete_dbs_dd_t018 ENTITY zarete_dbs_dd_t018
    UPDATE FIELDS (  BusinessPartnerFullName BptaxNumber  ) WITH lt_t018_update
    MAPPED DATA(lt_mapped_t018_up)
    FAILED DATA(lt_failed_t018_up)
    REPORTED DATA(lt_reported_t018_up).

    COMMIT ENTITIES RESPONSE OF zarete_dbs_dd_t018
    FAILED DATA(lt_failed_t018_co)
    REPORTED DATA(lt_reported_t018_co).

  ENDMETHOD.