"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>com.sap.gateway.srvd_a2x.api_bank_3.v0001</em>
CLASS zarete_dbs_sc_bank_api DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">Types for primitive collection fields</p>
      BEGIN OF tys_types_for_prim_colls,
        "! additionalTargets
        "! Used for TYS_SAP_MESSAGE-ADDITIONAL_TARGETS
        additional_targets TYPE string,
      END OF tys_types_for_prim_colls.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of SAP_MESSAGE</p>
      BEGIN OF tys_value_controls_1,
        "! TARGET
        target       TYPE /iwbep/v4_value_control,
        "! LONGTEXT_URL
        longtext_url TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_1.

    TYPES:
      "! <p class="shorttext synchronized">SAP__Message</p>
      BEGIN OF tys_sap_message,
        "! <em>Value Control Structure</em>
        value_controls     TYPE tys_value_controls_1,
        "! code
        code               TYPE string,
        "! message
        message            TYPE string,
        "! target
        target             TYPE string,
        "! additionalTargets
        additional_targets TYPE STANDARD TABLE OF tys_types_for_prim_colls-additional_targets WITH DEFAULT KEY,
        "! transition
        transition         TYPE abap_bool,
        "! numericSeverity
        numeric_severity   TYPE int1,
        "! longtextUrl
        longtext_url       TYPE string,
      END OF tys_sap_message,
      "! <p class="shorttext synchronized">List of SAP__Message</p>
      tyt_sap_message TYPE STANDARD TABLE OF tys_sap_message WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of BANK_TYPE_2</p>
      BEGIN OF tys_value_controls_2,
        "! BANK
        bank TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_2.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of BANK_ADDRESS_TYPE</p>
      BEGIN OF tys_value_controls_3,
        "! BANK_SCRIPT_VARIANT
        bank_script_variant TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_3.

    TYPES:
      "! <p class="shorttext synchronized">BankAddressType</p>
      BEGIN OF tys_bank_address_type,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_3,
        "! <em>Key property</em> BankCountry
        bank_country               TYPE c LENGTH 3,
        "! <em>Key property</em> BankInternalID
        bank_internal_id           TYPE c LENGTH 15,
        "! StreetName
        street_name                TYPE c LENGTH 60,
        "! HouseNumber
        house_number               TYPE c LENGTH 10,
        "! HouseNumberSupplementText
        house_number_supplement_te TYPE c LENGTH 10,
        "! CityName
        city_name                  TYPE c LENGTH 40,
        "! PostalCode
        postal_code                TYPE c LENGTH 10,
        "! Country
        country                    TYPE c LENGTH 3,
        "! Region
        region                     TYPE c LENGTH 3,
        "! CorrespondenceLanguage
        correspondence_language    TYPE c LENGTH 2,
        "! DistrictName
        district_name              TYPE c LENGTH 40,
        "! VillageName
        village_name               TYPE c LENGTH 40,
        "! CompanyPostalCode
        company_postal_code        TYPE c LENGTH 10,
        "! StreetAddrNonDeliverableReason
        street_addr_non_deliverabl TYPE c LENGTH 4,
        "! StreetPrefixName1
        street_prefix_name_1       TYPE c LENGTH 40,
        "! StreetPrefixName2
        street_prefix_name_2       TYPE c LENGTH 40,
        "! StreetSuffixName1
        street_suffix_name_1       TYPE c LENGTH 40,
        "! StreetSuffixName2
        street_suffix_name_2       TYPE c LENGTH 40,
        "! Building
        building                   TYPE c LENGTH 20,
        "! Floor
        floor                      TYPE c LENGTH 10,
        "! RoomNumber
        room_number                TYPE c LENGTH 10,
        "! FormOfAddress
        form_of_address            TYPE c LENGTH 4,
        "! TaxJurisdiction
        tax_jurisdiction           TYPE c LENGTH 15,
        "! TransportZone
        transport_zone             TYPE c LENGTH 10,
        "! POBox
        pobox                      TYPE c LENGTH 10,
        "! POBoxAddrNonDeliverableReason
        pobox_addr_non_deliverable TYPE c LENGTH 4,
        "! POBoxIsWithoutNumber
        pobox_is_without_number    TYPE abap_bool,
        "! POBoxPostalCode
        pobox_postal_code          TYPE c LENGTH 10,
        "! POBoxLobbyName
        pobox_lobby_name           TYPE c LENGTH 40,
        "! POBoxDeviatingCityName
        pobox_deviating_city_name  TYPE c LENGTH 40,
        "! POBoxDeviatingRegion
        pobox_deviating_region     TYPE c LENGTH 3,
        "! POBoxDeviatingCountry
        pobox_deviating_country    TYPE c LENGTH 3,
        "! CareOfName
        care_of_name               TYPE c LENGTH 40,
        "! DeliveryServiceTypeCode
        delivery_service_type_code TYPE c LENGTH 4,
        "! DeliveryServiceNumber
        delivery_service_number    TYPE c LENGTH 10,
        "! AddressTimeZone
        address_time_zone          TYPE c LENGTH 6,
        "! SecondaryRegionName
        secondary_region_name      TYPE c LENGTH 40,
        "! TertiaryRegionName
        tertiary_region_name       TYPE c LENGTH 40,
        "! AddressRepresentationCode
        address_representation_cod TYPE c LENGTH 1,
        "! AddressSearchTerm1
        address_search_term_1      TYPE c LENGTH 20,
        "! AddressSearchTerm2
        address_search_term_2      TYPE c LENGTH 20,
        "! InternationalPhoneNumber
        international_phone_number TYPE c LENGTH 30,
        "! InternationalMobilePhoneNumber
        international_mobile_phone TYPE c LENGTH 30,
        "! InternationalFaxNumber
        international_fax_number   TYPE c LENGTH 30,
        "! EmailAddress
        email_address              TYPE c LENGTH 241,
        "! SAP__Messages
        sap_messages               TYPE tyt_sap_message,
      END OF tys_bank_address_type,
      "! <p class="shorttext synchronized">List of BankAddressType</p>
      tyt_bank_address_type TYPE STANDARD TABLE OF tys_bank_address_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">BankType</p>
      BEGIN OF tys_bank_type,
        "! <em>Key property</em> BankCountry
        bank_country           TYPE c LENGTH 3,
        "! <em>Key property</em> BankInternalID
        bank_internal_id       TYPE c LENGTH 15,
        "! LongBankName
        long_bank_name         TYPE c LENGTH 80,
        "! LongBankBranch
        long_bank_branch       TYPE c LENGTH 80,
        "! SWIFTCode
        swiftcode              TYPE c LENGTH 11,
        "! BankNetworkGrouping
        bank_network_grouping  TYPE c LENGTH 2,
        "! IsMarkedForDeletion
        is_marked_for_deletion TYPE abap_bool,
        "! BankNumber
        bank_number            TYPE c LENGTH 15,
        "! BankCategory
        bank_category          TYPE c LENGTH 1,
        "! SAP__Messages
        sap_messages           TYPE tyt_sap_message,
      END OF tys_bank_type,
      "! <p class="shorttext synchronized">List of BankType</p>
      tyt_bank_type TYPE STANDARD TABLE OF tys_bank_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Bank_Type</p>
      BEGIN OF tys_bank_type_2,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_2,
        "! <em>Key property</em> BankCountry
        bank_country               TYPE c LENGTH 3,
        "! <em>Key property</em> BankInternalID
        bank_internal_id           TYPE c LENGTH 15,
        "! <em>Key property</em> AddressRepresentationCode
        address_representation_cod TYPE c LENGTH 1,
        "! LongBankName
        long_bank_name             TYPE c LENGTH 80,
        "! LongBankBranch
        long_bank_branch           TYPE c LENGTH 80,
        "! StreetName
        street_name                TYPE c LENGTH 60,
        "! HouseNumber
        house_number               TYPE c LENGTH 10,
        "! HouseNumberSupplementText
        house_number_supplement_te TYPE c LENGTH 10,
        "! CityName
        city_name                  TYPE c LENGTH 40,
        "! PostalCode
        postal_code                TYPE c LENGTH 10,
        "! Country
        country                    TYPE c LENGTH 3,
        "! Region
        region                     TYPE c LENGTH 3,
        "! CorrespondenceLanguage
        correspondence_language    TYPE c LENGTH 2,
        "! DistrictName
        district_name              TYPE c LENGTH 40,
        "! VillageName
        village_name               TYPE c LENGTH 40,
        "! CompanyPostalCode
        company_postal_code        TYPE c LENGTH 10,
        "! StreetAddrNonDeliverableReason
        street_addr_non_deliverabl TYPE c LENGTH 4,
        "! StreetPrefixName1
        street_prefix_name_1       TYPE c LENGTH 40,
        "! StreetPrefixName2
        street_prefix_name_2       TYPE c LENGTH 40,
        "! StreetSuffixName1
        street_suffix_name_1       TYPE c LENGTH 40,
        "! StreetSuffixName2
        street_suffix_name_2       TYPE c LENGTH 40,
        "! Building
        building                   TYPE c LENGTH 20,
        "! Floor
        floor                      TYPE c LENGTH 10,
        "! RoomNumber
        room_number                TYPE c LENGTH 10,
        "! FormOfAddress
        form_of_address            TYPE c LENGTH 4,
        "! TaxJurisdiction
        tax_jurisdiction           TYPE c LENGTH 15,
        "! TransportZone
        transport_zone             TYPE c LENGTH 10,
        "! POBox
        pobox                      TYPE c LENGTH 10,
        "! POBoxAddrNonDeliverableReason
        pobox_addr_non_deliverable TYPE c LENGTH 4,
        "! POBoxIsWithoutNumber
        pobox_is_without_number    TYPE abap_bool,
        "! POBoxPostalCode
        pobox_postal_code          TYPE c LENGTH 10,
        "! POBoxLobbyName
        pobox_lobby_name           TYPE c LENGTH 40,
        "! POBoxDeviatingCityName
        pobox_deviating_city_name  TYPE c LENGTH 40,
        "! POBoxDeviatingRegion
        pobox_deviating_region     TYPE c LENGTH 3,
        "! POBoxDeviatingCountry
        pobox_deviating_country    TYPE c LENGTH 3,
        "! CareOfName
        care_of_name               TYPE c LENGTH 40,
        "! DeliveryServiceTypeCode
        delivery_service_type_code TYPE c LENGTH 4,
        "! DeliveryServiceNumber
        delivery_service_number    TYPE c LENGTH 10,
        "! AddressTimeZone
        address_time_zone          TYPE c LENGTH 6,
        "! SecondaryRegionName
        secondary_region_name      TYPE c LENGTH 40,
        "! TertiaryRegionName
        tertiary_region_name       TYPE c LENGTH 40,
        "! AddressSearchTerm1
        address_search_term_1      TYPE c LENGTH 20,
        "! AddressSearchTerm2
        address_search_term_2      TYPE c LENGTH 20,
        "! InternationalPhoneNumber
        international_phone_number TYPE c LENGTH 30,
        "! InternationalMobilePhoneNumber
        international_mobile_phone TYPE c LENGTH 30,
        "! InternationalFaxNumber
        international_fax_number   TYPE c LENGTH 30,
        "! EmailAddress
        email_address              TYPE c LENGTH 241,
        "! SAP__Messages
        sap_messages               TYPE tyt_sap_message,
      END OF tys_bank_type_2,
      "! <p class="shorttext synchronized">List of Bank_Type</p>
      tyt_bank_type_2 TYPE STANDARD TABLE OF tys_bank_type_2 WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! Bank
        "! <br/> Collection of type 'BankType'
        bank                  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'BANK',
        "! BankAddress
        "! <br/> Collection of type 'BankAddressType'
        bank_address          TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'BANK_ADDRESS',
        "! BankScriptedAddress
        "! <br/> Collection of type 'Bank_Type'
        bank_scripted_address TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'BANK_SCRIPTED_ADDRESS',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for complex types</p>
      BEGIN OF gcs_complex_type,
        "! <p class="shorttext synchronized">Internal names for SAP__Message</p>
        "! See also structure type {@link ..tys_sap_message}
        BEGIN OF sap_message,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_message,
      END OF gcs_complex_type.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for BankAddressType</p>
        "! See also structure type {@link ..tys_bank_address_type}
        BEGIN OF bank_address_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _Bank
            bank                TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'BANK',
            "! _BankScriptVariant
            bank_script_variant TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'BANK_SCRIPT_VARIANT',
          END OF navigation,
        END OF bank_address_type,
        "! <p class="shorttext synchronized">Internal names for BankType</p>
        "! See also structure type {@link ..tys_bank_type}
        BEGIN OF bank_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _BankAddress
            bank_address TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'BANK_ADDRESS',
          END OF navigation,
        END OF bank_type,
        "! <p class="shorttext synchronized">Internal names for Bank_Type</p>
        "! See also structure type {@link ..tys_bank_type_2}
        BEGIN OF bank_type_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _Bank
            bank         TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'BANK',
            "! _BankAddress
            bank_address TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'BANK_ADDRESS',
          END OF navigation,
        END OF bank_type_2,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.

