"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>YY1_HOUSEBANKACCOUNTLINK_CDS</em>
CLASS zarete_dbs_sc_house_bank_api DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">YY1_HouseBankAccountLinkType</p>
      BEGIN OF tys_yy_1_house_bank_account__2,
        "! <em>Key property</em> CompanyCode
        company_code             TYPE c LENGTH 4,
        "! <em>Key property</em> HouseBank
        house_bank               TYPE c LENGTH 5,
        "! <em>Key property</em> HouseBankAccount
        house_bank_account       TYPE c LENGTH 5,
        "! BankAccountInternalID
        bank_account_internal_id TYPE c LENGTH 10,
        "! BankInternalID
        bank_internal_id         TYPE c LENGTH 15,
        "! BankCountry
        bank_country             TYPE c LENGTH 3,
        "! SWIFTCode
        swiftcode                TYPE c LENGTH 11,
        "! BankName
        bank_name                TYPE c LENGTH 60,
        "! BankNumber
        bank_number              TYPE c LENGTH 15,
        "! BankAccount
        bank_account             TYPE c LENGTH 18,
        "! BankAccountAlternative
        bank_account_alternative TYPE c LENGTH 24,
        "! ReferenceInfo
        reference_info           TYPE c LENGTH 27,
        "! BankControlKey
        bank_control_key         TYPE c LENGTH 2,
        "! BankAccountCurrency
        bank_account_currency    TYPE c LENGTH 5,
        "! IBAN
        iban                     TYPE c LENGTH 34,
        "! BankAccountDescription
        bank_account_description TYPE c LENGTH 60,
        "! GLAccount
        glaccount                TYPE c LENGTH 10,
        "! BankAccountHolderName
        bank_account_holder_name TYPE c LENGTH 60,
        "! BankAccountNumber
        bank_account_number      TYPE c LENGTH 40,
      END OF tys_yy_1_house_bank_account__2,
      "! <p class="shorttext synchronized">List of YY1_HouseBankAccountLinkType</p>
      tyt_yy_1_house_bank_account__2 TYPE STANDARD TABLE OF tys_yy_1_house_bank_account__2 WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! YY1_HouseBankAccountLink
        "! <br/> Collection of type 'YY1_HouseBankAccountLinkType'
        yy_1_house_bank_account_li TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'YY_1_HOUSE_BANK_ACCOUNT_LI',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for YY1_HouseBankAccountLinkType</p>
        "! See also structure type {@link ..tys_yy_1_house_bank_account__2}
        BEGIN OF yy_1_house_bank_account__2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF yy_1_house_bank_account__2,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.

