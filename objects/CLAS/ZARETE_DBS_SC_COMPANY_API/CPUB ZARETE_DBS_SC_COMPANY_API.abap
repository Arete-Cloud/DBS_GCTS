"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>API_COMPANYCODE_SRV</em>
CLASS zarete_dbs_sc_company_api DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">A_CompanyCodeType</p>
      BEGIN OF tys_a_company_code_type,
        "! <em>Key property</em> CompanyCode
        company_code               TYPE c LENGTH 4,
        "! CompanyCodeName
        company_code_name          TYPE c LENGTH 25,
        "! CityName
        city_name                  TYPE c LENGTH 25,
        "! Country
        country                    TYPE c LENGTH 3,
        "! Currency
        currency                   TYPE c LENGTH 5,
        "! Language
        language                   TYPE c LENGTH 2,
        "! ChartOfAccounts
        chart_of_accounts          TYPE c LENGTH 4,
        "! FiscalYearVariant
        fiscal_year_variant        TYPE c LENGTH 2,
        "! Company
        company                    TYPE c LENGTH 6,
        "! CreditControlArea
        credit_control_area        TYPE c LENGTH 4,
        "! CountryChartOfAccounts
        country_chart_of_accounts  TYPE c LENGTH 4,
        "! FinancialManagementArea
        financial_management_area  TYPE c LENGTH 4,
        "! AddressID
        address_id                 TYPE c LENGTH 10,
        "! TaxableEntity
        taxable_entity             TYPE c LENGTH 4,
        "! VATRegistration
        vatregistration            TYPE c LENGTH 20,
        "! ExtendedWhldgTaxIsActive
        extended_whldg_tax_is_acti TYPE abap_bool,
        "! ControllingArea
        controlling_area           TYPE c LENGTH 4,
        "! FieldStatusVariant
        field_status_variant       TYPE c LENGTH 4,
        "! NonTaxableTransactionTaxCode
        non_taxable_transaction_ta TYPE c LENGTH 2,
        "! DocDateIsUsedForTaxDetn
        doc_date_is_used_for_tax_d TYPE abap_bool,
        "! TaxRptgDateIsActive
        tax_rptg_date_is_active    TYPE abap_bool,
      END OF tys_a_company_code_type,
      "! <p class="shorttext synchronized">List of A_CompanyCodeType</p>
      tyt_a_company_code_type TYPE STANDARD TABLE OF tys_a_company_code_type WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! A_CompanyCode
        "! <br/> Collection of type 'A_CompanyCodeType'
        a_company_code TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_COMPANY_CODE',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for A_CompanyCodeType</p>
        "! See also structure type {@link ..tys_a_company_code_type}
        BEGIN OF a_company_code_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_company_code_type,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.

