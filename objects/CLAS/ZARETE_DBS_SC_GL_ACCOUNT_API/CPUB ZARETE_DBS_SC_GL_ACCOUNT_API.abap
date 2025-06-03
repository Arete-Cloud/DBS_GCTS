"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>API_GLACCOUNTINCHARTOFACCOUNTS_SRV</em>
CLASS zarete_dbs_sc_gl_account_api DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">A_GLAccountInChartOfAccountsType</p>
      BEGIN OF tys_a_glaccount_in_chart_of__2,
        "! <em>Key property</em> ChartOfAccounts
        chart_of_accounts          TYPE c LENGTH 4,
        "! <em>Key property</em> GLAccount
        glaccount                  TYPE c LENGTH 10,
        "! IsBalanceSheetAccount
        is_balance_sheet_account   TYPE abap_bool,
        "! GLAccountGroup
        glaccount_group            TYPE c LENGTH 4,
        "! CorporateGroupAccount
        corporate_group_account    TYPE c LENGTH 10,
        "! ProfitLossAccountType
        profit_loss_account_type   TYPE c LENGTH 2,
        "! SampleGLAccount
        sample_glaccount           TYPE c LENGTH 10,
        "! AccountIsMarkedForDeletion
        account_is_marked_for_dele TYPE abap_bool,
        "! AccountIsBlockedForCreation
        account_is_blocked_for_cre TYPE abap_bool,
        "! AccountIsBlockedForPosting
        account_is_blocked_for_pos TYPE abap_bool,
        "! AccountIsBlockedForPlanning
        account_is_blocked_for_pla TYPE abap_bool,
        "! PartnerCompany
        partner_company            TYPE c LENGTH 6,
        "! FunctionalArea
        functional_area            TYPE c LENGTH 16,
        "! CreationDate
        creation_date              TYPE datn,
        "! CreatedByUser
        created_by_user            TYPE c LENGTH 12,
        "! LastChangeDateTime
        last_change_date_time      TYPE timestamp,
        "! GLAccountType
        glaccount_type             TYPE c LENGTH 1,
        "! GLAccountExternal
        glaccount_external         TYPE c LENGTH 10,
        "! IsProfitLossAccount
        is_profit_loss_account     TYPE abap_bool,
      END OF tys_a_glaccount_in_chart_of__2,
      "! <p class="shorttext synchronized">List of A_GLAccountInChartOfAccountsType</p>
      tyt_a_glaccount_in_chart_of__2 TYPE STANDARD TABLE OF tys_a_glaccount_in_chart_of__2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_GLAccountTextType</p>
      BEGIN OF tys_a_glaccount_text_type,
        "! <em>Key property</em> ChartOfAccounts
        chart_of_accounts     TYPE c LENGTH 4,
        "! <em>Key property</em> GLAccount
        glaccount             TYPE c LENGTH 10,
        "! <em>Key property</em> Language
        language              TYPE c LENGTH 2,
        "! GLAccountName
        glaccount_name        TYPE c LENGTH 20,
        "! GLAccountLongName
        glaccount_long_name   TYPE c LENGTH 50,
        "! LastChangeDateTime
        last_change_date_time TYPE timestamp,
      END OF tys_a_glaccount_text_type,
      "! <p class="shorttext synchronized">List of A_GLAccountTextType</p>
      tyt_a_glaccount_text_type TYPE STANDARD TABLE OF tys_a_glaccount_text_type WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! A_GLAccountInChartOfAccounts
        "! <br/> Collection of type 'A_GLAccountInChartOfAccountsType'
        a_glaccount_in_chart_of_ac TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_GLACCOUNT_IN_CHART_OF_AC',
        "! A_GLAccountText
        "! <br/> Collection of type 'A_GLAccountTextType'
        a_glaccount_text           TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_GLACCOUNT_TEXT',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for A_GLAccountInChartOfAccountsType</p>
        "! See also structure type {@link ..tys_a_glaccount_in_chart_of__2}
        BEGIN OF a_glaccount_in_chart_of__2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_Text
            to_text TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_TEXT',
          END OF navigation,
        END OF a_glaccount_in_chart_of__2,
        "! <p class="shorttext synchronized">Internal names for A_GLAccountTextType</p>
        "! See also structure type {@link ..tys_a_glaccount_text_type}
        BEGIN OF a_glaccount_text_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_GLAccountInChartOfAccounts
            to_glaccount_in_chart_of_a TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_GLACCOUNT_IN_CHART_OF_A',
          END OF navigation,
        END OF a_glaccount_text_type,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.

