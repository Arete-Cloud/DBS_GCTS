"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>API_BUSINESS_PARTNER</em>
CLASS zarete_dbs_sc_bp_api DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">A_AddressEmailAddressType</p>
      BEGIN OF tys_a_address_email_address_ty,
        "! <em>Key property</em> AddressID
        address_id                 TYPE c LENGTH 10,
        "! <em>Key property</em> Person
        person                     TYPE c LENGTH 10,
        "! <em>Key property</em> OrdinalNumber
        ordinal_number             TYPE c LENGTH 3,
        "! IsDefaultEmailAddress
        is_default_email_address   TYPE abap_bool,
        "! EmailAddress
        email_address              TYPE c LENGTH 241,
        "! SearchEmailAddress
        search_email_address       TYPE c LENGTH 20,
        "! AddressCommunicationRemarkText
        address_communication_rema TYPE c LENGTH 50,
      END OF tys_a_address_email_address_ty,
      "! <p class="shorttext synchronized">List of A_AddressEmailAddressType</p>
      tyt_a_address_email_address_ty TYPE STANDARD TABLE OF tys_a_address_email_address_ty WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_AddressFaxNumberType</p>
      BEGIN OF tys_a_address_fax_number_type,
        "! <em>Key property</em> AddressID
        address_id                 TYPE c LENGTH 10,
        "! <em>Key property</em> Person
        person                     TYPE c LENGTH 10,
        "! <em>Key property</em> OrdinalNumber
        ordinal_number             TYPE c LENGTH 3,
        "! IsDefaultFaxNumber
        is_default_fax_number      TYPE abap_bool,
        "! FaxCountry
        fax_country                TYPE c LENGTH 3,
        "! FaxNumber
        fax_number                 TYPE c LENGTH 30,
        "! FaxNumberExtension
        fax_number_extension       TYPE c LENGTH 10,
        "! InternationalFaxNumber
        international_fax_number   TYPE c LENGTH 30,
        "! AddressCommunicationRemarkText
        address_communication_rema TYPE c LENGTH 50,
      END OF tys_a_address_fax_number_type,
      "! <p class="shorttext synchronized">List of A_AddressFaxNumberType</p>
      tyt_a_address_fax_number_type TYPE STANDARD TABLE OF tys_a_address_fax_number_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_AddressHomePageURLType</p>
      BEGIN OF tys_a_address_home_page_urltyp,
        "! <em>Key property</em> AddressID
        address_id                 TYPE c LENGTH 10,
        "! <em>Key property</em> Person
        person                     TYPE c LENGTH 10,
        "! <em>Key property</em> OrdinalNumber
        ordinal_number             TYPE c LENGTH 3,
        "! <em>Key property</em> ValidityStartDate
        validity_start_date        TYPE datn,
        "! <em>Key property</em> IsDefaultURLAddress
        is_default_urladdress      TYPE abap_bool,
        "! SearchURLAddress
        search_urladdress          TYPE c LENGTH 50,
        "! AddressCommunicationRemarkText
        address_communication_rema TYPE c LENGTH 50,
        "! URLFieldLength
        urlfield_length            TYPE int2,
        "! WebsiteURL
        website_url                TYPE string,
      END OF tys_a_address_home_page_urltyp,
      "! <p class="shorttext synchronized">List of A_AddressHomePageURLType</p>
      tyt_a_address_home_page_urltyp TYPE STANDARD TABLE OF tys_a_address_home_page_urltyp WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_AddressPhoneNumberType</p>
      BEGIN OF tys_a_address_phone_number_typ,
        "! <em>Key property</em> AddressID
        address_id                 TYPE c LENGTH 10,
        "! <em>Key property</em> Person
        person                     TYPE c LENGTH 10,
        "! <em>Key property</em> OrdinalNumber
        ordinal_number             TYPE c LENGTH 3,
        "! DestinationLocationCountry
        destination_location_count TYPE c LENGTH 3,
        "! IsDefaultPhoneNumber
        is_default_phone_number    TYPE abap_bool,
        "! PhoneNumber
        phone_number               TYPE c LENGTH 30,
        "! PhoneNumberExtension
        phone_number_extension     TYPE c LENGTH 10,
        "! InternationalPhoneNumber
        international_phone_number TYPE c LENGTH 30,
        "! PhoneNumberType
        phone_number_type          TYPE c LENGTH 1,
        "! AddressCommunicationRemarkText
        address_communication_rema TYPE c LENGTH 50,
      END OF tys_a_address_phone_number_typ,
      "! <p class="shorttext synchronized">List of A_AddressPhoneNumberType</p>
      tyt_a_address_phone_number_typ TYPE STANDARD TABLE OF tys_a_address_phone_number_typ WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BPAddressIndependentEmailType</p>
      BEGIN OF tys_a_bpaddress_independent__2,
        "! <em>Key property</em> BusinessPartner
        business_partner         TYPE c LENGTH 10,
        "! <em>Key property</em> AddressID
        address_id               TYPE c LENGTH 10,
        "! <em>Key property</em> Person
        person                   TYPE c LENGTH 10,
        "! <em>Key property</em> OrdinalNumber
        ordinal_number           TYPE c LENGTH 3,
        "! EmailAddress
        email_address            TYPE c LENGTH 241,
        "! IsDefaultEmailAddress
        is_default_email_address TYPE abap_bool,
        "! ValidityStartDate
        validity_start_date      TYPE datn,
        "! ValidityEndDate
        validity_end_date        TYPE datn,
      END OF tys_a_bpaddress_independent__2,
      "! <p class="shorttext synchronized">List of A_BPAddressIndependentEmailType</p>
      tyt_a_bpaddress_independent__2 TYPE STANDARD TABLE OF tys_a_bpaddress_independent__2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BPAddressIndependentFaxType</p>
      BEGIN OF tys_a_bpaddress_independent__3,
        "! <em>Key property</em> BusinessPartner
        business_partner           TYPE c LENGTH 10,
        "! <em>Key property</em> AddressID
        address_id                 TYPE c LENGTH 10,
        "! <em>Key property</em> Person
        person                     TYPE c LENGTH 10,
        "! <em>Key property</em> OrdinalNumber
        ordinal_number             TYPE c LENGTH 3,
        "! FaxCountry
        fax_country                TYPE c LENGTH 3,
        "! FaxAreaCodeSubscriberNumber
        fax_area_code_subscriber_n TYPE c LENGTH 30,
        "! FaxNumberExtension
        fax_number_extension       TYPE c LENGTH 10,
        "! InternationalFaxNumber
        international_fax_number   TYPE c LENGTH 30,
        "! IsDefaultFaxNumber
        is_default_fax_number      TYPE abap_bool,
        "! ValidityEndDate
        validity_end_date          TYPE datn,
        "! ValidityStartDate
        validity_start_date        TYPE datn,
      END OF tys_a_bpaddress_independent__3,
      "! <p class="shorttext synchronized">List of A_BPAddressIndependentFaxType</p>
      tyt_a_bpaddress_independent__3 TYPE STANDARD TABLE OF tys_a_bpaddress_independent__3 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BPAddressIndependentMobileType</p>
      BEGIN OF tys_a_bpaddress_independent__4,
        "! <em>Key property</em> BusinessPartner
        business_partner           TYPE c LENGTH 10,
        "! <em>Key property</em> AddressID
        address_id                 TYPE c LENGTH 10,
        "! <em>Key property</em> Person
        person                     TYPE c LENGTH 10,
        "! <em>Key property</em> OrdinalNumber
        ordinal_number             TYPE c LENGTH 3,
        "! InternationalPhoneNumber
        international_phone_number TYPE c LENGTH 30,
        "! IsDefaultPhoneNumber
        is_default_phone_number    TYPE abap_bool,
        "! MobilePhoneCountry
        mobile_phone_country       TYPE c LENGTH 3,
        "! MobilePhoneNumber
        mobile_phone_number        TYPE c LENGTH 30,
        "! PhoneNumberExtension
        phone_number_extension     TYPE c LENGTH 10,
        "! PhoneNumberType
        phone_number_type          TYPE c LENGTH 1,
        "! ValidityStartDate
        validity_start_date        TYPE datn,
        "! ValidityEndDate
        validity_end_date          TYPE datn,
      END OF tys_a_bpaddress_independent__4,
      "! <p class="shorttext synchronized">List of A_BPAddressIndependentMobileType</p>
      tyt_a_bpaddress_independent__4 TYPE STANDARD TABLE OF tys_a_bpaddress_independent__4 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BPAddressIndependentPhoneType</p>
      BEGIN OF tys_a_bpaddress_independent__5,
        "! <em>Key property</em> BusinessPartner
        business_partner           TYPE c LENGTH 10,
        "! <em>Key property</em> AddressID
        address_id                 TYPE c LENGTH 10,
        "! <em>Key property</em> Person
        person                     TYPE c LENGTH 10,
        "! <em>Key property</em> OrdinalNumber
        ordinal_number             TYPE c LENGTH 3,
        "! DestinationLocationCountry
        destination_location_count TYPE c LENGTH 3,
        "! InternationalPhoneNumber
        international_phone_number TYPE c LENGTH 30,
        "! IsDefaultPhoneNumber
        is_default_phone_number    TYPE abap_bool,
        "! PhoneNumber
        phone_number               TYPE c LENGTH 30,
        "! PhoneNumberExtension
        phone_number_extension     TYPE c LENGTH 10,
        "! PhoneNumberType
        phone_number_type          TYPE c LENGTH 1,
        "! ValidityStartDate
        validity_start_date        TYPE datn,
        "! ValidityEndDate
        validity_end_date          TYPE datn,
      END OF tys_a_bpaddress_independent__5,
      "! <p class="shorttext synchronized">List of A_BPAddressIndependentPhoneType</p>
      tyt_a_bpaddress_independent__5 TYPE STANDARD TABLE OF tys_a_bpaddress_independent__5 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BPAddressIndependentWebsiteType</p>
      BEGIN OF tys_a_bpaddress_independent__6,
        "! <em>Key property</em> BusinessPartner
        business_partner      TYPE c LENGTH 10,
        "! <em>Key property</em> AddressID
        address_id            TYPE c LENGTH 10,
        "! <em>Key property</em> Person
        person                TYPE c LENGTH 10,
        "! <em>Key property</em> OrdinalNumber
        ordinal_number        TYPE c LENGTH 3,
        "! IsDefaultURLAddress
        is_default_urladdress TYPE abap_bool,
        "! URLFieldLength
        urlfield_length       TYPE int4,
        "! WebsiteURL
        website_url           TYPE string,
      END OF tys_a_bpaddress_independent__6,
      "! <p class="shorttext synchronized">List of A_BPAddressIndependentWebsiteType</p>
      tyt_a_bpaddress_independent__6 TYPE STANDARD TABLE OF tys_a_bpaddress_independent__6 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BPAddrDepdntIntlLocNumberType</p>
      BEGIN OF tys_a_bpaddr_depdnt_intl_loc_2,
        "! <em>Key property</em> BusinessPartner
        business_partner           TYPE c LENGTH 10,
        "! <em>Key property</em> AddressID
        address_id                 TYPE c LENGTH 10,
        "! InternationalLocationNumber1
        international_location_num TYPE c LENGTH 7,
        "! InternationalLocationNumber2
        international_location_n_2 TYPE c LENGTH 5,
        "! InternationalLocationNumber3
        international_location_n_3 TYPE c LENGTH 1,
      END OF tys_a_bpaddr_depdnt_intl_loc_2,
      "! <p class="shorttext synchronized">List of A_BPAddrDepdntIntlLocNumberType</p>
      tyt_a_bpaddr_depdnt_intl_loc_2 TYPE STANDARD TABLE OF tys_a_bpaddr_depdnt_intl_loc_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BPContactToAddressType</p>
      BEGIN OF tys_a_bpcontact_to_address_typ,
        "! <em>Key property</em> RelationshipNumber
        relationship_number        TYPE c LENGTH 12,
        "! <em>Key property</em> BusinessPartnerCompany
        business_partner_company   TYPE c LENGTH 10,
        "! <em>Key property</em> BusinessPartnerPerson
        business_partner_person    TYPE c LENGTH 10,
        "! <em>Key property</em> ValidityEndDate
        validity_end_date          TYPE datn,
        "! <em>Key property</em> AddressID
        address_id                 TYPE c LENGTH 10,
        "! AddressNumber
        address_number             TYPE c LENGTH 10,
        "! AdditionalStreetPrefixName
        additional_street_prefix_n TYPE c LENGTH 40,
        "! AdditionalStreetSuffixName
        additional_street_suffix_n TYPE c LENGTH 40,
        "! AddressTimeZone
        address_time_zone          TYPE c LENGTH 6,
        "! CareOfName
        care_of_name               TYPE c LENGTH 40,
        "! CityCode
        city_code                  TYPE c LENGTH 12,
        "! CityName
        city_name                  TYPE c LENGTH 40,
        "! CompanyPostalCode
        company_postal_code        TYPE c LENGTH 10,
        "! Country
        country                    TYPE c LENGTH 3,
        "! County
        county                     TYPE c LENGTH 40,
        "! DeliveryServiceNumber
        delivery_service_number    TYPE c LENGTH 10,
        "! DeliveryServiceTypeCode
        delivery_service_type_code TYPE c LENGTH 4,
        "! District
        district                   TYPE c LENGTH 40,
        "! FormOfAddress
        form_of_address            TYPE c LENGTH 4,
        "! FullName
        full_name                  TYPE c LENGTH 80,
        "! HomeCityName
        home_city_name             TYPE c LENGTH 40,
        "! HouseNumber
        house_number               TYPE c LENGTH 10,
        "! HouseNumberSupplementText
        house_number_supplement_te TYPE c LENGTH 10,
        "! Language
        language                   TYPE c LENGTH 2,
        "! POBox
        pobox                      TYPE c LENGTH 10,
        "! POBoxDeviatingCityName
        pobox_deviating_city_name  TYPE c LENGTH 40,
        "! POBoxDeviatingCountry
        pobox_deviating_country    TYPE c LENGTH 3,
        "! POBoxDeviatingRegion
        pobox_deviating_region     TYPE c LENGTH 3,
        "! POBoxIsWithoutNumber
        pobox_is_without_number    TYPE abap_bool,
        "! POBoxLobbyName
        pobox_lobby_name           TYPE c LENGTH 40,
        "! POBoxPostalCode
        pobox_postal_code          TYPE c LENGTH 10,
        "! Person
        person                     TYPE c LENGTH 10,
        "! PostalCode
        postal_code                TYPE c LENGTH 10,
        "! PrfrdCommMediumType
        prfrd_comm_medium_type     TYPE c LENGTH 3,
        "! Region
        region                     TYPE c LENGTH 3,
        "! StreetName
        street_name                TYPE c LENGTH 60,
        "! StreetPrefixName
        street_prefix_name         TYPE c LENGTH 40,
        "! StreetSuffixName
        street_suffix_name         TYPE c LENGTH 40,
        "! TaxJurisdiction
        tax_jurisdiction           TYPE c LENGTH 15,
        "! TransportZone
        transport_zone             TYPE c LENGTH 10,
        "! AddressRepresentationCode
        address_representation_cod TYPE c LENGTH 1,
        "! ContactPersonBuilding
        contact_person_building    TYPE c LENGTH 10,
        "! ContactPersonPrfrdCommMedium
        contact_person_prfrd_comm  TYPE c LENGTH 3,
        "! ContactRelationshipDepartment
        contact_relationship_depar TYPE c LENGTH 40,
        "! ContactRelationshipFunction
        contact_relationship_funct TYPE c LENGTH 40,
        "! CorrespondenceShortName
        correspondence_short_name  TYPE c LENGTH 10,
        "! Floor
        floor                      TYPE c LENGTH 10,
        "! InhouseMail
        inhouse_mail               TYPE c LENGTH 10,
        "! IsDefaultAddress
        is_default_address         TYPE abap_bool,
        "! RoomNumber
        room_number                TYPE c LENGTH 10,
      END OF tys_a_bpcontact_to_address_typ,
      "! <p class="shorttext synchronized">List of A_BPContactToAddressType</p>
      tyt_a_bpcontact_to_address_typ TYPE STANDARD TABLE OF tys_a_bpcontact_to_address_typ WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BPContactToFuncAndDeptType</p>
      BEGIN OF tys_a_bpcontact_to_func_and__2,
        "! <em>Key property</em> RelationshipNumber
        relationship_number        TYPE c LENGTH 12,
        "! <em>Key property</em> BusinessPartnerCompany
        business_partner_company   TYPE c LENGTH 10,
        "! <em>Key property</em> BusinessPartnerPerson
        business_partner_person    TYPE c LENGTH 10,
        "! <em>Key property</em> ValidityEndDate
        validity_end_date          TYPE datn,
        "! ContactPersonAuthorityType
        contact_person_authority_t TYPE c LENGTH 1,
        "! ContactPersonDepartment
        contact_person_department  TYPE c LENGTH 4,
        "! ContactPersonDepartmentName
        contact_person_departmen_2 TYPE c LENGTH 40,
        "! ContactPersonFunction
        contact_person_function    TYPE c LENGTH 4,
        "! ContactPersonFunctionName
        contact_person_function_na TYPE c LENGTH 40,
        "! ContactPersonRemarkText
        contact_person_remark_text TYPE c LENGTH 40,
        "! ContactPersonVIPType
        contact_person_viptype     TYPE c LENGTH 1,
        "! EmailAddress
        email_address              TYPE c LENGTH 241,
        "! FaxNumber
        fax_number                 TYPE c LENGTH 30,
        "! FaxNumberExtension
        fax_number_extension       TYPE c LENGTH 10,
        "! PhoneNumber
        phone_number               TYPE c LENGTH 30,
        "! PhoneNumberExtension
        phone_number_extension     TYPE c LENGTH 10,
        "! RelationshipCategory
        relationship_category      TYPE c LENGTH 6,
      END OF tys_a_bpcontact_to_func_and__2,
      "! <p class="shorttext synchronized">List of A_BPContactToFuncAndDeptType</p>
      tyt_a_bpcontact_to_func_and__2 TYPE STANDARD TABLE OF tys_a_bpcontact_to_func_and__2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BPCreditWorthinessType</p>
      BEGIN OF tys_a_bpcredit_worthiness_type,
        "! <em>Key property</em> BusinessPartner
        business_partner           TYPE c LENGTH 10,
        "! BusPartCreditStanding
        bus_part_credit_standing   TYPE c LENGTH 1,
        "! BPCreditStandingStatus
        bpcredit_standing_status   TYPE c LENGTH 1,
        "! CreditRatingAgency
        credit_rating_agency       TYPE c LENGTH 4,
        "! BPCreditStandingComment
        bpcredit_standing_comment  TYPE c LENGTH 50,
        "! BPCreditStandingDate
        bpcredit_standing_date     TYPE datn,
        "! BPCreditStandingRating
        bpcredit_standing_rating   TYPE c LENGTH 3,
        "! BPLegalProceedingStatus
        bplegal_proceeding_status  TYPE c LENGTH 2,
        "! BPLglProceedingInitiationDate
        bplgl_proceeding_initiatio TYPE datn,
        "! BusinessPartnerIsUnderOath
        business_partner_is_under  TYPE abap_bool,
        "! BusinessPartnerOathDate
        business_partner_oath_date TYPE datn,
        "! BusinessPartnerIsBankrupt
        business_partner_is_bankru TYPE abap_bool,
        "! BusinessPartnerBankruptcyDate
        business_partner_bankruptc TYPE datn,
        "! BPForeclosureIsInitiated
        bpforeclosure_is_initiated TYPE abap_bool,
        "! BPForeclosureDate
        bpforeclosure_date         TYPE datn,
        "! BPCrdtWrthnssAccessChkIsActive
        bpcrdt_wrthnss_access_chk  TYPE c LENGTH 1,
      END OF tys_a_bpcredit_worthiness_type,
      "! <p class="shorttext synchronized">List of A_BPCreditWorthinessType</p>
      tyt_a_bpcredit_worthiness_type TYPE STANDARD TABLE OF tys_a_bpcredit_worthiness_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BPDataControllerType</p>
      BEGIN OF tys_a_bpdata_controller_type,
        "! <em>Key property</em> BusinessPartner
        business_partner           TYPE c LENGTH 10,
        "! <em>Key property</em> DataController
        data_controller            TYPE c LENGTH 30,
        "! <em>Key property</em> PurposeForPersonalData
        purpose_for_personal_data  TYPE c LENGTH 30,
        "! DataControlAssignmentStatus
        data_control_assignment_st TYPE c LENGTH 1,
        "! BPDataControllerIsDerived
        bpdata_controller_is_deriv TYPE c LENGTH 1,
        "! PurposeDerived
        purpose_derived            TYPE c LENGTH 1,
        "! PurposeType
        purpose_type               TYPE c LENGTH 1,
        "! BusinessPurposeFlag
        business_purpose_flag      TYPE c LENGTH 1,
      END OF tys_a_bpdata_controller_type,
      "! <p class="shorttext synchronized">List of A_BPDataControllerType</p>
      tyt_a_bpdata_controller_type TYPE STANDARD TABLE OF tys_a_bpdata_controller_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BPEmploymentType</p>
      BEGIN OF tys_a_bpemployment_type,
        "! <em>Key property</em> BusinessPartner
        business_partner           TYPE c LENGTH 10,
        "! <em>Key property</em> BPEmploymentStartDate
        bpemployment_start_date    TYPE datn,
        "! BPEmploymentEndDate
        bpemployment_end_date      TYPE datn,
        "! BPEmploymentStatus
        bpemployment_status        TYPE c LENGTH 2,
        "! BusPartEmplrIndstryCode
        bus_part_emplr_indstry_cod TYPE c LENGTH 10,
        "! BusinessPartnerEmployerName
        business_partner_employer  TYPE c LENGTH 35,
        "! BusinessPartnerOccupationGroup
        business_partner_occupatio TYPE c LENGTH 4,
      END OF tys_a_bpemployment_type,
      "! <p class="shorttext synchronized">List of A_BPEmploymentType</p>
      tyt_a_bpemployment_type TYPE STANDARD TABLE OF tys_a_bpemployment_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BPFinancialServicesExtnType</p>
      BEGIN OF tys_a_bpfinancial_services_e_2,
        "! <em>Key property</em> BusinessPartner
        business_partner           TYPE c LENGTH 10,
        "! BusinessPartnerIsVIP
        business_partner_is_vip    TYPE abap_bool,
        "! TradingPartner
        trading_partner            TYPE c LENGTH 6,
        "! FactoryCalendar
        factory_calendar           TYPE c LENGTH 2,
        "! BusinessPartnerOfficeCountry
        business_partner_office_co TYPE c LENGTH 3,
        "! BusinessPartnerOfficeRegion
        business_partner_office_re TYPE c LENGTH 3,
        "! BPRegisteredOfficeName
        bpregistered_office_name   TYPE c LENGTH 35,
        "! BPBalanceSheetCurrency
        bpbalance_sheet_currency   TYPE c LENGTH 5,
        "! BPLastCptlIncrAmtInBalShtCrcy
        bplast_cptl_incr_amt_in_ba TYPE p LENGTH 9 DECIMALS 3,
        "! BPLastCapitalIncreaseYear
        bplast_capital_increase_ye TYPE c LENGTH 4,
        "! BPBalanceSheetDisplayType
        bpbalance_sheet_display_ty TYPE c LENGTH 1,
        "! BusinessPartnerCitizenship
        business_partner_citizensh TYPE c LENGTH 3,
        "! BPMaritalPropertyRegime
        bpmarital_property_regime  TYPE c LENGTH 2,
        "! BusinessPartnerIncomeCurrency
        business_partner_income_cu TYPE c LENGTH 5,
        "! BPNumberOfChildren
        bpnumber_of_children       TYPE p LENGTH 2 DECIMALS 0,
        "! BPNumberOfHouseholdMembers
        bpnumber_of_household_memb TYPE p LENGTH 2 DECIMALS 0,
        "! BPAnnualNetIncAmtInIncomeCrcy
        bpannual_net_inc_amt_in_in TYPE p LENGTH 9 DECIMALS 3,
        "! BPMonthlyNetIncAmtInIncomeCrcy
        bpmonthly_net_inc_amt_in_i TYPE p LENGTH 9 DECIMALS 3,
        "! BPAnnualNetIncomeYear
        bpannual_net_income_year   TYPE c LENGTH 4,
        "! BPMonthlyNetIncomeMonth
        bpmonthly_net_income_month TYPE c LENGTH 2,
        "! BPMonthlyNetIncomeYear
        bpmonthly_net_income_year  TYPE c LENGTH 4,
        "! BPPlaceOfDeathName
        bpplace_of_death_name      TYPE c LENGTH 40,
        "! CustomerIsUnwanted
        customer_is_unwanted       TYPE abap_bool,
        "! UndesirabilityReason
        undesirability_reason      TYPE c LENGTH 2,
        "! UndesirabilityComment
        undesirability_comment     TYPE c LENGTH 35,
        "! LastCustomerContactDate
        last_customer_contact_date TYPE datn,
        "! BPGroupingCharacter
        bpgrouping_character       TYPE c LENGTH 10,
        "! BPLetterSalutation
        bpletter_salutation        TYPE c LENGTH 2,
        "! BusinessPartnerTargetGroup
        business_partner_target_gr TYPE c LENGTH 4,
        "! BusinessPartnerEmployeeGroup
        business_partner_employee  TYPE c LENGTH 4,
        "! BusinessPartnerIsEmployee
        business_partner_is_employ TYPE abap_bool,
        "! BPTermnBusRelationsBankDate
        bptermn_bus_relations_bank TYPE datn,
      END OF tys_a_bpfinancial_services_e_2,
      "! <p class="shorttext synchronized">List of A_BPFinancialServicesExtnType</p>
      tyt_a_bpfinancial_services_e_2 TYPE STANDARD TABLE OF tys_a_bpfinancial_services_e_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BPFinancialServicesReportingType</p>
      BEGIN OF tys_a_bpfinancial_services_r_2,
        "! <em>Key property</em> BusinessPartner
        business_partner           TYPE c LENGTH 10,
        "! BPIsNonResident
        bpis_non_resident          TYPE abap_bool,
        "! BPNonResidencyStartDate
        bpnon_residency_start_date TYPE datn,
        "! BPIsMultimillionLoanRecipient
        bpis_multimillion_loan_rec TYPE abap_bool,
        "! BPLoanReportingBorrowerNumber
        bploan_reporting_borrower  TYPE c LENGTH 8,
        "! BPLoanRptgBorrowerEntityNumber
        bploan_rptg_borrower_entit TYPE c LENGTH 8,
        "! BPCreditStandingReview
        bpcredit_standing_review   TYPE c LENGTH 2,
        "! BPCreditStandingReviewDate
        bpcredit_standing_review_d TYPE datn,
        "! BusinessPartnerLoanToManager
        business_partner_loan_to_m TYPE c LENGTH 2,
        "! BPCompanyRelationship
        bpcompany_relationship     TYPE c LENGTH 1,
        "! BPLoanReportingCreditorNumber
        bploan_reporting_creditor  TYPE c LENGTH 8,
        "! BPOeNBIdentNumber
        bpoe_nbident_number        TYPE c LENGTH 11,
        "! BPOeNBTargetGroup
        bpoe_nbtarget_group        TYPE c LENGTH 2,
        "! BPOeNBIdentNumberAssigned
        bpoe_nbident_number_assign TYPE c LENGTH 1,
        "! BPOeNBInstituteNumber
        bpoe_nbinstitute_number    TYPE c LENGTH 7,
        "! BusinessPartnerIsOeNBInstitute
        business_partner_is_oe_nbi TYPE abap_bool,
        "! BusinessPartnerGroup
        business_partner_group     TYPE c LENGTH 15,
        "! BPGroupAssignmentCategory
        bpgroup_assignment_categor TYPE c LENGTH 1,
        "! BusinessPartnerGroupName
        business_partner_group_nam TYPE c LENGTH 50,
        "! BusinessPartnerLegalEntity
        business_partner_legal_ent TYPE c LENGTH 2,
        "! BPGerAstRglnRestrictedAstQuota
        bpger_ast_rgln_restricted  TYPE c LENGTH 1,
        "! BusinessPartnerDebtorGroup
        business_partner_debtor_gr TYPE c LENGTH 1,
        "! BusinessPartnerBusinessPurpose
        business_partner_business  TYPE c LENGTH 2,
        "! BusinessPartnerRiskGroup
        business_partner_risk_grou TYPE c LENGTH 1,
        "! BPRiskGroupingDate
        bprisk_grouping_date       TYPE datn,
        "! BPHasGroupAffiliation
        bphas_group_affiliation    TYPE abap_bool,
        "! BPIsMonetaryFinInstitution
        bpis_monetary_fin_institut TYPE abap_bool,
        "! BPCrdtStandingReviewIsRequired
        bpcrdt_standing_review_is  TYPE abap_bool,
        "! BPLoanMonitoringIsRequired
        bploan_monitoring_is_requi TYPE abap_bool,
        "! BPHasCreditingRelief
        bphas_crediting_relief     TYPE abap_bool,
        "! BPInvestInRstrcdAstIsAuthzd
        bpinvest_in_rstrcd_ast_is  TYPE abap_bool,
        "! BPCentralBankCountryRegion
        bpcentral_bank_country_reg TYPE c LENGTH 4,
      END OF tys_a_bpfinancial_services_r_2,
      "! <p class="shorttext synchronized">List of A_BPFinancialServicesReportingType</p>
      tyt_a_bpfinancial_services_r_2 TYPE STANDARD TABLE OF tys_a_bpfinancial_services_r_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BPFiscalYearInformationType</p>
      BEGIN OF tys_a_bpfiscal_year_informat_2,
        "! <em>Key property</em> BusinessPartner
        business_partner           TYPE c LENGTH 10,
        "! <em>Key property</em> BusinessPartnerFiscalYear
        business_partner_fiscal_ye TYPE c LENGTH 4,
        "! BPBalanceSheetCurrency
        bpbalance_sheet_currency   TYPE c LENGTH 5,
        "! BPAnnualStockholderMeetingDate
        bpannual_stockholder_meeti TYPE datn,
        "! BPFiscalYearStartDate
        bpfiscal_year_start_date   TYPE datn,
        "! BPFiscalYearEndDate
        bpfiscal_year_end_date     TYPE datn,
        "! BPFiscalYearIsClosed
        bpfiscal_year_is_closed    TYPE abap_bool,
        "! BPFiscalYearClosingDate
        bpfiscal_year_closing_date TYPE datn,
        "! BPFsclYrCnsldtdFinStatementDte
        bpfscl_yr_cnsldtd_fin_stat TYPE datn,
        "! BPCapitalStockAmtInBalShtCrcy
        bpcapital_stock_amt_in_bal TYPE p LENGTH 9 DECIMALS 3,
        "! BPIssdStockCptlAmtInBalShtCrcy
        bpissd_stock_cptl_amt_in_b TYPE p LENGTH 9 DECIMALS 3,
        "! BPPartcipnCertAmtInBalShtCrcy
        bppartcipn_cert_amt_in_bal TYPE p LENGTH 9 DECIMALS 3,
        "! BPEquityCapitalAmtInBalShtCrcy
        bpequity_capital_amt_in_ba TYPE p LENGTH 9 DECIMALS 3,
        "! BPGrossPremiumAmtInBalShtCrcy
        bpgross_premium_amt_in_bal TYPE p LENGTH 9 DECIMALS 3,
        "! BPNetPremiumAmtInBalShtCrcy
        bpnet_premium_amt_in_bal_s TYPE p LENGTH 9 DECIMALS 3,
        "! BPAnnualSalesAmtInBalShtCrcy
        bpannual_sales_amt_in_bal  TYPE p LENGTH 9 DECIMALS 3,
        "! BPAnnualNetIncAmtInBalShtCrcy
        bpannual_net_inc_amt_in_ba TYPE p LENGTH 9 DECIMALS 3,
        "! BPDividendDistrAmtInBalShtCrcy
        bpdividend_distr_amt_in_ba TYPE p LENGTH 9 DECIMALS 3,
        "! BPDebtRatioInYears
        bpdebt_ratio_in_years      TYPE p LENGTH 4 DECIMALS 3,
        "! BPAnnualPnLAmtInBalShtCrcy
        bpannual_pn_lamt_in_bal_sh TYPE p LENGTH 9 DECIMALS 3,
        "! BPBalSheetTotalAmtInBalShtCrcy
        bpbal_sheet_total_amt_in_b TYPE p LENGTH 9 DECIMALS 3,
        "! BPNumberOfEmployees
        bpnumber_of_employees      TYPE c LENGTH 7,
        "! BPCptlReserveAmtInBalShtCrcy
        bpcptl_reserve_amt_in_bal  TYPE p LENGTH 9 DECIMALS 3,
        "! BPLglRevnRsrvAmtInBalShtCrcy
        bplgl_revn_rsrv_amt_in_bal TYPE p LENGTH 9 DECIMALS 3,
        "! RevnRsrvOwnStkAmtInBalShtCrcy
        revn_rsrv_own_stk_amt_in_b TYPE p LENGTH 9 DECIMALS 3,
        "! BPStatryReserveAmtInBalShtCrcy
        bpstatry_reserve_amt_in_ba TYPE p LENGTH 9 DECIMALS 3,
        "! BPOthRevnRsrvAmtInBalShtCrcy
        bpoth_revn_rsrv_amt_in_bal TYPE p LENGTH 9 DECIMALS 3,
        "! BPPnLCarryfwdAmtInBalShtCrcy
        bppn_lcarryfwd_amt_in_bal  TYPE p LENGTH 9 DECIMALS 3,
        "! BPSuborddLbltyAmtInBalShtCrcy
        bpsubordd_lblty_amt_in_bal TYPE p LENGTH 9 DECIMALS 3,
        "! BPRetOnTotalCptlEmpldInPercent
        bpret_on_total_cptl_empld  TYPE p LENGTH 3 DECIMALS 2,
        "! BPDebtClearancePeriodInYears
        bpdebt_clearance_period_in TYPE p LENGTH 3 DECIMALS 2,
        "! BPFinancingCoeffInPercent
        bpfinancing_coeff_in_perce TYPE p LENGTH 3 DECIMALS 2,
        "! BPEquityRatioInPercent
        bpequity_ratio_in_percent  TYPE p LENGTH 3 DECIMALS 2,
      END OF tys_a_bpfiscal_year_informat_2,
      "! <p class="shorttext synchronized">List of A_BPFiscalYearInformationType</p>
      tyt_a_bpfiscal_year_informat_2 TYPE STANDARD TABLE OF tys_a_bpfiscal_year_informat_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BPIntlAddressVersionType</p>
      BEGIN OF tys_a_bpintl_address_version_t,
        "! <em>Key property</em> BusinessPartner
        business_partner           TYPE c LENGTH 10,
        "! <em>Key property</em> AddressID
        address_id                 TYPE c LENGTH 10,
        "! <em>Key property</em> AddressRepresentationCode
        address_representation_cod TYPE c LENGTH 1,
        "! AddresseeFullName
        addressee_full_name        TYPE c LENGTH 80,
        "! AddressIDByExternalSystem
        address_idby_external_syst TYPE c LENGTH 20,
        "! AddressPersonID
        address_person_id          TYPE c LENGTH 10,
        "! AddressSearchTerm1
        address_search_term_1      TYPE c LENGTH 20,
        "! AddressSearchTerm2
        address_search_term_2      TYPE c LENGTH 20,
        "! AddressTimeZone
        address_time_zone          TYPE c LENGTH 6,
        "! CareOfName
        care_of_name               TYPE c LENGTH 40,
        "! CityName
        city_name                  TYPE c LENGTH 40,
        "! CityNumber
        city_number                TYPE c LENGTH 12,
        "! CompanyPostalCode
        company_postal_code        TYPE c LENGTH 10,
        "! Country
        country                    TYPE c LENGTH 3,
        "! DeliveryServiceNumber
        delivery_service_number    TYPE c LENGTH 10,
        "! DeliveryServiceTypeCode
        delivery_service_type_code TYPE c LENGTH 4,
        "! DistrictName
        district_name              TYPE c LENGTH 40,
        "! FormOfAddress
        form_of_address            TYPE c LENGTH 4,
        "! HouseNumber
        house_number               TYPE c LENGTH 10,
        "! HouseNumberSupplementText
        house_number_supplement_te TYPE c LENGTH 10,
        "! Language
        language                   TYPE c LENGTH 2,
        "! OrganizationName1
        organization_name_1        TYPE c LENGTH 40,
        "! OrganizationName2
        organization_name_2        TYPE c LENGTH 40,
        "! OrganizationName3
        organization_name_3        TYPE c LENGTH 40,
        "! OrganizationName4
        organization_name_4        TYPE c LENGTH 40,
        "! PersonFamilyName
        person_family_name         TYPE c LENGTH 40,
        "! PersonGivenName
        person_given_name          TYPE c LENGTH 40,
        "! POBox
        pobox                      TYPE c LENGTH 10,
        "! POBoxDeviatingCityName
        pobox_deviating_city_name  TYPE c LENGTH 40,
        "! POBoxDeviatingCountry
        pobox_deviating_country    TYPE c LENGTH 3,
        "! POBoxDeviatingRegion
        pobox_deviating_region     TYPE c LENGTH 3,
        "! POBoxIsWithoutNumber
        pobox_is_without_number    TYPE abap_bool,
        "! POBoxLobbyName
        pobox_lobby_name           TYPE c LENGTH 40,
        "! POBoxPostalCode
        pobox_postal_code          TYPE c LENGTH 10,
        "! PostalCode
        postal_code                TYPE c LENGTH 10,
        "! PrfrdCommMediumType
        prfrd_comm_medium_type     TYPE c LENGTH 3,
        "! Region
        region                     TYPE c LENGTH 3,
        "! SecondaryRegion
        secondary_region           TYPE c LENGTH 8,
        "! SecondaryRegionName
        secondary_region_name      TYPE c LENGTH 40,
        "! StreetName
        street_name                TYPE c LENGTH 60,
        "! StreetPrefixName1
        street_prefix_name_1       TYPE c LENGTH 40,
        "! StreetPrefixName2
        street_prefix_name_2       TYPE c LENGTH 40,
        "! StreetSuffixName1
        street_suffix_name_1       TYPE c LENGTH 40,
        "! StreetSuffixName2
        street_suffix_name_2       TYPE c LENGTH 40,
        "! TaxJurisdiction
        tax_jurisdiction           TYPE c LENGTH 15,
        "! TertiaryRegion
        tertiary_region            TYPE c LENGTH 8,
        "! TertiaryRegionName
        tertiary_region_name       TYPE c LENGTH 40,
        "! TransportZone
        transport_zone             TYPE c LENGTH 10,
        "! VillageName
        village_name               TYPE c LENGTH 40,
      END OF tys_a_bpintl_address_version_t,
      "! <p class="shorttext synchronized">List of A_BPIntlAddressVersionType</p>
      tyt_a_bpintl_address_version_t TYPE STANDARD TABLE OF tys_a_bpintl_address_version_t WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BPRelationshipType</p>
      BEGIN OF tys_a_bprelationship_type,
        "! <em>Key property</em> RelationshipNumber
        relationship_number      TYPE c LENGTH 12,
        "! <em>Key property</em> BusinessPartner1
        business_partner_1       TYPE c LENGTH 10,
        "! <em>Key property</em> BusinessPartner2
        business_partner_2       TYPE c LENGTH 10,
        "! <em>Key property</em> ValidityEndDate
        validity_end_date        TYPE datn,
        "! ValidityStartDate
        validity_start_date      TYPE datn,
        "! IsStandardRelationship
        is_standard_relationship TYPE abap_bool,
        "! RelationshipCategory
        relationship_category    TYPE c LENGTH 6,
        "! BPRelationshipType
        bprelationship_type      TYPE c LENGTH 4,
        "! CreatedByUser
        created_by_user          TYPE c LENGTH 12,
        "! CreationDate
        creation_date            TYPE datn,
        "! CreationTime
        creation_time            TYPE timn,
        "! LastChangedByUser
        last_changed_by_user     TYPE c LENGTH 12,
        "! LastChangeDate
        last_change_date         TYPE datn,
        "! LastChangeTime
        last_change_time         TYPE timn,
      END OF tys_a_bprelationship_type,
      "! <p class="shorttext synchronized">List of A_BPRelationshipType</p>
      tyt_a_bprelationship_type TYPE STANDARD TABLE OF tys_a_bprelationship_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BusinessPartnerAddressType</p>
      BEGIN OF tys_a_business_partner_addre_2,
        "! <em>Key property</em> BusinessPartner
        business_partner           TYPE c LENGTH 10,
        "! <em>Key property</em> AddressID
        address_id                 TYPE c LENGTH 10,
        "! ValidityStartDate
        validity_start_date        TYPE timestamp,
        "! ValidityEndDate
        validity_end_date          TYPE timestamp,
        "! AuthorizationGroup
        authorization_group        TYPE c LENGTH 4,
        "! AddressUUID
        address_uuid               TYPE sysuuid_x16,
        "! AdditionalStreetPrefixName
        additional_street_prefix_n TYPE c LENGTH 40,
        "! AdditionalStreetSuffixName
        additional_street_suffix_n TYPE c LENGTH 40,
        "! AddressTimeZone
        address_time_zone          TYPE c LENGTH 6,
        "! CareOfName
        care_of_name               TYPE c LENGTH 40,
        "! CityCode
        city_code                  TYPE c LENGTH 12,
        "! CityName
        city_name                  TYPE c LENGTH 40,
        "! CompanyPostalCode
        company_postal_code        TYPE c LENGTH 10,
        "! Country
        country                    TYPE c LENGTH 3,
        "! County
        county                     TYPE c LENGTH 40,
        "! DeliveryServiceNumber
        delivery_service_number    TYPE c LENGTH 10,
        "! DeliveryServiceTypeCode
        delivery_service_type_code TYPE c LENGTH 4,
        "! District
        district                   TYPE c LENGTH 40,
        "! FormOfAddress
        form_of_address            TYPE c LENGTH 4,
        "! FullName
        full_name                  TYPE c LENGTH 80,
        "! HomeCityName
        home_city_name             TYPE c LENGTH 40,
        "! HouseNumber
        house_number               TYPE c LENGTH 10,
        "! HouseNumberSupplementText
        house_number_supplement_te TYPE c LENGTH 10,
        "! Language
        language                   TYPE c LENGTH 2,
        "! POBox
        pobox                      TYPE c LENGTH 10,
        "! POBoxDeviatingCityName
        pobox_deviating_city_name  TYPE c LENGTH 40,
        "! POBoxDeviatingCountry
        pobox_deviating_country    TYPE c LENGTH 3,
        "! POBoxDeviatingRegion
        pobox_deviating_region     TYPE c LENGTH 3,
        "! POBoxIsWithoutNumber
        pobox_is_without_number    TYPE abap_bool,
        "! POBoxLobbyName
        pobox_lobby_name           TYPE c LENGTH 40,
        "! POBoxPostalCode
        pobox_postal_code          TYPE c LENGTH 10,
        "! Person
        person                     TYPE c LENGTH 10,
        "! PostalCode
        postal_code                TYPE c LENGTH 10,
        "! PrfrdCommMediumType
        prfrd_comm_medium_type     TYPE c LENGTH 3,
        "! Region
        region                     TYPE c LENGTH 3,
        "! StreetName
        street_name                TYPE c LENGTH 60,
        "! StreetPrefixName
        street_prefix_name         TYPE c LENGTH 40,
        "! StreetSuffixName
        street_suffix_name         TYPE c LENGTH 40,
        "! TaxJurisdiction
        tax_jurisdiction           TYPE c LENGTH 15,
        "! TransportZone
        transport_zone             TYPE c LENGTH 10,
        "! AddressIDByExternalSystem
        address_idby_external_syst TYPE c LENGTH 20,
        "! CountyCode
        county_code                TYPE c LENGTH 8,
        "! TownshipCode
        township_code              TYPE c LENGTH 8,
        "! TownshipName
        township_name              TYPE c LENGTH 40,
      END OF tys_a_business_partner_addre_2,
      "! <p class="shorttext synchronized">List of A_BusinessPartnerAddressType</p>
      tyt_a_business_partner_addre_2 TYPE STANDARD TABLE OF tys_a_business_partner_addre_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BusinessPartnerAliasType</p>
      BEGIN OF tys_a_business_partner_alias_t,
        "! <em>Key property</em> BusinessPartner
        business_partner           TYPE c LENGTH 10,
        "! <em>Key property</em> BPAliasPositionNumber
        bpalias_position_number    TYPE c LENGTH 3,
        "! BusinessPartnerAliasName
        business_partner_alias_nam TYPE c LENGTH 80,
      END OF tys_a_business_partner_alias_t,
      "! <p class="shorttext synchronized">List of A_BusinessPartnerAliasType</p>
      tyt_a_business_partner_alias_t TYPE STANDARD TABLE OF tys_a_business_partner_alias_t WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BusinessPartnerBankType</p>
      BEGIN OF tys_a_business_partner_bank_ty,
        "! <em>Key property</em> BusinessPartner
        business_partner           TYPE c LENGTH 10,
        "! <em>Key property</em> BankIdentification
        bank_identification        TYPE c LENGTH 4,
        "! BankCountryKey
        bank_country_key           TYPE c LENGTH 3,
        "! BankName
        bank_name                  TYPE c LENGTH 60,
        "! BankNumber
        bank_number                TYPE c LENGTH 15,
        "! SWIFTCode
        swiftcode                  TYPE c LENGTH 11,
        "! BankControlKey
        bank_control_key           TYPE c LENGTH 2,
        "! BankAccountHolderName
        bank_account_holder_name   TYPE c LENGTH 60,
        "! BankAccountName
        bank_account_name          TYPE c LENGTH 40,
        "! ValidityStartDate
        validity_start_date        TYPE timestamp,
        "! ValidityEndDate
        validity_end_date          TYPE timestamp,
        "! IBAN
        iban                       TYPE c LENGTH 34,
        "! IBANValidityStartDate
        ibanvalidity_start_date    TYPE datn,
        "! BankAccount
        bank_account               TYPE c LENGTH 18,
        "! BankAccountReferenceText
        bank_account_reference_tex TYPE c LENGTH 20,
        "! CollectionAuthInd
        collection_auth_ind        TYPE abap_bool,
        "! CityName
        city_name                  TYPE c LENGTH 35,
        "! AuthorizationGroup
        authorization_group        TYPE c LENGTH 4,
      END OF tys_a_business_partner_bank_ty,
      "! <p class="shorttext synchronized">List of A_BusinessPartnerBankType</p>
      tyt_a_business_partner_bank_ty TYPE STANDARD TABLE OF tys_a_business_partner_bank_ty WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BusinessPartnerContactType</p>
      BEGIN OF tys_a_business_partner_conta_2,
        "! <em>Key property</em> RelationshipNumber
        relationship_number      TYPE c LENGTH 12,
        "! <em>Key property</em> BusinessPartnerCompany
        business_partner_company TYPE c LENGTH 10,
        "! <em>Key property</em> BusinessPartnerPerson
        business_partner_person  TYPE c LENGTH 10,
        "! <em>Key property</em> ValidityEndDate
        validity_end_date        TYPE datn,
        "! ValidityStartDate
        validity_start_date      TYPE datn,
        "! IsStandardRelationship
        is_standard_relationship TYPE abap_bool,
        "! RelationshipCategory
        relationship_category    TYPE c LENGTH 6,
      END OF tys_a_business_partner_conta_2,
      "! <p class="shorttext synchronized">List of A_BusinessPartnerContactType</p>
      tyt_a_business_partner_conta_2 TYPE STANDARD TABLE OF tys_a_business_partner_conta_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BusinessPartnerIsBankType</p>
      BEGIN OF tys_a_business_partner_is_ba_2,
        "! <em>Key property</em> BusinessPartner
        business_partner  TYPE c LENGTH 10,
        "! BankKey
        bank_key          TYPE c LENGTH 15,
        "! BankCountry
        bank_country      TYPE c LENGTH 3,
        "! BPMinimumReserve
        bpminimum_reserve TYPE c LENGTH 1,
      END OF tys_a_business_partner_is_ba_2,
      "! <p class="shorttext synchronized">List of A_BusinessPartnerIsBankType</p>
      tyt_a_business_partner_is_ba_2 TYPE STANDARD TABLE OF tys_a_business_partner_is_ba_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BusinessPartnerPaymentCardType</p>
      BEGIN OF tys_a_business_partner_payme_2,
        "! <em>Key property</em> BusinessPartner
        business_partner   TYPE c LENGTH 10,
        "! <em>Key property</em> PaymentCardID
        payment_card_id    TYPE c LENGTH 6,
        "! <em>Key property</em> PaymentCardType
        payment_card_type  TYPE c LENGTH 4,
        "! <em>Key property</em> CardNumber
        card_number        TYPE c LENGTH 25,
        "! IsStandardCard
        is_standard_card   TYPE abap_bool,
        "! CardDescription
        card_description   TYPE c LENGTH 40,
        "! ValidityDate
        validity_date      TYPE datn,
        "! ValidityEndDate
        validity_end_date  TYPE datn,
        "! CardHolder
        card_holder        TYPE c LENGTH 40,
        "! CardIssuingBank
        card_issuing_bank  TYPE c LENGTH 40,
        "! CardIssueDate
        card_issue_date    TYPE datn,
        "! PaymentCardLock
        payment_card_lock  TYPE c LENGTH 2,
        "! MaskedCardNumber
        masked_card_number TYPE c LENGTH 25,
      END OF tys_a_business_partner_payme_2,
      "! <p class="shorttext synchronized">List of A_BusinessPartnerPaymentCardType</p>
      tyt_a_business_partner_payme_2 TYPE STANDARD TABLE OF tys_a_business_partner_payme_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BusinessPartnerRatingType</p>
      BEGIN OF tys_a_business_partner_ratin_2,
        "! <em>Key property</em> BusinessPartner
        business_partner           TYPE c LENGTH 10,
        "! <em>Key property</em> BusinessPartnerRatingProcedure
        business_partner_rating_pr TYPE c LENGTH 10,
        "! <em>Key property</em> BPRatingValidityEndDate
        bprating_validity_end_date TYPE datn,
        "! BusinessPartnerRatingGrade
        business_partner_rating_gr TYPE c LENGTH 10,
        "! BusinessPartnerRatingTrend
        business_partner_rating_tr TYPE c LENGTH 2,
        "! BPRatingValidityStartDate
        bprating_validity_start_da TYPE datn,
        "! BPRatingCreationDate
        bprating_creation_date     TYPE datn,
        "! BusinessPartnerRatingComment
        business_partner_rating_co TYPE c LENGTH 60,
        "! BusinessPartnerRatingIsAllowed
        business_partner_rating_is TYPE abap_bool,
        "! BPRatingIsValidOnKeyDate
        bprating_is_valid_on_key_d TYPE abap_bool,
        "! BusinessPartnerRatingKeyDate
        business_partner_rating_ke TYPE datn,
        "! BusinessPartnerRatingIsExpired
        business_partner_rating__2 TYPE abap_bool,
        "! BPRatingLongComment
        bprating_long_comment      TYPE c LENGTH 255,
      END OF tys_a_business_partner_ratin_2,
      "! <p class="shorttext synchronized">List of A_BusinessPartnerRatingType</p>
      tyt_a_business_partner_ratin_2 TYPE STANDARD TABLE OF tys_a_business_partner_ratin_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BusinessPartnerRoleType</p>
      BEGIN OF tys_a_business_partner_role_ty,
        "! <em>Key property</em> BusinessPartner
        business_partner      TYPE c LENGTH 10,
        "! <em>Key property</em> BusinessPartnerRole
        business_partner_role TYPE c LENGTH 6,
        "! ValidFrom
        valid_from            TYPE timestamp,
        "! ValidTo
        valid_to              TYPE timestamp,
        "! AuthorizationGroup
        authorization_group   TYPE c LENGTH 4,
      END OF tys_a_business_partner_role_ty,
      "! <p class="shorttext synchronized">List of A_BusinessPartnerRoleType</p>
      tyt_a_business_partner_role_ty TYPE STANDARD TABLE OF tys_a_business_partner_role_ty WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BusinessPartnerTaxNumberType</p>
      BEGIN OF tys_a_business_partner_tax_n_2,
        "! <em>Key property</em> BusinessPartner
        business_partner    TYPE c LENGTH 10,
        "! <em>Key property</em> BPTaxType
        bptax_type          TYPE c LENGTH 4,
        "! BPTaxNumber
        bptax_number        TYPE c LENGTH 20,
        "! BPTaxLongNumber
        bptax_long_number   TYPE c LENGTH 60,
        "! AuthorizationGroup
        authorization_group TYPE c LENGTH 4,
      END OF tys_a_business_partner_tax_n_2,
      "! <p class="shorttext synchronized">List of A_BusinessPartnerTaxNumberType</p>
      tyt_a_business_partner_tax_n_2 TYPE STANDARD TABLE OF tys_a_business_partner_tax_n_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BusinessPartnerType</p>
      BEGIN OF tys_a_business_partner_type,
        "! <em>Key property</em> BusinessPartner
        business_partner           TYPE c LENGTH 10,
        "! Customer
        customer                   TYPE c LENGTH 10,
        "! Supplier
        supplier                   TYPE c LENGTH 10,
        "! AcademicTitle
        academic_title             TYPE c LENGTH 4,
        "! AuthorizationGroup
        authorization_group        TYPE c LENGTH 4,
        "! BusinessPartnerCategory
        business_partner_category  TYPE c LENGTH 1,
        "! BusinessPartnerFullName
        business_partner_full_name TYPE c LENGTH 81,
        "! BusinessPartnerGrouping
        business_partner_grouping  TYPE c LENGTH 4,
        "! BusinessPartnerName
        business_partner_name      TYPE c LENGTH 81,
        "! BusinessPartnerUUID
        business_partner_uuid      TYPE sysuuid_x16,
        "! CorrespondenceLanguage
        correspondence_language    TYPE c LENGTH 2,
        "! CreatedByUser
        created_by_user            TYPE c LENGTH 12,
        "! CreationDate
        creation_date              TYPE datn,
        "! CreationTime
        creation_time              TYPE timn,
        "! FirstName
        first_name                 TYPE c LENGTH 40,
        "! FormOfAddress
        form_of_address            TYPE c LENGTH 4,
        "! Industry
        industry                   TYPE c LENGTH 10,
        "! InternationalLocationNumber1
        international_location_num TYPE c LENGTH 7,
        "! InternationalLocationNumber2
        international_location_n_2 TYPE c LENGTH 5,
        "! IsFemale
        is_female                  TYPE abap_bool,
        "! IsMale
        is_male                    TYPE abap_bool,
        "! IsNaturalPerson
        is_natural_person          TYPE c LENGTH 1,
        "! IsSexUnknown
        is_sex_unknown             TYPE abap_bool,
        "! GenderCodeName
        gender_code_name           TYPE c LENGTH 1,
        "! Language
        language                   TYPE c LENGTH 2,
        "! LastChangeDate
        last_change_date           TYPE datn,
        "! LastChangeTime
        last_change_time           TYPE timn,
        "! LastChangedByUser
        last_changed_by_user       TYPE c LENGTH 12,
        "! LastName
        last_name                  TYPE c LENGTH 40,
        "! LegalForm
        legal_form                 TYPE c LENGTH 2,
        "! OrganizationBPName1
        organization_bpname_1      TYPE c LENGTH 40,
        "! OrganizationBPName2
        organization_bpname_2      TYPE c LENGTH 40,
        "! OrganizationBPName3
        organization_bpname_3      TYPE c LENGTH 40,
        "! OrganizationBPName4
        organization_bpname_4      TYPE c LENGTH 40,
        "! OrganizationFoundationDate
        organization_foundation_da TYPE datn,
        "! OrganizationLiquidationDate
        organization_liquidation_d TYPE datn,
        "! SearchTerm1
        search_term_1              TYPE c LENGTH 20,
        "! SearchTerm2
        search_term_2              TYPE c LENGTH 20,
        "! AdditionalLastName
        additional_last_name       TYPE c LENGTH 40,
        "! BirthDate
        birth_date                 TYPE datn,
        "! BusinessPartnerBirthDateStatus
        business_partner_birth_dat TYPE c LENGTH 1,
        "! BusinessPartnerBirthplaceName
        business_partner_birthplac TYPE c LENGTH 40,
        "! BusinessPartnerDeathDate
        business_partner_death_dat TYPE datn,
        "! BusinessPartnerIsBlocked
        business_partner_is_blocke TYPE abap_bool,
        "! BusinessPartnerType
        business_partner_type      TYPE c LENGTH 4,
        "! ETag
        etag                       TYPE c LENGTH 26,
        "! GroupBusinessPartnerName1
        group_business_partner_nam TYPE c LENGTH 40,
        "! GroupBusinessPartnerName2
        group_business_partner_n_2 TYPE c LENGTH 40,
        "! IndependentAddressID
        independent_address_id     TYPE c LENGTH 10,
        "! InternationalLocationNumber3
        international_location_n_3 TYPE c LENGTH 1,
        "! MiddleName
        middle_name                TYPE c LENGTH 40,
        "! NameCountry
        name_country               TYPE c LENGTH 3,
        "! NameFormat
        name_format                TYPE c LENGTH 2,
        "! PersonFullName
        person_full_name           TYPE c LENGTH 80,
        "! PersonNumber
        person_number              TYPE c LENGTH 10,
        "! IsMarkedForArchiving
        is_marked_for_archiving    TYPE abap_bool,
        "! BusinessPartnerIDByExtSystem
        business_partner_idby_ext  TYPE c LENGTH 20,
        "! BusinessPartnerPrintFormat
        business_partner_print_for TYPE c LENGTH 1,
        "! BusinessPartnerOccupation
        business_partner_occupatio TYPE c LENGTH 4,
        "! BusPartMaritalStatus
        bus_part_marital_status    TYPE c LENGTH 1,
        "! BusPartNationality
        bus_part_nationality       TYPE c LENGTH 3,
        "! BusinessPartnerBirthName
        business_partner_birth_nam TYPE c LENGTH 40,
        "! BusinessPartnerSupplementName
        business_partner_supplemen TYPE c LENGTH 4,
        "! NaturalPersonEmployerName
        natural_person_employer_na TYPE c LENGTH 35,
        "! LastNamePrefix
        last_name_prefix           TYPE c LENGTH 4,
        "! LastNameSecondPrefix
        last_name_second_prefix    TYPE c LENGTH 4,
        "! Initials
        initials                   TYPE c LENGTH 10,
        "! BPDataControllerIsNotRequired
        bpdata_controller_is_not_r TYPE abap_bool,
        "! TradingPartner
        trading_partner            TYPE c LENGTH 6,
      END OF tys_a_business_partner_type,
      "! <p class="shorttext synchronized">List of A_BusinessPartnerType</p>
      tyt_a_business_partner_type TYPE STANDARD TABLE OF tys_a_business_partner_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BusPartAddrDepdntTaxNmbrType</p>
      BEGIN OF tys_a_bus_part_addr_depdnt_t_2,
        "! <em>Key property</em> BusinessPartner
        business_partner    TYPE c LENGTH 10,
        "! <em>Key property</em> AddressID
        address_id          TYPE c LENGTH 10,
        "! <em>Key property</em> BPTaxType
        bptax_type          TYPE c LENGTH 4,
        "! BPTaxNumber
        bptax_number        TYPE c LENGTH 20,
        "! BPTaxLongNumber
        bptax_long_number   TYPE c LENGTH 60,
        "! AuthorizationGroup
        authorization_group TYPE c LENGTH 4,
      END OF tys_a_bus_part_addr_depdnt_t_2,
      "! <p class="shorttext synchronized">List of A_BusPartAddrDepdntTaxNmbrType</p>
      tyt_a_bus_part_addr_depdnt_t_2 TYPE STANDARD TABLE OF tys_a_bus_part_addr_depdnt_t_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BuPaAddressUsageType</p>
      BEGIN OF tys_a_bu_pa_address_usage_type,
        "! <em>Key property</em> BusinessPartner
        business_partner    TYPE c LENGTH 10,
        "! <em>Key property</em> ValidityEndDate
        validity_end_date   TYPE timestamp,
        "! <em>Key property</em> AddressUsage
        address_usage       TYPE c LENGTH 10,
        "! <em>Key property</em> AddressID
        address_id          TYPE c LENGTH 10,
        "! ValidityStartDate
        validity_start_date TYPE timestamp,
        "! StandardUsage
        standard_usage      TYPE abap_bool,
        "! AuthorizationGroup
        authorization_group TYPE c LENGTH 4,
      END OF tys_a_bu_pa_address_usage_type,
      "! <p class="shorttext synchronized">List of A_BuPaAddressUsageType</p>
      tyt_a_bu_pa_address_usage_type TYPE STANDARD TABLE OF tys_a_bu_pa_address_usage_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BuPaIdentificationType</p>
      BEGIN OF tys_a_bu_pa_identification_typ,
        "! <em>Key property</em> BusinessPartner
        business_partner           TYPE c LENGTH 10,
        "! <em>Key property</em> BPIdentificationType
        bpidentification_type      TYPE c LENGTH 6,
        "! <em>Key property</em> BPIdentificationNumber
        bpidentification_number    TYPE c LENGTH 60,
        "! BPIdnNmbrIssuingInstitute
        bpidn_nmbr_issuing_institu TYPE c LENGTH 40,
        "! BPIdentificationEntryDate
        bpidentification_entry_dat TYPE datn,
        "! Country
        country                    TYPE c LENGTH 3,
        "! Region
        region                     TYPE c LENGTH 3,
        "! ValidityStartDate
        validity_start_date        TYPE datn,
        "! ValidityEndDate
        validity_end_date          TYPE datn,
        "! AuthorizationGroup
        authorization_group        TYPE c LENGTH 4,
      END OF tys_a_bu_pa_identification_typ,
      "! <p class="shorttext synchronized">List of A_BuPaIdentificationType</p>
      tyt_a_bu_pa_identification_typ TYPE STANDARD TABLE OF tys_a_bu_pa_identification_typ WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BuPaIndustryType</p>
      BEGIN OF tys_a_bu_pa_industry_type,
        "! <em>Key property</em> IndustrySector
        industry_sector          TYPE c LENGTH 10,
        "! <em>Key property</em> IndustrySystemType
        industry_system_type     TYPE c LENGTH 4,
        "! <em>Key property</em> BusinessPartner
        business_partner         TYPE c LENGTH 10,
        "! IsStandardIndustry
        is_standard_industry     TYPE c LENGTH 1,
        "! IndustryKeyDescription
        industry_key_description TYPE c LENGTH 100,
      END OF tys_a_bu_pa_industry_type,
      "! <p class="shorttext synchronized">List of A_BuPaIndustryType</p>
      tyt_a_bu_pa_industry_type TYPE STANDARD TABLE OF tys_a_bu_pa_industry_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_CustomerCompanyTextType</p>
      BEGIN OF tys_a_customer_company_text_ty,
        "! <em>Key property</em> Customer
        customer     TYPE c LENGTH 10,
        "! <em>Key property</em> CompanyCode
        company_code TYPE c LENGTH 4,
        "! <em>Key property</em> Language
        language     TYPE c LENGTH 2,
        "! <em>Key property</em> LongTextID
        long_text_id TYPE c LENGTH 4,
        "! LongText
        long_text    TYPE string,
      END OF tys_a_customer_company_text_ty,
      "! <p class="shorttext synchronized">List of A_CustomerCompanyTextType</p>
      tyt_a_customer_company_text_ty TYPE STANDARD TABLE OF tys_a_customer_company_text_ty WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_CustomerCompanyType</p>
      BEGIN OF tys_a_customer_company_type,
        "! <em>Key property</em> Customer
        customer                   TYPE c LENGTH 10,
        "! <em>Key property</em> CompanyCode
        company_code               TYPE c LENGTH 4,
        "! APARToleranceGroup
        apartolerance_group        TYPE c LENGTH 4,
        "! AccountByCustomer
        account_by_customer        TYPE c LENGTH 12,
        "! AccountingClerk
        accounting_clerk           TYPE c LENGTH 2,
        "! AccountingClerkFaxNumber
        accounting_clerk_fax_numbe TYPE c LENGTH 31,
        "! AccountingClerkInternetAddress
        accounting_clerk_internet  TYPE c LENGTH 130,
        "! AccountingClerkPhoneNumber
        accounting_clerk_phone_num TYPE c LENGTH 30,
        "! AlternativePayerAccount
        alternative_payer_account  TYPE c LENGTH 10,
        "! AuthorizationGroup
        authorization_group        TYPE c LENGTH 4,
        "! CollectiveInvoiceVariant
        collective_invoice_variant TYPE c LENGTH 1,
        "! CustomerAccountNote
        customer_account_note      TYPE c LENGTH 30,
        "! CustomerHeadOffice
        customer_head_office       TYPE c LENGTH 10,
        "! CustomerSupplierClearingIsUsed
        customer_supplier_clearing TYPE abap_bool,
        "! HouseBank
        house_bank                 TYPE c LENGTH 5,
        "! InterestCalculationCode
        interest_calculation_code  TYPE c LENGTH 2,
        "! InterestCalculationDate
        interest_calculation_date  TYPE datn,
        "! IntrstCalcFrequencyInMonths
        intrst_calc_frequency_in_m TYPE c LENGTH 2,
        "! IsToBeLocallyProcessed
        is_to_be_locally_processed TYPE abap_bool,
        "! ItemIsToBePaidSeparately
        item_is_to_be_paid_separat TYPE abap_bool,
        "! LayoutSortingRule
        layout_sorting_rule        TYPE c LENGTH 3,
        "! PaymentBlockingReason
        payment_blocking_reason    TYPE c LENGTH 1,
        "! PaymentMethodsList
        payment_methods_list       TYPE c LENGTH 10,
        "! PaymentReason
        payment_reason             TYPE c LENGTH 4,
        "! PaymentTerms
        payment_terms              TYPE c LENGTH 4,
        "! PaytAdviceIsSentbyEDI
        payt_advice_is_sentby_edi  TYPE abap_bool,
        "! PhysicalInventoryBlockInd
        physical_inventory_block_i TYPE abap_bool,
        "! ReconciliationAccount
        reconciliation_account     TYPE c LENGTH 10,
        "! RecordPaymentHistoryIndicator
        record_payment_history_ind TYPE abap_bool,
        "! UserAtCustomer
        user_at_customer           TYPE c LENGTH 15,
        "! DeletionIndicator
        deletion_indicator         TYPE abap_bool,
        "! CashPlanningGroup
        cash_planning_group        TYPE c LENGTH 10,
        "! KnownOrNegotiatedLeave
        known_or_negotiated_leave  TYPE c LENGTH 4,
        "! ValueAdjustmentKey
        value_adjustment_key       TYPE c LENGTH 2,
        "! CustomerAccountGroup
        customer_account_group     TYPE c LENGTH 4,
      END OF tys_a_customer_company_type,
      "! <p class="shorttext synchronized">List of A_CustomerCompanyType</p>
      tyt_a_customer_company_type TYPE STANDARD TABLE OF tys_a_customer_company_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_CustomerDunningType</p>
      BEGIN OF tys_a_customer_dunning_type,
        "! <em>Key property</em> Customer
        customer                 TYPE c LENGTH 10,
        "! <em>Key property</em> CompanyCode
        company_code             TYPE c LENGTH 4,
        "! <em>Key property</em> DunningArea
        dunning_area             TYPE c LENGTH 2,
        "! DunningBlock
        dunning_block            TYPE c LENGTH 1,
        "! DunningLevel
        dunning_level            TYPE c LENGTH 1,
        "! DunningProcedure
        dunning_procedure        TYPE c LENGTH 4,
        "! DunningRecipient
        dunning_recipient        TYPE c LENGTH 10,
        "! LastDunnedOn
        last_dunned_on           TYPE datn,
        "! LegDunningProcedureOn
        leg_dunning_procedure_on TYPE datn,
        "! DunningClerk
        dunning_clerk            TYPE c LENGTH 2,
        "! AuthorizationGroup
        authorization_group      TYPE c LENGTH 4,
        "! CustomerAccountGroup
        customer_account_group   TYPE c LENGTH 4,
      END OF tys_a_customer_dunning_type,
      "! <p class="shorttext synchronized">List of A_CustomerDunningType</p>
      tyt_a_customer_dunning_type TYPE STANDARD TABLE OF tys_a_customer_dunning_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_CustomerSalesAreaTaxType</p>
      BEGIN OF tys_a_customer_sales_area_ta_2,
        "! <em>Key property</em> Customer
        customer                   TYPE c LENGTH 10,
        "! <em>Key property</em> SalesOrganization
        sales_organization         TYPE c LENGTH 4,
        "! <em>Key property</em> DistributionChannel
        distribution_channel       TYPE c LENGTH 2,
        "! <em>Key property</em> Division
        division                   TYPE c LENGTH 2,
        "! <em>Key property</em> DepartureCountry
        departure_country          TYPE c LENGTH 3,
        "! <em>Key property</em> CustomerTaxCategory
        customer_tax_category      TYPE c LENGTH 4,
        "! CustomerTaxClassification
        customer_tax_classificatio TYPE c LENGTH 1,
      END OF tys_a_customer_sales_area_ta_2,
      "! <p class="shorttext synchronized">List of A_CustomerSalesAreaTaxType</p>
      tyt_a_customer_sales_area_ta_2 TYPE STANDARD TABLE OF tys_a_customer_sales_area_ta_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_CustomerSalesAreaTextType</p>
      BEGIN OF tys_a_customer_sales_area_te_2,
        "! <em>Key property</em> Customer
        customer             TYPE c LENGTH 10,
        "! <em>Key property</em> SalesOrganization
        sales_organization   TYPE c LENGTH 4,
        "! <em>Key property</em> DistributionChannel
        distribution_channel TYPE c LENGTH 2,
        "! <em>Key property</em> Division
        division             TYPE c LENGTH 2,
        "! <em>Key property</em> Language
        language             TYPE c LENGTH 2,
        "! <em>Key property</em> LongTextID
        long_text_id         TYPE c LENGTH 4,
        "! LongText
        long_text            TYPE string,
      END OF tys_a_customer_sales_area_te_2,
      "! <p class="shorttext synchronized">List of A_CustomerSalesAreaTextType</p>
      tyt_a_customer_sales_area_te_2 TYPE STANDARD TABLE OF tys_a_customer_sales_area_te_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_CustomerSalesAreaType</p>
      BEGIN OF tys_a_customer_sales_area_type,
        "! <em>Key property</em> Customer
        customer                   TYPE c LENGTH 10,
        "! <em>Key property</em> SalesOrganization
        sales_organization         TYPE c LENGTH 4,
        "! <em>Key property</em> DistributionChannel
        distribution_channel       TYPE c LENGTH 2,
        "! <em>Key property</em> Division
        division                   TYPE c LENGTH 2,
        "! AccountByCustomer
        account_by_customer        TYPE c LENGTH 12,
        "! AuthorizationGroup
        authorization_group        TYPE c LENGTH 4,
        "! BillingIsBlockedForCustomer
        billing_is_blocked_for_cus TYPE c LENGTH 2,
        "! CompleteDeliveryIsDefined
        complete_delivery_is_defin TYPE abap_bool,
        "! CreditControlArea
        credit_control_area        TYPE c LENGTH 4,
        "! Currency
        currency                   TYPE c LENGTH 5,
        "! CustIsRlvtForSettlmtMgmt
        cust_is_rlvt_for_settlmt_m TYPE abap_bool,
        "! CustomerABCClassification
        customer_abcclassification TYPE c LENGTH 2,
        "! CustomerAccountAssignmentGroup
        customer_account_assignmen TYPE c LENGTH 2,
        "! CustomerGroup
        customer_group             TYPE c LENGTH 2,
        "! CustomerIsRebateRelevant
        customer_is_rebate_relevan TYPE abap_bool,
        "! CustomerPaymentTerms
        customer_payment_terms     TYPE c LENGTH 4,
        "! CustomerPriceGroup
        customer_price_group       TYPE c LENGTH 2,
        "! CustomerPricingProcedure
        customer_pricing_procedure TYPE c LENGTH 2,
        "! CustProdProposalProcedure
        cust_prod_proposal_procedu TYPE c LENGTH 2,
        "! DeliveryIsBlockedForCustomer
        delivery_is_blocked_for_cu TYPE c LENGTH 2,
        "! DeliveryPriority
        delivery_priority          TYPE c LENGTH 2,
        "! IncotermsClassification
        incoterms_classification   TYPE c LENGTH 3,
        "! IncotermsLocation2
        incoterms_location_2       TYPE c LENGTH 70,
        "! IncotermsVersion
        incoterms_version          TYPE c LENGTH 4,
        "! IncotermsLocation1
        incoterms_location_1       TYPE c LENGTH 70,
        "! IncotermsSupChnLoc1AddlUUID
        incoterms_sup_chn_loc_1_ad TYPE sysuuid_x16,
        "! IncotermsSupChnLoc2AddlUUID
        incoterms_sup_chn_loc_2_ad TYPE sysuuid_x16,
        "! IncotermsSupChnDvtgLocAddlUUID
        incoterms_sup_chn_dvtg_loc TYPE sysuuid_x16,
        "! DeletionIndicator
        deletion_indicator         TYPE abap_bool,
        "! IncotermsTransferLocation
        incoterms_transfer_locatio TYPE c LENGTH 28,
        "! InspSbstHasNoTimeOrQuantity
        insp_sbst_has_no_time_or_q TYPE abap_bool,
        "! InvoiceDate
        invoice_date               TYPE c LENGTH 2,
        "! ItemOrderProbabilityInPercent
        item_order_probability_in  TYPE c LENGTH 3,
        "! ManualInvoiceMaintIsRelevant
        manual_invoice_maint_is_re TYPE abap_bool,
        "! MaxNmbrOfPartialDelivery
        max_nmbr_of_partial_delive TYPE p LENGTH 1 DECIMALS 0,
        "! OrderCombinationIsAllowed
        order_combination_is_allow TYPE abap_bool,
        "! OrderIsBlockedForCustomer
        order_is_blocked_for_custo TYPE c LENGTH 2,
        "! OverdelivTolrtdLmtRatioInPct
        overdeliv_tolrtd_lmt_ratio TYPE p LENGTH 2 DECIMALS 1,
        "! PartialDeliveryIsAllowed
        partial_delivery_is_allowe TYPE c LENGTH 1,
        "! PriceListType
        price_list_type            TYPE c LENGTH 2,
        "! ProductUnitGroup
        product_unit_group         TYPE c LENGTH 4,
        "! ProofOfDeliveryTimeValue
        proof_of_delivery_time_val TYPE p LENGTH 4 DECIMALS 2,
        "! SalesGroup
        sales_group                TYPE c LENGTH 3,
        "! SalesItemProposal
        sales_item_proposal        TYPE c LENGTH 10,
        "! SalesOffice
        sales_office               TYPE c LENGTH 4,
        "! ShippingCondition
        shipping_condition         TYPE c LENGTH 2,
        "! SlsDocIsRlvtForProofOfDeliv
        sls_doc_is_rlvt_for_proof  TYPE abap_bool,
        "! SlsUnlmtdOvrdelivIsAllwd
        sls_unlmtd_ovrdeliv_is_all TYPE abap_bool,
        "! SupplyingPlant
        supplying_plant            TYPE c LENGTH 4,
        "! SalesDistrict
        sales_district             TYPE c LENGTH 6,
        "! UnderdelivTolrtdLmtRatioInPct
        underdeliv_tolrtd_lmt_rati TYPE p LENGTH 2 DECIMALS 1,
        "! InvoiceListSchedule
        invoice_list_schedule      TYPE c LENGTH 2,
        "! ExchangeRateType
        exchange_rate_type         TYPE c LENGTH 4,
        "! AdditionalCustomerGroup1
        additional_customer_group  TYPE c LENGTH 3,
        "! AdditionalCustomerGroup2
        additional_customer_grou_2 TYPE c LENGTH 3,
        "! AdditionalCustomerGroup3
        additional_customer_grou_3 TYPE c LENGTH 3,
        "! AdditionalCustomerGroup4
        additional_customer_grou_4 TYPE c LENGTH 3,
        "! AdditionalCustomerGroup5
        additional_customer_grou_5 TYPE c LENGTH 3,
        "! PaymentGuaranteeProcedure
        payment_guarantee_procedur TYPE c LENGTH 4,
        "! CustomerAccountGroup
        customer_account_group     TYPE c LENGTH 4,
      END OF tys_a_customer_sales_area_type,
      "! <p class="shorttext synchronized">List of A_CustomerSalesAreaType</p>
      tyt_a_customer_sales_area_type TYPE STANDARD TABLE OF tys_a_customer_sales_area_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_CustomerTaxGroupingType</p>
      BEGIN OF tys_a_customer_tax_grouping_ty,
        "! <em>Key property</em> Customer
        customer                   TYPE c LENGTH 10,
        "! <em>Key property</em> CustomerTaxGroupingCode
        customer_tax_grouping_code TYPE c LENGTH 3,
        "! CustTaxGrpExemptionCertificate
        cust_tax_grp_exemption_cer TYPE c LENGTH 15,
        "! CustTaxGroupExemptionRate
        cust_tax_group_exemption_r TYPE p LENGTH 3 DECIMALS 2,
        "! CustTaxGroupExemptionStartDate
        cust_tax_group_exemption_s TYPE datn,
        "! CustTaxGroupExemptionEndDate
        cust_tax_group_exemption_e TYPE datn,
        "! CustTaxGroupSubjectedStartDate
        cust_tax_group_subjected_s TYPE datn,
        "! CustTaxGroupSubjectedEndDate
        cust_tax_group_subjected_e TYPE datn,
      END OF tys_a_customer_tax_grouping_ty,
      "! <p class="shorttext synchronized">List of A_CustomerTaxGroupingType</p>
      tyt_a_customer_tax_grouping_ty TYPE STANDARD TABLE OF tys_a_customer_tax_grouping_ty WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_CustomerTextType</p>
      BEGIN OF tys_a_customer_text_type,
        "! <em>Key property</em> Customer
        customer     TYPE c LENGTH 10,
        "! <em>Key property</em> Language
        language     TYPE c LENGTH 2,
        "! <em>Key property</em> LongTextID
        long_text_id TYPE c LENGTH 4,
        "! LongText
        long_text    TYPE string,
      END OF tys_a_customer_text_type,
      "! <p class="shorttext synchronized">List of A_CustomerTextType</p>
      tyt_a_customer_text_type TYPE STANDARD TABLE OF tys_a_customer_text_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_CustomerType</p>
      BEGIN OF tys_a_customer_type,
        "! <em>Key property</em> Customer
        customer                   TYPE c LENGTH 10,
        "! AuthorizationGroup
        authorization_group        TYPE c LENGTH 4,
        "! BillingIsBlockedForCustomer
        billing_is_blocked_for_cus TYPE c LENGTH 2,
        "! CreatedByUser
        created_by_user            TYPE c LENGTH 12,
        "! CreationDate
        creation_date              TYPE datn,
        "! CustomerAccountGroup
        customer_account_group     TYPE c LENGTH 4,
        "! CustomerClassification
        customer_classification    TYPE c LENGTH 2,
        "! CustomerFullName
        customer_full_name         TYPE c LENGTH 220,
        "! BPCustomerFullName
        bpcustomer_full_name       TYPE c LENGTH 220,
        "! CustomerName
        customer_name              TYPE c LENGTH 80,
        "! BPCustomerName
        bpcustomer_name            TYPE c LENGTH 81,
        "! DeliveryIsBlocked
        delivery_is_blocked        TYPE c LENGTH 2,
        "! FreeDefinedAttribute01
        free_defined_attribute_01  TYPE c LENGTH 2,
        "! FreeDefinedAttribute02
        free_defined_attribute_02  TYPE c LENGTH 2,
        "! FreeDefinedAttribute03
        free_defined_attribute_03  TYPE c LENGTH 2,
        "! FreeDefinedAttribute04
        free_defined_attribute_04  TYPE c LENGTH 2,
        "! FreeDefinedAttribute05
        free_defined_attribute_05  TYPE c LENGTH 2,
        "! FreeDefinedAttribute06
        free_defined_attribute_06  TYPE c LENGTH 3,
        "! FreeDefinedAttribute07
        free_defined_attribute_07  TYPE c LENGTH 3,
        "! FreeDefinedAttribute08
        free_defined_attribute_08  TYPE c LENGTH 3,
        "! FreeDefinedAttribute09
        free_defined_attribute_09  TYPE c LENGTH 3,
        "! FreeDefinedAttribute10
        free_defined_attribute_10  TYPE c LENGTH 3,
        "! NFPartnerIsNaturalPerson
        nfpartner_is_natural_perso TYPE c LENGTH 1,
        "! OrderIsBlockedForCustomer
        order_is_blocked_for_custo TYPE c LENGTH 2,
        "! PostingIsBlocked
        posting_is_blocked         TYPE abap_bool,
        "! Supplier
        supplier                   TYPE c LENGTH 10,
        "! CustomerCorporateGroup
        customer_corporate_group   TYPE c LENGTH 10,
        "! FiscalAddress
        fiscal_address             TYPE c LENGTH 10,
        "! Industry
        industry                   TYPE c LENGTH 4,
        "! IndustryCode1
        industry_code_1            TYPE c LENGTH 10,
        "! IndustryCode2
        industry_code_2            TYPE c LENGTH 10,
        "! IndustryCode3
        industry_code_3            TYPE c LENGTH 10,
        "! IndustryCode4
        industry_code_4            TYPE c LENGTH 10,
        "! IndustryCode5
        industry_code_5            TYPE c LENGTH 10,
        "! InternationalLocationNumber1
        international_location_num TYPE c LENGTH 7,
        "! InternationalLocationNumber2
        international_location_n_2 TYPE c LENGTH 5,
        "! InternationalLocationNumber3
        international_location_n_3 TYPE c LENGTH 1,
        "! NielsenRegion
        nielsen_region             TYPE c LENGTH 2,
        "! PaymentReason
        payment_reason             TYPE c LENGTH 4,
        "! ResponsibleType
        responsible_type           TYPE c LENGTH 2,
        "! TaxNumber1
        tax_number_1               TYPE c LENGTH 16,
        "! TaxNumber2
        tax_number_2               TYPE c LENGTH 11,
        "! TaxNumber3
        tax_number_3               TYPE c LENGTH 18,
        "! TaxNumber4
        tax_number_4               TYPE c LENGTH 18,
        "! TaxNumber5
        tax_number_5               TYPE c LENGTH 60,
        "! TaxNumberType
        tax_number_type            TYPE c LENGTH 2,
        "! VATRegistration
        vatregistration            TYPE c LENGTH 20,
        "! DeletionIndicator
        deletion_indicator         TYPE abap_bool,
        "! ExpressTrainStationName
        express_train_station_name TYPE c LENGTH 25,
        "! TrainStationName
        train_station_name         TYPE c LENGTH 25,
        "! CityCode
        city_code                  TYPE c LENGTH 4,
        "! County
        county                     TYPE c LENGTH 3,
      END OF tys_a_customer_type,
      "! <p class="shorttext synchronized">List of A_CustomerType</p>
      tyt_a_customer_type TYPE STANDARD TABLE OF tys_a_customer_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_CustomerUnloadingPointType</p>
      BEGIN OF tys_a_customer_unloading_poi_2,
        "! <em>Key property</em> Customer
        customer                   TYPE c LENGTH 10,
        "! <em>Key property</em> UnloadingPointName
        unloading_point_name       TYPE c LENGTH 25,
        "! CustomerFactoryCalenderCode
        customer_factory_calender  TYPE c LENGTH 2,
        "! BPGoodsReceivingHoursCode
        bpgoods_receiving_hours_co TYPE c LENGTH 3,
        "! IsDfltBPUnloadingPoint
        is_dflt_bpunloading_point  TYPE abap_bool,
        "! MondayMorningOpeningTime
        monday_morning_opening_tim TYPE timn,
        "! MondayMorningClosingTime
        monday_morning_closing_tim TYPE timn,
        "! MondayAfternoonOpeningTime
        monday_afternoon_opening_t TYPE timn,
        "! MondayAfternoonClosingTime
        monday_afternoon_closing_t TYPE timn,
        "! TuesdayMorningOpeningTime
        tuesday_morning_opening_ti TYPE timn,
        "! TuesdayMorningClosingTime
        tuesday_morning_closing_ti TYPE timn,
        "! TuesdayAfternoonOpeningTime
        tuesday_afternoon_opening  TYPE timn,
        "! TuesdayAfternoonClosingTime
        tuesday_afternoon_closing  TYPE timn,
        "! WednesdayMorningOpeningTime
        wednesday_morning_opening  TYPE timn,
        "! WednesdayMorningClosingTime
        wednesday_morning_closing  TYPE timn,
        "! WednesdayAfternoonOpeningTime
        wednesday_afternoon_openin TYPE timn,
        "! WednesdayAfternoonClosingTime
        wednesday_afternoon_closin TYPE timn,
        "! ThursdayMorningOpeningTime
        thursday_morning_opening_t TYPE timn,
        "! ThursdayMorningClosingTime
        thursday_morning_closing_t TYPE timn,
        "! ThursdayAfternoonOpeningTime
        thursday_afternoon_opening TYPE timn,
        "! ThursdayAfternoonClosingTime
        thursday_afternoon_closing TYPE timn,
        "! FridayMorningOpeningTime
        friday_morning_opening_tim TYPE timn,
        "! FridayMorningClosingTime
        friday_morning_closing_tim TYPE timn,
        "! FridayAfternoonOpeningTime
        friday_afternoon_opening_t TYPE timn,
        "! FridayAfternoonClosingTime
        friday_afternoon_closing_t TYPE timn,
        "! SaturdayMorningOpeningTime
        saturday_morning_opening_t TYPE timn,
        "! SaturdayMorningClosingTime
        saturday_morning_closing_t TYPE timn,
        "! SaturdayAfternoonOpeningTime
        saturday_afternoon_opening TYPE timn,
        "! SaturdayAfternoonClosingTime
        saturday_afternoon_closing TYPE timn,
        "! SundayMorningOpeningTime
        sunday_morning_opening_tim TYPE timn,
        "! SundayMorningClosingTime
        sunday_morning_closing_tim TYPE timn,
        "! SundayAfternoonOpeningTime
        sunday_afternoon_opening_t TYPE timn,
        "! SundayAfternoonClosingTime
        sunday_afternoon_closing_t TYPE timn,
      END OF tys_a_customer_unloading_poi_2,
      "! <p class="shorttext synchronized">List of A_CustomerUnloadingPointType</p>
      tyt_a_customer_unloading_poi_2 TYPE STANDARD TABLE OF tys_a_customer_unloading_poi_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_CustomerWithHoldingTaxType</p>
      BEGIN OF tys_a_customer_with_holding__2,
        "! <em>Key property</em> Customer
        customer                   TYPE c LENGTH 10,
        "! <em>Key property</em> CompanyCode
        company_code               TYPE c LENGTH 4,
        "! <em>Key property</em> WithholdingTaxType
        withholding_tax_type       TYPE c LENGTH 2,
        "! WithholdingTaxCode
        withholding_tax_code       TYPE c LENGTH 2,
        "! WithholdingTaxAgent
        withholding_tax_agent      TYPE abap_bool,
        "! ObligationDateBegin
        obligation_date_begin      TYPE datn,
        "! ObligationDateEnd
        obligation_date_end        TYPE datn,
        "! WithholdingTaxNumber
        withholding_tax_number     TYPE c LENGTH 16,
        "! WithholdingTaxCertificate
        withholding_tax_certificat TYPE c LENGTH 25,
        "! WithholdingTaxExmptPercent
        withholding_tax_exmpt_perc TYPE p LENGTH 3 DECIMALS 2,
        "! ExemptionDateBegin
        exemption_date_begin       TYPE datn,
        "! ExemptionDateEnd
        exemption_date_end         TYPE datn,
        "! ExemptionReason
        exemption_reason           TYPE c LENGTH 2,
        "! AuthorizationGroup
        authorization_group        TYPE c LENGTH 4,
      END OF tys_a_customer_with_holding__2,
      "! <p class="shorttext synchronized">List of A_CustomerWithHoldingTaxType</p>
      tyt_a_customer_with_holding__2 TYPE STANDARD TABLE OF tys_a_customer_with_holding__2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_CustAddrDepdntExtIdentifierType</p>
      BEGIN OF tys_a_cust_addr_depdnt_ext_i_2,
        "! <em>Key property</em> Customer
        customer                 TYPE c LENGTH 10,
        "! <em>Key property</em> AddressID
        address_id               TYPE c LENGTH 10,
        "! CustomerExternalRefID
        customer_external_ref_id TYPE c LENGTH 12,
      END OF tys_a_cust_addr_depdnt_ext_i_2,
      "! <p class="shorttext synchronized">List of A_CustAddrDepdntExtIdentifierType</p>
      tyt_a_cust_addr_depdnt_ext_i_2 TYPE STANDARD TABLE OF tys_a_cust_addr_depdnt_ext_i_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_CustAddrDepdntInformationType</p>
      BEGIN OF tys_a_cust_addr_depdnt_infor_2,
        "! <em>Key property</em> Customer
        customer                   TYPE c LENGTH 10,
        "! <em>Key property</em> AddressID
        address_id                 TYPE c LENGTH 10,
        "! ExpressTrainStationName
        express_train_station_name TYPE c LENGTH 25,
        "! TrainStationName
        train_station_name         TYPE c LENGTH 25,
        "! CityCode
        city_code                  TYPE c LENGTH 4,
        "! County
        county                     TYPE c LENGTH 3,
      END OF tys_a_cust_addr_depdnt_infor_2,
      "! <p class="shorttext synchronized">List of A_CustAddrDepdntInformationType</p>
      tyt_a_cust_addr_depdnt_infor_2 TYPE STANDARD TABLE OF tys_a_cust_addr_depdnt_infor_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_CustSalesPartnerFuncType</p>
      BEGIN OF tys_a_cust_sales_partner_fun_2,
        "! <em>Key property</em> Customer
        customer                   TYPE c LENGTH 10,
        "! <em>Key property</em> SalesOrganization
        sales_organization         TYPE c LENGTH 4,
        "! <em>Key property</em> DistributionChannel
        distribution_channel       TYPE c LENGTH 2,
        "! <em>Key property</em> Division
        division                   TYPE c LENGTH 2,
        "! <em>Key property</em> PartnerCounter
        partner_counter            TYPE c LENGTH 3,
        "! <em>Key property</em> PartnerFunction
        partner_function           TYPE c LENGTH 2,
        "! BPCustomerNumber
        bpcustomer_number          TYPE c LENGTH 10,
        "! CustomerPartnerDescription
        customer_partner_descripti TYPE c LENGTH 30,
        "! DefaultPartner
        default_partner            TYPE abap_bool,
        "! Supplier
        supplier                   TYPE c LENGTH 10,
        "! PersonnelNumber
        personnel_number           TYPE c LENGTH 8,
        "! ContactPerson
        contact_person             TYPE c LENGTH 10,
        "! AddressID
        address_id                 TYPE c LENGTH 10,
        "! AuthorizationGroup
        authorization_group        TYPE c LENGTH 4,
      END OF tys_a_cust_sales_partner_fun_2,
      "! <p class="shorttext synchronized">List of A_CustSalesPartnerFuncType</p>
      tyt_a_cust_sales_partner_fun_2 TYPE STANDARD TABLE OF tys_a_cust_sales_partner_fun_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_CustSlsAreaAddrDepdntInfoType</p>
      BEGIN OF tys_a_cust_sls_area_addr_dep_3,
        "! <em>Key property</em> Customer
        customer                   TYPE c LENGTH 10,
        "! <em>Key property</em> SalesOrganization
        sales_organization         TYPE c LENGTH 4,
        "! <em>Key property</em> DistributionChannel
        distribution_channel       TYPE c LENGTH 2,
        "! <em>Key property</em> Division
        division                   TYPE c LENGTH 2,
        "! <em>Key property</em> AddressID
        address_id                 TYPE c LENGTH 10,
        "! IncotermsClassification
        incoterms_classification   TYPE c LENGTH 3,
        "! IncotermsLocation1
        incoterms_location_1       TYPE c LENGTH 70,
        "! IncotermsLocation2
        incoterms_location_2       TYPE c LENGTH 70,
        "! IncotermsSupChnLoc1AddlUUID
        incoterms_sup_chn_loc_1_ad TYPE sysuuid_x16,
        "! IncotermsSupChnLoc2AddlUUID
        incoterms_sup_chn_loc_2_ad TYPE sysuuid_x16,
        "! IncotermsSupChnDvtgLocAddlUUID
        incoterms_sup_chn_dvtg_loc TYPE sysuuid_x16,
        "! DeliveryIsBlocked
        delivery_is_blocked        TYPE c LENGTH 2,
        "! SalesOffice
        sales_office               TYPE c LENGTH 4,
        "! SalesGroup
        sales_group                TYPE c LENGTH 3,
        "! ShippingCondition
        shipping_condition         TYPE c LENGTH 2,
        "! SupplyingPlant
        supplying_plant            TYPE c LENGTH 4,
        "! IncotermsVersion
        incoterms_version          TYPE c LENGTH 4,
      END OF tys_a_cust_sls_area_addr_dep_3,
      "! <p class="shorttext synchronized">List of A_CustSlsAreaAddrDepdntInfoType</p>
      tyt_a_cust_sls_area_addr_dep_3 TYPE STANDARD TABLE OF tys_a_cust_sls_area_addr_dep_3 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_CustSlsAreaAddrDepdntTaxInfoType</p>
      BEGIN OF tys_a_cust_sls_area_addr_dep_4,
        "! <em>Key property</em> Customer
        customer                   TYPE c LENGTH 10,
        "! <em>Key property</em> SalesOrganization
        sales_organization         TYPE c LENGTH 4,
        "! <em>Key property</em> DistributionChannel
        distribution_channel       TYPE c LENGTH 2,
        "! <em>Key property</em> Division
        division                   TYPE c LENGTH 2,
        "! <em>Key property</em> AddressID
        address_id                 TYPE c LENGTH 10,
        "! <em>Key property</em> DepartureCountry
        departure_country          TYPE c LENGTH 3,
        "! <em>Key property</em> CustomerTaxCategory
        customer_tax_category      TYPE c LENGTH 4,
        "! CustomerTaxClassification
        customer_tax_classificatio TYPE c LENGTH 1,
      END OF tys_a_cust_sls_area_addr_dep_4,
      "! <p class="shorttext synchronized">List of A_CustSlsAreaAddrDepdntTaxInfoType</p>
      tyt_a_cust_sls_area_addr_dep_4 TYPE STANDARD TABLE OF tys_a_cust_sls_area_addr_dep_4 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_CustUnldgPtAddrDepdntInfoType</p>
      BEGIN OF tys_a_cust_unldg_pt_addr_dep_2,
        "! <em>Key property</em> Customer
        customer                   TYPE c LENGTH 10,
        "! <em>Key property</em> AddressID
        address_id                 TYPE c LENGTH 10,
        "! <em>Key property</em> UnloadingPointName
        unloading_point_name       TYPE c LENGTH 25,
        "! CustomerFactoryCalenderCode
        customer_factory_calender  TYPE c LENGTH 2,
        "! BPGoodsReceivingHoursCode
        bpgoods_receiving_hours_co TYPE c LENGTH 3,
        "! IsDfltBPUnloadingPoint
        is_dflt_bpunloading_point  TYPE abap_bool,
        "! MondayMorningOpeningTime
        monday_morning_opening_tim TYPE timn,
        "! MondayMorningClosingTime
        monday_morning_closing_tim TYPE timn,
        "! MondayAfternoonOpeningTime
        monday_afternoon_opening_t TYPE timn,
        "! MondayAfternoonClosingTime
        monday_afternoon_closing_t TYPE timn,
        "! TuesdayMorningOpeningTime
        tuesday_morning_opening_ti TYPE timn,
        "! TuesdayMorningClosingTime
        tuesday_morning_closing_ti TYPE timn,
        "! TuesdayAfternoonOpeningTime
        tuesday_afternoon_opening  TYPE timn,
        "! TuesdayAfternoonClosingTime
        tuesday_afternoon_closing  TYPE timn,
        "! WednesdayMorningOpeningTime
        wednesday_morning_opening  TYPE timn,
        "! WednesdayMorningClosingTime
        wednesday_morning_closing  TYPE timn,
        "! WednesdayAfternoonOpeningTime
        wednesday_afternoon_openin TYPE timn,
        "! WednesdayAfternoonClosingTime
        wednesday_afternoon_closin TYPE timn,
        "! ThursdayMorningOpeningTime
        thursday_morning_opening_t TYPE timn,
        "! ThursdayMorningClosingTime
        thursday_morning_closing_t TYPE timn,
        "! ThursdayAfternoonOpeningTime
        thursday_afternoon_opening TYPE timn,
        "! ThursdayAfternoonClosingTime
        thursday_afternoon_closing TYPE timn,
        "! FridayMorningOpeningTime
        friday_morning_opening_tim TYPE timn,
        "! FridayMorningClosingTime
        friday_morning_closing_tim TYPE timn,
        "! FridayAfternoonOpeningTime
        friday_afternoon_opening_t TYPE timn,
        "! FridayAfternoonClosingTime
        friday_afternoon_closing_t TYPE timn,
        "! SaturdayMorningOpeningTime
        saturday_morning_opening_t TYPE timn,
        "! SaturdayMorningClosingTime
        saturday_morning_closing_t TYPE timn,
        "! SaturdayAfternoonOpeningTime
        saturday_afternoon_opening TYPE timn,
        "! SaturdayAfternoonClosingTime
        saturday_afternoon_closing TYPE timn,
        "! SundayMorningOpeningTime
        sunday_morning_opening_tim TYPE timn,
        "! SundayMorningClosingTime
        sunday_morning_closing_tim TYPE timn,
        "! SundayAfternoonOpeningTime
        sunday_afternoon_opening_t TYPE timn,
        "! SundayAfternoonClosingTime
        sunday_afternoon_closing_t TYPE timn,
      END OF tys_a_cust_unldg_pt_addr_dep_2,
      "! <p class="shorttext synchronized">List of A_CustUnldgPtAddrDepdntInfoType</p>
      tyt_a_cust_unldg_pt_addr_dep_2 TYPE STANDARD TABLE OF tys_a_cust_unldg_pt_addr_dep_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_SupplierCompanyTextType</p>
      BEGIN OF tys_a_supplier_company_text_ty,
        "! <em>Key property</em> Supplier
        supplier     TYPE c LENGTH 10,
        "! <em>Key property</em> CompanyCode
        company_code TYPE c LENGTH 4,
        "! <em>Key property</em> Language
        language     TYPE c LENGTH 2,
        "! <em>Key property</em> LongTextID
        long_text_id TYPE c LENGTH 4,
        "! LongText
        long_text    TYPE string,
      END OF tys_a_supplier_company_text_ty,
      "! <p class="shorttext synchronized">List of A_SupplierCompanyTextType</p>
      tyt_a_supplier_company_text_ty TYPE STANDARD TABLE OF tys_a_supplier_company_text_ty WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_SupplierCompanyType</p>
      BEGIN OF tys_a_supplier_company_type,
        "! <em>Key property</em> Supplier
        supplier                   TYPE c LENGTH 10,
        "! <em>Key property</em> CompanyCode
        company_code               TYPE c LENGTH 4,
        "! AuthorizationGroup
        authorization_group        TYPE c LENGTH 4,
        "! CompanyCodeName
        company_code_name          TYPE c LENGTH 25,
        "! PaymentBlockingReason
        payment_blocking_reason    TYPE c LENGTH 1,
        "! SupplierIsBlockedForPosting
        supplier_is_blocked_for_po TYPE abap_bool,
        "! AccountingClerk
        accounting_clerk           TYPE c LENGTH 2,
        "! AccountingClerkFaxNumber
        accounting_clerk_fax_numbe TYPE c LENGTH 31,
        "! AccountingClerkPhoneNumber
        accounting_clerk_phone_num TYPE c LENGTH 30,
        "! SupplierClerk
        supplier_clerk             TYPE c LENGTH 15,
        "! SupplierClerkURL
        supplier_clerk_url         TYPE c LENGTH 130,
        "! PaymentMethodsList
        payment_methods_list       TYPE c LENGTH 10,
        "! PaymentReason
        payment_reason             TYPE c LENGTH 4,
        "! PaymentTerms
        payment_terms              TYPE c LENGTH 4,
        "! ClearCustomerSupplier
        clear_customer_supplier    TYPE abap_bool,
        "! IsToBeLocallyProcessed
        is_to_be_locally_processed TYPE abap_bool,
        "! ItemIsToBePaidSeparately
        item_is_to_be_paid_separat TYPE abap_bool,
        "! PaymentIsToBeSentByEDI
        payment_is_to_be_sent_by_e TYPE abap_bool,
        "! HouseBank
        house_bank                 TYPE c LENGTH 5,
        "! CheckPaidDurationInDays
        check_paid_duration_in_day TYPE p LENGTH 2 DECIMALS 0,
        "! Currency
        currency                   TYPE c LENGTH 5,
        "! BillOfExchLmtAmtInCoCodeCrcy
        bill_of_exch_lmt_amt_in_co TYPE p LENGTH 8 DECIMALS 3,
        "! SupplierClerkIDBySupplier
        supplier_clerk_idby_suppli TYPE c LENGTH 12,
        "! ReconciliationAccount
        reconciliation_account     TYPE c LENGTH 10,
        "! InterestCalculationCode
        interest_calculation_code  TYPE c LENGTH 2,
        "! InterestCalculationDate
        interest_calculation_date  TYPE datn,
        "! IntrstCalcFrequencyInMonths
        intrst_calc_frequency_in_m TYPE c LENGTH 2,
        "! SupplierHeadOffice
        supplier_head_office       TYPE c LENGTH 10,
        "! AlternativePayee
        alternative_payee          TYPE c LENGTH 10,
        "! LayoutSortingRule
        layout_sorting_rule        TYPE c LENGTH 3,
        "! APARToleranceGroup
        apartolerance_group        TYPE c LENGTH 4,
        "! SupplierCertificationDate
        supplier_certification_dat TYPE datn,
        "! SupplierAccountNote
        supplier_account_note      TYPE c LENGTH 30,
        "! WithholdingTaxCountry
        withholding_tax_country    TYPE c LENGTH 3,
        "! DeletionIndicator
        deletion_indicator         TYPE abap_bool,
        "! CashPlanningGroup
        cash_planning_group        TYPE c LENGTH 10,
        "! IsToBeCheckedForDuplicates
        is_to_be_checked_for_dupli TYPE abap_bool,
        "! MinorityGroup
        minority_group             TYPE c LENGTH 3,
        "! SupplierAccountGroup
        supplier_account_group     TYPE c LENGTH 4,
      END OF tys_a_supplier_company_type,
      "! <p class="shorttext synchronized">List of A_SupplierCompanyType</p>
      tyt_a_supplier_company_type TYPE STANDARD TABLE OF tys_a_supplier_company_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_SupplierDunningType</p>
      BEGIN OF tys_a_supplier_dunning_type,
        "! <em>Key property</em> Supplier
        supplier                 TYPE c LENGTH 10,
        "! <em>Key property</em> CompanyCode
        company_code             TYPE c LENGTH 4,
        "! <em>Key property</em> DunningArea
        dunning_area             TYPE c LENGTH 2,
        "! DunningBlock
        dunning_block            TYPE c LENGTH 1,
        "! DunningLevel
        dunning_level            TYPE c LENGTH 1,
        "! DunningProcedure
        dunning_procedure        TYPE c LENGTH 4,
        "! DunningRecipient
        dunning_recipient        TYPE c LENGTH 10,
        "! LastDunnedOn
        last_dunned_on           TYPE datn,
        "! LegDunningProcedureOn
        leg_dunning_procedure_on TYPE datn,
        "! DunningClerk
        dunning_clerk            TYPE c LENGTH 2,
        "! AuthorizationGroup
        authorization_group      TYPE c LENGTH 4,
        "! SupplierAccountGroup
        supplier_account_group   TYPE c LENGTH 4,
      END OF tys_a_supplier_dunning_type,
      "! <p class="shorttext synchronized">List of A_SupplierDunningType</p>
      tyt_a_supplier_dunning_type TYPE STANDARD TABLE OF tys_a_supplier_dunning_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_SupplierPartnerFuncType</p>
      BEGIN OF tys_a_supplier_partner_func_ty,
        "! <em>Key property</em> Supplier
        supplier                TYPE c LENGTH 10,
        "! <em>Key property</em> PurchasingOrganization
        purchasing_organization TYPE c LENGTH 4,
        "! <em>Key property</em> SupplierSubrange
        supplier_subrange       TYPE c LENGTH 6,
        "! <em>Key property</em> Plant
        plant                   TYPE c LENGTH 4,
        "! <em>Key property</em> PartnerFunction
        partner_function        TYPE c LENGTH 2,
        "! <em>Key property</em> PartnerCounter
        partner_counter         TYPE c LENGTH 3,
        "! DefaultPartner
        default_partner         TYPE abap_bool,
        "! CreationDate
        creation_date           TYPE datn,
        "! CreatedByUser
        created_by_user         TYPE c LENGTH 12,
        "! ReferenceSupplier
        reference_supplier      TYPE c LENGTH 10,
        "! AuthorizationGroup
        authorization_group     TYPE c LENGTH 4,
      END OF tys_a_supplier_partner_func_ty,
      "! <p class="shorttext synchronized">List of A_SupplierPartnerFuncType</p>
      tyt_a_supplier_partner_func_ty TYPE STANDARD TABLE OF tys_a_supplier_partner_func_ty WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_SupplierPurchasingOrgType</p>
      BEGIN OF tys_a_supplier_purchasing_or_3,
        "! <em>Key property</em> Supplier
        supplier                   TYPE c LENGTH 10,
        "! <em>Key property</em> PurchasingOrganization
        purchasing_organization    TYPE c LENGTH 4,
        "! AutomaticEvaluatedRcptSettlmt
        automatic_evaluated_rcpt_s TYPE abap_bool,
        "! CalculationSchemaGroupCode
        calculation_schema_group_c TYPE c LENGTH 2,
        "! DeletionIndicator
        deletion_indicator         TYPE abap_bool,
        "! EvaldReceiptSettlementIsActive
        evald_receipt_settlement_i TYPE abap_bool,
        "! IncotermsClassification
        incoterms_classification   TYPE c LENGTH 3,
        "! IncotermsTransferLocation
        incoterms_transfer_locatio TYPE c LENGTH 28,
        "! IncotermsVersion
        incoterms_version          TYPE c LENGTH 4,
        "! IncotermsLocation1
        incoterms_location_1       TYPE c LENGTH 70,
        "! IncotermsLocation2
        incoterms_location_2       TYPE c LENGTH 70,
        "! IncotermsSupChnLoc1AddlUUID
        incoterms_sup_chn_loc_1_ad TYPE sysuuid_x16,
        "! IncotermsSupChnLoc2AddlUUID
        incoterms_sup_chn_loc_2_ad TYPE sysuuid_x16,
        "! IncotermsSupChnDvtgLocAddlUUID
        incoterms_sup_chn_dvtg_loc TYPE sysuuid_x16,
        "! IntrastatCrsBorderTrMode
        intrastat_crs_border_tr_mo TYPE c LENGTH 1,
        "! InvoiceIsGoodsReceiptBased
        invoice_is_goods_receipt_b TYPE abap_bool,
        "! InvoiceIsMMServiceEntryBased
        invoice_is_mmservice_entry TYPE abap_bool,
        "! MaterialPlannedDeliveryDurn
        material_planned_delivery  TYPE p LENGTH 2 DECIMALS 0,
        "! MinimumOrderAmount
        minimum_order_amount       TYPE p LENGTH 8 DECIMALS 3,
        "! PaymentTerms
        payment_terms              TYPE c LENGTH 4,
        "! PlanningCycle
        planning_cycle             TYPE c LENGTH 3,
        "! PricingDateControl
        pricing_date_control       TYPE c LENGTH 1,
        "! ProdStockAndSlsDataTransfPrfl
        prod_stock_and_sls_data_tr TYPE c LENGTH 4,
        "! ProductUnitGroup
        product_unit_group         TYPE c LENGTH 4,
        "! PurOrdAutoGenerationIsAllowed
        pur_ord_auto_generation_is TYPE abap_bool,
        "! PurchaseOrderCurrency
        purchase_order_currency    TYPE c LENGTH 5,
        "! PurchasingGroup
        purchasing_group           TYPE c LENGTH 3,
        "! PurchasingIsBlockedForSupplier
        purchasing_is_blocked_for  TYPE abap_bool,
        "! RoundingProfile
        rounding_profile           TYPE c LENGTH 4,
        "! ShippingCondition
        shipping_condition         TYPE c LENGTH 2,
        "! SuplrDiscountInKindIsGranted
        suplr_discount_in_kind_is  TYPE abap_bool,
        "! SuplrInvcRevalIsAllowed
        suplr_invc_reval_is_allowe TYPE abap_bool,
        "! SuplrIsRlvtForSettlmtMgmt
        suplr_is_rlvt_for_settlmt  TYPE abap_bool,
        "! SuplrPurgOrgIsRlvtForPriceDetn
        suplr_purg_org_is_rlvt_for TYPE abap_bool,
        "! SupplierABCClassificationCode
        supplier_abcclassification TYPE c LENGTH 1,
        "! SupplierAccountNumber
        supplier_account_number    TYPE c LENGTH 12,
        "! SupplierIsReturnsSupplier
        supplier_is_returns_suppli TYPE abap_bool,
        "! SupplierPhoneNumber
        supplier_phone_number      TYPE c LENGTH 16,
        "! SupplierRespSalesPersonName
        supplier_resp_sales_person TYPE c LENGTH 30,
        "! SupplierConfirmationControlKey
        supplier_confirmation_cont TYPE c LENGTH 4,
        "! IsOrderAcknRqd
        is_order_ackn_rqd          TYPE abap_bool,
        "! AuthorizationGroup
        authorization_group        TYPE c LENGTH 4,
        "! SupplierAccountGroup
        supplier_account_group     TYPE c LENGTH 4,
      END OF tys_a_supplier_purchasing_or_3,
      "! <p class="shorttext synchronized">List of A_SupplierPurchasingOrgType</p>
      tyt_a_supplier_purchasing_or_3 TYPE STANDARD TABLE OF tys_a_supplier_purchasing_or_3 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_SupplierPurchasingOrgTextType</p>
      BEGIN OF tys_a_supplier_purchasing_or_4,
        "! <em>Key property</em> Supplier
        supplier                TYPE c LENGTH 10,
        "! <em>Key property</em> PurchasingOrganization
        purchasing_organization TYPE c LENGTH 4,
        "! <em>Key property</em> Language
        language                TYPE c LENGTH 2,
        "! <em>Key property</em> LongTextID
        long_text_id            TYPE c LENGTH 4,
        "! LongText
        long_text               TYPE string,
      END OF tys_a_supplier_purchasing_or_4,
      "! <p class="shorttext synchronized">List of A_SupplierPurchasingOrgTextType</p>
      tyt_a_supplier_purchasing_or_4 TYPE STANDARD TABLE OF tys_a_supplier_purchasing_or_4 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_SupplierTextType</p>
      BEGIN OF tys_a_supplier_text_type,
        "! <em>Key property</em> Supplier
        supplier     TYPE c LENGTH 10,
        "! <em>Key property</em> Language
        language     TYPE c LENGTH 2,
        "! <em>Key property</em> LongTextID
        long_text_id TYPE c LENGTH 4,
        "! LongText
        long_text    TYPE string,
      END OF tys_a_supplier_text_type,
      "! <p class="shorttext synchronized">List of A_SupplierTextType</p>
      tyt_a_supplier_text_type TYPE STANDARD TABLE OF tys_a_supplier_text_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_SupplierType</p>
      BEGIN OF tys_a_supplier_type,
        "! <em>Key property</em> Supplier
        supplier                   TYPE c LENGTH 10,
        "! AlternativePayeeAccountNumber
        alternative_payee_account  TYPE c LENGTH 10,
        "! AuthorizationGroup
        authorization_group        TYPE c LENGTH 4,
        "! BusinessPartnerPanNumber
        business_partner_pan_numbe TYPE c LENGTH 40,
        "! CreatedByUser
        created_by_user            TYPE c LENGTH 12,
        "! CreationDate
        creation_date              TYPE datn,
        "! Customer
        customer                   TYPE c LENGTH 10,
        "! PaymentIsBlockedForSupplier
        payment_is_blocked_for_sup TYPE abap_bool,
        "! PostingIsBlocked
        posting_is_blocked         TYPE abap_bool,
        "! PurchasingIsBlocked
        purchasing_is_blocked      TYPE abap_bool,
        "! SupplierAccountGroup
        supplier_account_group     TYPE c LENGTH 4,
        "! SupplierFullName
        supplier_full_name         TYPE c LENGTH 220,
        "! SupplierName
        supplier_name              TYPE c LENGTH 80,
        "! VATRegistration
        vatregistration            TYPE c LENGTH 20,
        "! BirthDate
        birth_date                 TYPE datn,
        "! ConcatenatedInternationalLocNo
        concatenated_international TYPE c LENGTH 20,
        "! DeletionIndicator
        deletion_indicator         TYPE abap_bool,
        "! FiscalAddress
        fiscal_address             TYPE c LENGTH 10,
        "! Industry
        industry                   TYPE c LENGTH 4,
        "! InternationalLocationNumber1
        international_location_num TYPE c LENGTH 7,
        "! InternationalLocationNumber2
        international_location_n_2 TYPE c LENGTH 5,
        "! InternationalLocationNumber3
        international_location_n_3 TYPE c LENGTH 1,
        "! IsNaturalPerson
        is_natural_person          TYPE c LENGTH 1,
        "! PaymentReason
        payment_reason             TYPE c LENGTH 4,
        "! ResponsibleType
        responsible_type           TYPE c LENGTH 2,
        "! SuplrQltyInProcmtCertfnValidTo
        suplr_qlty_in_procmt_certf TYPE datn,
        "! SuplrQualityManagementSystem
        suplr_quality_management_s TYPE c LENGTH 4,
        "! SupplierCorporateGroup
        supplier_corporate_group   TYPE c LENGTH 10,
        "! SupplierProcurementBlock
        supplier_procurement_block TYPE c LENGTH 2,
        "! TaxNumber1
        tax_number_1               TYPE c LENGTH 16,
        "! TaxNumber2
        tax_number_2               TYPE c LENGTH 11,
        "! TaxNumber3
        tax_number_3               TYPE c LENGTH 18,
        "! TaxNumber4
        tax_number_4               TYPE c LENGTH 18,
        "! TaxNumber5
        tax_number_5               TYPE c LENGTH 60,
        "! TaxNumberResponsible
        tax_number_responsible     TYPE c LENGTH 18,
        "! TaxNumberType
        tax_number_type            TYPE c LENGTH 2,
        "! SuplrProofOfDelivRlvtCode
        suplr_proof_of_deliv_rlvt  TYPE c LENGTH 1,
        "! BR_TaxIsSplit
        br_tax_is_split            TYPE abap_bool,
        "! DataExchangeInstructionKey
        data_exchange_instruction  TYPE c LENGTH 2,
      END OF tys_a_supplier_type,
      "! <p class="shorttext synchronized">List of A_SupplierType</p>
      tyt_a_supplier_type TYPE STANDARD TABLE OF tys_a_supplier_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_SupplierWithHoldingTaxType</p>
      BEGIN OF tys_a_supplier_with_holding__2,
        "! <em>Key property</em> Supplier
        supplier                   TYPE c LENGTH 10,
        "! <em>Key property</em> CompanyCode
        company_code               TYPE c LENGTH 4,
        "! <em>Key property</em> WithholdingTaxType
        withholding_tax_type       TYPE c LENGTH 2,
        "! ExemptionDateBegin
        exemption_date_begin       TYPE datn,
        "! ExemptionDateEnd
        exemption_date_end         TYPE datn,
        "! ExemptionReason
        exemption_reason           TYPE c LENGTH 2,
        "! IsWithholdingTaxSubject
        is_withholding_tax_subject TYPE abap_bool,
        "! RecipientType
        recipient_type             TYPE c LENGTH 2,
        "! WithholdingTaxCertificate
        withholding_tax_certificat TYPE c LENGTH 25,
        "! WithholdingTaxCode
        withholding_tax_code       TYPE c LENGTH 2,
        "! WithholdingTaxExmptPercent
        withholding_tax_exmpt_perc TYPE p LENGTH 3 DECIMALS 2,
        "! WithholdingTaxNumber
        withholding_tax_number     TYPE c LENGTH 16,
        "! AuthorizationGroup
        authorization_group        TYPE c LENGTH 4,
      END OF tys_a_supplier_with_holding__2,
      "! <p class="shorttext synchronized">List of A_SupplierWithHoldingTaxType</p>
      tyt_a_supplier_with_holding__2 TYPE STANDARD TABLE OF tys_a_supplier_with_holding__2 WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! A_AddressEmailAddress
        "! <br/> Collection of type 'A_AddressEmailAddressType'
        a_address_email_address    TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_ADDRESS_EMAIL_ADDRESS',
        "! A_AddressFaxNumber
        "! <br/> Collection of type 'A_AddressFaxNumberType'
        a_address_fax_number       TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_ADDRESS_FAX_NUMBER',
        "! A_AddressHomePageURL
        "! <br/> Collection of type 'A_AddressHomePageURLType'
        a_address_home_page_url    TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_ADDRESS_HOME_PAGE_URL',
        "! A_AddressPhoneNumber
        "! <br/> Collection of type 'A_AddressPhoneNumberType'
        a_address_phone_number     TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_ADDRESS_PHONE_NUMBER',
        "! A_BPAddressIndependentEmail
        "! <br/> Collection of type 'A_BPAddressIndependentEmailType'
        a_bpaddress_independent_em TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BPADDRESS_INDEPENDENT_EM',
        "! A_BPAddressIndependentFax
        "! <br/> Collection of type 'A_BPAddressIndependentFaxType'
        a_bpaddress_independent_fa TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BPADDRESS_INDEPENDENT_FA',
        "! A_BPAddressIndependentMobile
        "! <br/> Collection of type 'A_BPAddressIndependentMobileType'
        a_bpaddress_independent_mo TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BPADDRESS_INDEPENDENT_MO',
        "! A_BPAddressIndependentPhone
        "! <br/> Collection of type 'A_BPAddressIndependentPhoneType'
        a_bpaddress_independent_ph TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BPADDRESS_INDEPENDENT_PH',
        "! A_BPAddressIndependentWebsite
        "! <br/> Collection of type 'A_BPAddressIndependentWebsiteType'
        a_bpaddress_independent_we TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BPADDRESS_INDEPENDENT_WE',
        "! A_BPAddrDepdntIntlLocNumber
        "! <br/> Collection of type 'A_BPAddrDepdntIntlLocNumberType'
        a_bpaddr_depdnt_intl_loc_n TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BPADDR_DEPDNT_INTL_LOC_N',
        "! A_BPContactToAddress
        "! <br/> Collection of type 'A_BPContactToAddressType'
        a_bpcontact_to_address     TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BPCONTACT_TO_ADDRESS',
        "! A_BPContactToFuncAndDept
        "! <br/> Collection of type 'A_BPContactToFuncAndDeptType'
        a_bpcontact_to_func_and_de TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BPCONTACT_TO_FUNC_AND_DE',
        "! A_BPCreditWorthiness
        "! <br/> Collection of type 'A_BPCreditWorthinessType'
        a_bpcredit_worthiness      TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BPCREDIT_WORTHINESS',
        "! A_BPDataController
        "! <br/> Collection of type 'A_BPDataControllerType'
        a_bpdata_controller        TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BPDATA_CONTROLLER',
        "! A_BPEmployment
        "! <br/> Collection of type 'A_BPEmploymentType'
        a_bpemployment             TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BPEMPLOYMENT',
        "! A_BPFinancialServicesExtn
        "! <br/> Collection of type 'A_BPFinancialServicesExtnType'
        a_bpfinancial_services_ext TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BPFINANCIAL_SERVICES_EXT',
        "! A_BPFinancialServicesReporting
        "! <br/> Collection of type 'A_BPFinancialServicesReportingType'
        a_bpfinancial_services_rep TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BPFINANCIAL_SERVICES_REP',
        "! A_BPFiscalYearInformation
        "! <br/> Collection of type 'A_BPFiscalYearInformationType'
        a_bpfiscal_year_informatio TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BPFISCAL_YEAR_INFORMATIO',
        "! A_BPIntlAddressVersion
        "! <br/> Collection of type 'A_BPIntlAddressVersionType'
        a_bpintl_address_version   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BPINTL_ADDRESS_VERSION',
        "! A_BPRelationship
        "! <br/> Collection of type 'A_BPRelationshipType'
        a_bprelationship           TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BPRELATIONSHIP',
        "! A_BusinessPartner
        "! <br/> Collection of type 'A_BusinessPartnerType'
        a_business_partner         TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BUSINESS_PARTNER',
        "! A_BusinessPartnerAddress
        "! <br/> Collection of type 'A_BusinessPartnerAddressType'
        a_business_partner_address TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BUSINESS_PARTNER_ADDRESS',
        "! A_BusinessPartnerAlias
        "! <br/> Collection of type 'A_BusinessPartnerAliasType'
        a_business_partner_alias   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BUSINESS_PARTNER_ALIAS',
        "! A_BusinessPartnerBank
        "! <br/> Collection of type 'A_BusinessPartnerBankType'
        a_business_partner_bank    TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BUSINESS_PARTNER_BANK',
        "! A_BusinessPartnerContact
        "! <br/> Collection of type 'A_BusinessPartnerContactType'
        a_business_partner_contact TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BUSINESS_PARTNER_CONTACT',
        "! A_BusinessPartnerIsBank
        "! <br/> Collection of type 'A_BusinessPartnerIsBankType'
        a_business_partner_is_bank TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BUSINESS_PARTNER_IS_BANK',
        "! A_BusinessPartnerPaymentCard
        "! <br/> Collection of type 'A_BusinessPartnerPaymentCardType'
        a_business_partner_payment TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BUSINESS_PARTNER_PAYMENT',
        "! A_BusinessPartnerRating
        "! <br/> Collection of type 'A_BusinessPartnerRatingType'
        a_business_partner_rating  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BUSINESS_PARTNER_RATING',
        "! A_BusinessPartnerRole
        "! <br/> Collection of type 'A_BusinessPartnerRoleType'
        a_business_partner_role    TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BUSINESS_PARTNER_ROLE',
        "! A_BusinessPartnerTaxNumber
        "! <br/> Collection of type 'A_BusinessPartnerTaxNumberType'
        a_business_partner_tax_num TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BUSINESS_PARTNER_TAX_NUM',
        "! A_BusPartAddrDepdntTaxNmbr
        "! <br/> Collection of type 'A_BusPartAddrDepdntTaxNmbrType'
        a_bus_part_addr_depdnt_tax TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BUS_PART_ADDR_DEPDNT_TAX',
        "! A_BuPaAddressUsage
        "! <br/> Collection of type 'A_BuPaAddressUsageType'
        a_bu_pa_address_usage      TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BU_PA_ADDRESS_USAGE',
        "! A_BuPaIdentification
        "! <br/> Collection of type 'A_BuPaIdentificationType'
        a_bu_pa_identification     TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BU_PA_IDENTIFICATION',
        "! A_BuPaIndustry
        "! <br/> Collection of type 'A_BuPaIndustryType'
        a_bu_pa_industry           TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BU_PA_INDUSTRY',
        "! A_Customer
        "! <br/> Collection of type 'A_CustomerType'
        a_customer                 TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_CUSTOMER',
        "! A_CustomerCompany
        "! <br/> Collection of type 'A_CustomerCompanyType'
        a_customer_company         TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_CUSTOMER_COMPANY',
        "! A_CustomerCompanyText
        "! <br/> Collection of type 'A_CustomerCompanyTextType'
        a_customer_company_text    TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_CUSTOMER_COMPANY_TEXT',
        "! A_CustomerDunning
        "! <br/> Collection of type 'A_CustomerDunningType'
        a_customer_dunning         TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_CUSTOMER_DUNNING',
        "! A_CustomerSalesArea
        "! <br/> Collection of type 'A_CustomerSalesAreaType'
        a_customer_sales_area      TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_CUSTOMER_SALES_AREA',
        "! A_CustomerSalesAreaTax
        "! <br/> Collection of type 'A_CustomerSalesAreaTaxType'
        a_customer_sales_area_tax  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_CUSTOMER_SALES_AREA_TAX',
        "! A_CustomerSalesAreaText
        "! <br/> Collection of type 'A_CustomerSalesAreaTextType'
        a_customer_sales_area_text TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_CUSTOMER_SALES_AREA_TEXT',
        "! A_CustomerTaxGrouping
        "! <br/> Collection of type 'A_CustomerTaxGroupingType'
        a_customer_tax_grouping    TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_CUSTOMER_TAX_GROUPING',
        "! A_CustomerText
        "! <br/> Collection of type 'A_CustomerTextType'
        a_customer_text            TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_CUSTOMER_TEXT',
        "! A_CustomerUnloadingPoint
        "! <br/> Collection of type 'A_CustomerUnloadingPointType'
        a_customer_unloading_point TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_CUSTOMER_UNLOADING_POINT',
        "! A_CustomerWithHoldingTax
        "! <br/> Collection of type 'A_CustomerWithHoldingTaxType'
        a_customer_with_holding_ta TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_CUSTOMER_WITH_HOLDING_TA',
        "! A_CustAddrDepdntExtIdentifier
        "! <br/> Collection of type 'A_CustAddrDepdntExtIdentifierType'
        a_cust_addr_depdnt_ext_ide TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_CUST_ADDR_DEPDNT_EXT_IDE',
        "! A_CustAddrDepdntInformation
        "! <br/> Collection of type 'A_CustAddrDepdntInformationType'
        a_cust_addr_depdnt_informa TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_CUST_ADDR_DEPDNT_INFORMA',
        "! A_CustSalesPartnerFunc
        "! <br/> Collection of type 'A_CustSalesPartnerFuncType'
        a_cust_sales_partner_func  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_CUST_SALES_PARTNER_FUNC',
        "! A_CustSlsAreaAddrDepdntInfo
        "! <br/> Collection of type 'A_CustSlsAreaAddrDepdntInfoType'
        a_cust_sls_area_addr_depdn TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_CUST_SLS_AREA_ADDR_DEPDN',
        "! A_CustSlsAreaAddrDepdntTaxInfo
        "! <br/> Collection of type 'A_CustSlsAreaAddrDepdntTaxInfoType'
        a_cust_sls_area_addr_dep_2 TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_CUST_SLS_AREA_ADDR_DEP_2',
        "! A_CustUnldgPtAddrDepdntInfo
        "! <br/> Collection of type 'A_CustUnldgPtAddrDepdntInfoType'
        a_cust_unldg_pt_addr_depdn TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_CUST_UNLDG_PT_ADDR_DEPDN',
        "! A_Supplier
        "! <br/> Collection of type 'A_SupplierType'
        a_supplier                 TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_SUPPLIER',
        "! A_SupplierCompany
        "! <br/> Collection of type 'A_SupplierCompanyType'
        a_supplier_company         TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_SUPPLIER_COMPANY',
        "! A_SupplierCompanyText
        "! <br/> Collection of type 'A_SupplierCompanyTextType'
        a_supplier_company_text    TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_SUPPLIER_COMPANY_TEXT',
        "! A_SupplierDunning
        "! <br/> Collection of type 'A_SupplierDunningType'
        a_supplier_dunning         TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_SUPPLIER_DUNNING',
        "! A_SupplierPartnerFunc
        "! <br/> Collection of type 'A_SupplierPartnerFuncType'
        a_supplier_partner_func    TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_SUPPLIER_PARTNER_FUNC',
        "! A_SupplierPurchasingOrg
        "! <br/> Collection of type 'A_SupplierPurchasingOrgType'
        a_supplier_purchasing_org  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_SUPPLIER_PURCHASING_ORG',
        "! A_SupplierPurchasingOrgText
        "! <br/> Collection of type 'A_SupplierPurchasingOrgTextType'
        a_supplier_purchasing_or_2 TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_SUPPLIER_PURCHASING_OR_2',
        "! A_SupplierText
        "! <br/> Collection of type 'A_SupplierTextType'
        a_supplier_text            TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_SUPPLIER_TEXT',
        "! A_SupplierWithHoldingTax
        "! <br/> Collection of type 'A_SupplierWithHoldingTaxType'
        a_supplier_with_holding_ta TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_SUPPLIER_WITH_HOLDING_TA',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for A_AddressEmailAddressType</p>
        "! See also structure type {@link ..tys_a_address_email_address_ty}
        BEGIN OF a_address_email_address_ty,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_address_email_address_ty,
        "! <p class="shorttext synchronized">Internal names for A_AddressFaxNumberType</p>
        "! See also structure type {@link ..tys_a_address_fax_number_type}
        BEGIN OF a_address_fax_number_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_address_fax_number_type,
        "! <p class="shorttext synchronized">Internal names for A_AddressHomePageURLType</p>
        "! See also structure type {@link ..tys_a_address_home_page_urltyp}
        BEGIN OF a_address_home_page_urltyp,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_address_home_page_urltyp,
        "! <p class="shorttext synchronized">Internal names for A_AddressPhoneNumberType</p>
        "! See also structure type {@link ..tys_a_address_phone_number_typ}
        BEGIN OF a_address_phone_number_typ,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_address_phone_number_typ,
        "! <p class="shorttext synchronized">Internal names for A_BPAddressIndependentEmailType</p>
        "! See also structure type {@link ..tys_a_bpaddress_independent__2}
        BEGIN OF a_bpaddress_independent__2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_bpaddress_independent__2,
        "! <p class="shorttext synchronized">Internal names for A_BPAddressIndependentFaxType</p>
        "! See also structure type {@link ..tys_a_bpaddress_independent__3}
        BEGIN OF a_bpaddress_independent__3,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_bpaddress_independent__3,
        "! <p class="shorttext synchronized">Internal names for A_BPAddressIndependentMobileType</p>
        "! See also structure type {@link ..tys_a_bpaddress_independent__4}
        BEGIN OF a_bpaddress_independent__4,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_bpaddress_independent__4,
        "! <p class="shorttext synchronized">Internal names for A_BPAddressIndependentPhoneType</p>
        "! See also structure type {@link ..tys_a_bpaddress_independent__5}
        BEGIN OF a_bpaddress_independent__5,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_bpaddress_independent__5,
        "! <p class="shorttext synchronized">Internal names for A_BPAddressIndependentWebsiteType</p>
        "! See also structure type {@link ..tys_a_bpaddress_independent__6}
        BEGIN OF a_bpaddress_independent__6,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_bpaddress_independent__6,
        "! <p class="shorttext synchronized">Internal names for A_BPAddrDepdntIntlLocNumberType</p>
        "! See also structure type {@link ..tys_a_bpaddr_depdnt_intl_loc_2}
        BEGIN OF a_bpaddr_depdnt_intl_loc_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_bpaddr_depdnt_intl_loc_2,
        "! <p class="shorttext synchronized">Internal names for A_BPContactToAddressType</p>
        "! See also structure type {@link ..tys_a_bpcontact_to_address_typ}
        BEGIN OF a_bpcontact_to_address_typ,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_EmailAddress
            to_email_address       TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_EMAIL_ADDRESS',
            "! to_FaxNumber
            to_fax_number          TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_FAX_NUMBER',
            "! to_MobilePhoneNumber
            to_mobile_phone_number TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_MOBILE_PHONE_NUMBER',
            "! to_PhoneNumber
            to_phone_number        TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PHONE_NUMBER',
            "! to_URLAddress
            to_urladdress          TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_URLADDRESS',
          END OF navigation,
        END OF a_bpcontact_to_address_typ,
        "! <p class="shorttext synchronized">Internal names for A_BPContactToFuncAndDeptType</p>
        "! See also structure type {@link ..tys_a_bpcontact_to_func_and__2}
        BEGIN OF a_bpcontact_to_func_and__2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_bpcontact_to_func_and__2,
        "! <p class="shorttext synchronized">Internal names for A_BPCreditWorthinessType</p>
        "! See also structure type {@link ..tys_a_bpcredit_worthiness_type}
        BEGIN OF a_bpcredit_worthiness_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_bpcredit_worthiness_type,
        "! <p class="shorttext synchronized">Internal names for A_BPDataControllerType</p>
        "! See also structure type {@link ..tys_a_bpdata_controller_type}
        BEGIN OF a_bpdata_controller_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_bpdata_controller_type,
        "! <p class="shorttext synchronized">Internal names for A_BPEmploymentType</p>
        "! See also structure type {@link ..tys_a_bpemployment_type}
        BEGIN OF a_bpemployment_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_bpemployment_type,
        "! <p class="shorttext synchronized">Internal names for A_BPFinancialServicesExtnType</p>
        "! See also structure type {@link ..tys_a_bpfinancial_services_e_2}
        BEGIN OF a_bpfinancial_services_e_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_bpfinancial_services_e_2,
        "! <p class="shorttext synchronized">Internal names for A_BPFinancialServicesReportingType</p>
        "! See also structure type {@link ..tys_a_bpfinancial_services_r_2}
        BEGIN OF a_bpfinancial_services_r_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_bpfinancial_services_r_2,
        "! <p class="shorttext synchronized">Internal names for A_BPFiscalYearInformationType</p>
        "! See also structure type {@link ..tys_a_bpfiscal_year_informat_2}
        BEGIN OF a_bpfiscal_year_informat_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_bpfiscal_year_informat_2,
        "! <p class="shorttext synchronized">Internal names for A_BPIntlAddressVersionType</p>
        "! See also structure type {@link ..tys_a_bpintl_address_version_t}
        BEGIN OF a_bpintl_address_version_t,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_bpintl_address_version_t,
        "! <p class="shorttext synchronized">Internal names for A_BPRelationshipType</p>
        "! See also structure type {@link ..tys_a_bprelationship_type}
        BEGIN OF a_bprelationship_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_bprelationship_type,
        "! <p class="shorttext synchronized">Internal names for A_BusinessPartnerAddressType</p>
        "! See also structure type {@link ..tys_a_business_partner_addre_2}
        BEGIN OF a_business_partner_addre_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_AddressUsage
            to_address_usage          TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_ADDRESS_USAGE',
            "! to_BPAddrDepdntIntlLocNumber
            to_bpaddr_depdnt_intl_loc TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BPADDR_DEPDNT_INTL_LOC',
            "! to_BPIntlAddressVersion
            to_bpintl_address_version TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BPINTL_ADDRESS_VERSION',
            "! to_EmailAddress
            to_email_address          TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_EMAIL_ADDRESS',
            "! to_FaxNumber
            to_fax_number             TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_FAX_NUMBER',
            "! to_MobilePhoneNumber
            to_mobile_phone_number    TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_MOBILE_PHONE_NUMBER',
            "! to_PhoneNumber
            to_phone_number           TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PHONE_NUMBER',
            "! to_URLAddress
            to_urladdress             TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_URLADDRESS',
          END OF navigation,
        END OF a_business_partner_addre_2,
        "! <p class="shorttext synchronized">Internal names for A_BusinessPartnerAliasType</p>
        "! See also structure type {@link ..tys_a_business_partner_alias_t}
        BEGIN OF a_business_partner_alias_t,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_business_partner_alias_t,
        "! <p class="shorttext synchronized">Internal names for A_BusinessPartnerBankType</p>
        "! See also structure type {@link ..tys_a_business_partner_bank_ty}
        BEGIN OF a_business_partner_bank_ty,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_business_partner_bank_ty,
        "! <p class="shorttext synchronized">Internal names for A_BusinessPartnerContactType</p>
        "! See also structure type {@link ..tys_a_business_partner_conta_2}
        BEGIN OF a_business_partner_conta_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_ContactAddress
            to_contact_address      TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_CONTACT_ADDRESS',
            "! to_ContactRelationship
            to_contact_relationship TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_CONTACT_RELATIONSHIP',
          END OF navigation,
        END OF a_business_partner_conta_2,
        "! <p class="shorttext synchronized">Internal names for A_BusinessPartnerIsBankType</p>
        "! See also structure type {@link ..tys_a_business_partner_is_ba_2}
        BEGIN OF a_business_partner_is_ba_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_business_partner_is_ba_2,
        "! <p class="shorttext synchronized">Internal names for A_BusinessPartnerPaymentCardType</p>
        "! See also structure type {@link ..tys_a_business_partner_payme_2}
        BEGIN OF a_business_partner_payme_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_business_partner_payme_2,
        "! <p class="shorttext synchronized">Internal names for A_BusinessPartnerRatingType</p>
        "! See also structure type {@link ..tys_a_business_partner_ratin_2}
        BEGIN OF a_business_partner_ratin_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_business_partner_ratin_2,
        "! <p class="shorttext synchronized">Internal names for A_BusinessPartnerRoleType</p>
        "! See also structure type {@link ..tys_a_business_partner_role_ty}
        BEGIN OF a_business_partner_role_ty,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_business_partner_role_ty,
        "! <p class="shorttext synchronized">Internal names for A_BusinessPartnerTaxNumberType</p>
        "! See also structure type {@link ..tys_a_business_partner_tax_n_2}
        BEGIN OF a_business_partner_tax_n_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_business_partner_tax_n_2,
        "! <p class="shorttext synchronized">Internal names for A_BusinessPartnerType</p>
        "! See also structure type {@link ..tys_a_business_partner_type}
        BEGIN OF a_business_partner_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_AddressIndependentEmail
            to_address_independent_ema TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_ADDRESS_INDEPENDENT_EMA',
            "! to_AddressIndependentFax
            to_address_independent_fax TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_ADDRESS_INDEPENDENT_FAX',
            "! to_AddressIndependentMobile
            to_address_independent_mob TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_ADDRESS_INDEPENDENT_MOB',
            "! to_AddressIndependentPhone
            to_address_independent_pho TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_ADDRESS_INDEPENDENT_PHO',
            "! to_AddressIndependentWebsite
            to_address_independent_web TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_ADDRESS_INDEPENDENT_WEB',
            "! to_BPCreditWorthiness
            to_bpcredit_worthiness     TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BPCREDIT_WORTHINESS',
            "! to_BPDataController
            to_bpdata_controller       TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BPDATA_CONTROLLER',
            "! to_BPEmployment
            to_bpemployment            TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BPEMPLOYMENT',
            "! to_BPFinServicesReporting
            to_bpfin_services_reportin TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BPFIN_SERVICES_REPORTIN',
            "! to_BPFiscalYearInformation
            to_bpfiscal_year_informati TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BPFISCAL_YEAR_INFORMATI',
            "! to_BPRelationship
            to_bprelationship          TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BPRELATIONSHIP',
            "! to_BusinessPartner
            to_business_partner        TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BUSINESS_PARTNER',
            "! to_BusinessPartnerAddress
            to_business_partner_addres TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BUSINESS_PARTNER_ADDRES',
            "! to_BusinessPartnerAlias
            to_business_partner_alias  TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BUSINESS_PARTNER_ALIAS',
            "! to_BusinessPartnerBank
            to_business_partner_bank   TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BUSINESS_PARTNER_BANK',
            "! to_BusinessPartnerContact
            to_business_partner_contac TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BUSINESS_PARTNER_CONTAC',
            "! to_BusinessPartnerIsBank
            to_business_partner_is_ban TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BUSINESS_PARTNER_IS_BAN',
            "! to_BusinessPartnerRating
            to_business_partner_rating TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BUSINESS_PARTNER_RATING',
            "! to_BusinessPartnerRole
            to_business_partner_role   TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BUSINESS_PARTNER_ROLE',
            "! to_BusinessPartnerTax
            to_business_partner_tax    TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BUSINESS_PARTNER_TAX',
            "! to_BusPartAddrDepdntTaxNmbr
            to_bus_part_addr_depdnt_ta TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BUS_PART_ADDR_DEPDNT_TA',
            "! to_BuPaIdentification
            to_bu_pa_identification    TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BU_PA_IDENTIFICATION',
            "! to_BuPaIndustry
            to_bu_pa_industry          TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BU_PA_INDUSTRY',
            "! to_Customer
            to_customer                TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_CUSTOMER',
            "! to_PaymentCard
            to_payment_card            TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PAYMENT_CARD',
            "! to_Supplier
            to_supplier                TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SUPPLIER',
          END OF navigation,
        END OF a_business_partner_type,
        "! <p class="shorttext synchronized">Internal names for A_BusPartAddrDepdntTaxNmbrType</p>
        "! See also structure type {@link ..tys_a_bus_part_addr_depdnt_t_2}
        BEGIN OF a_bus_part_addr_depdnt_t_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_bus_part_addr_depdnt_t_2,
        "! <p class="shorttext synchronized">Internal names for A_BuPaAddressUsageType</p>
        "! See also structure type {@link ..tys_a_bu_pa_address_usage_type}
        BEGIN OF a_bu_pa_address_usage_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_bu_pa_address_usage_type,
        "! <p class="shorttext synchronized">Internal names for A_BuPaIdentificationType</p>
        "! See also structure type {@link ..tys_a_bu_pa_identification_typ}
        BEGIN OF a_bu_pa_identification_typ,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_bu_pa_identification_typ,
        "! <p class="shorttext synchronized">Internal names for A_BuPaIndustryType</p>
        "! See also structure type {@link ..tys_a_bu_pa_industry_type}
        BEGIN OF a_bu_pa_industry_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_bu_pa_industry_type,
        "! <p class="shorttext synchronized">Internal names for A_CustomerCompanyTextType</p>
        "! See also structure type {@link ..tys_a_customer_company_text_ty}
        BEGIN OF a_customer_company_text_ty,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_customer_company_text_ty,
        "! <p class="shorttext synchronized">Internal names for A_CustomerCompanyType</p>
        "! See also structure type {@link ..tys_a_customer_company_type}
        BEGIN OF a_customer_company_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_CompanyText
            to_company_text     TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_COMPANY_TEXT',
            "! to_CustomerDunning
            to_customer_dunning TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_CUSTOMER_DUNNING',
            "! to_WithHoldingTax
            to_with_holding_tax TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_WITH_HOLDING_TAX',
          END OF navigation,
        END OF a_customer_company_type,
        "! <p class="shorttext synchronized">Internal names for A_CustomerDunningType</p>
        "! See also structure type {@link ..tys_a_customer_dunning_type}
        BEGIN OF a_customer_dunning_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_customer_dunning_type,
        "! <p class="shorttext synchronized">Internal names for A_CustomerSalesAreaTaxType</p>
        "! See also structure type {@link ..tys_a_customer_sales_area_ta_2}
        BEGIN OF a_customer_sales_area_ta_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_SlsAreaAddrDepdntTax
            to_sls_area_addr_depdnt_ta TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SLS_AREA_ADDR_DEPDNT_TA',
          END OF navigation,
        END OF a_customer_sales_area_ta_2,
        "! <p class="shorttext synchronized">Internal names for A_CustomerSalesAreaTextType</p>
        "! See also structure type {@link ..tys_a_customer_sales_area_te_2}
        BEGIN OF a_customer_sales_area_te_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_customer_sales_area_te_2,
        "! <p class="shorttext synchronized">Internal names for A_CustomerSalesAreaType</p>
        "! See also structure type {@link ..tys_a_customer_sales_area_type}
        BEGIN OF a_customer_sales_area_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_PartnerFunction
            to_partner_function        TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PARTNER_FUNCTION',
            "! to_SalesAreaTax
            to_sales_area_tax          TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SALES_AREA_TAX',
            "! to_SalesAreaText
            to_sales_area_text         TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SALES_AREA_TEXT',
            "! to_SlsAreaAddrDepdntInfo
            to_sls_area_addr_depdnt_in TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SLS_AREA_ADDR_DEPDNT_IN',
          END OF navigation,
        END OF a_customer_sales_area_type,
        "! <p class="shorttext synchronized">Internal names for A_CustomerTaxGroupingType</p>
        "! See also structure type {@link ..tys_a_customer_tax_grouping_ty}
        BEGIN OF a_customer_tax_grouping_ty,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_customer_tax_grouping_ty,
        "! <p class="shorttext synchronized">Internal names for A_CustomerTextType</p>
        "! See also structure type {@link ..tys_a_customer_text_type}
        BEGIN OF a_customer_text_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_customer_text_type,
        "! <p class="shorttext synchronized">Internal names for A_CustomerType</p>
        "! See also structure type {@link ..tys_a_customer_type}
        BEGIN OF a_customer_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_CustomerCompany
            to_customer_company        TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_CUSTOMER_COMPANY',
            "! to_CustomerSalesArea
            to_customer_sales_area     TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_CUSTOMER_SALES_AREA',
            "! to_CustomerTaxGrouping
            to_customer_tax_grouping   TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_CUSTOMER_TAX_GROUPING',
            "! to_CustomerText
            to_customer_text           TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_CUSTOMER_TEXT',
            "! to_CustomerUnloadingPoint
            to_customer_unloading_poin TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_CUSTOMER_UNLOADING_POIN',
            "! to_CustAddrDepdntExtIdentifier
            to_cust_addr_depdnt_ext_id TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_CUST_ADDR_DEPDNT_EXT_ID',
            "! to_CustAddrDepdntInformation
            to_cust_addr_depdnt_inform TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_CUST_ADDR_DEPDNT_INFORM',
            "! to_CustUnldgPtAddrDepdntInfo
            to_cust_unldg_pt_addr_depd TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_CUST_UNLDG_PT_ADDR_DEPD',
          END OF navigation,
        END OF a_customer_type,
        "! <p class="shorttext synchronized">Internal names for A_CustomerUnloadingPointType</p>
        "! See also structure type {@link ..tys_a_customer_unloading_poi_2}
        BEGIN OF a_customer_unloading_poi_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_customer_unloading_poi_2,
        "! <p class="shorttext synchronized">Internal names for A_CustomerWithHoldingTaxType</p>
        "! See also structure type {@link ..tys_a_customer_with_holding__2}
        BEGIN OF a_customer_with_holding__2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_customer_with_holding__2,
        "! <p class="shorttext synchronized">Internal names for A_CustAddrDepdntExtIdentifierType</p>
        "! See also structure type {@link ..tys_a_cust_addr_depdnt_ext_i_2}
        BEGIN OF a_cust_addr_depdnt_ext_i_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_cust_addr_depdnt_ext_i_2,
        "! <p class="shorttext synchronized">Internal names for A_CustAddrDepdntInformationType</p>
        "! See also structure type {@link ..tys_a_cust_addr_depdnt_infor_2}
        BEGIN OF a_cust_addr_depdnt_infor_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_cust_addr_depdnt_infor_2,
        "! <p class="shorttext synchronized">Internal names for A_CustSalesPartnerFuncType</p>
        "! See also structure type {@link ..tys_a_cust_sales_partner_fun_2}
        BEGIN OF a_cust_sales_partner_fun_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_cust_sales_partner_fun_2,
        "! <p class="shorttext synchronized">Internal names for A_CustSlsAreaAddrDepdntInfoType</p>
        "! See also structure type {@link ..tys_a_cust_sls_area_addr_dep_3}
        BEGIN OF a_cust_sls_area_addr_dep_3,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_cust_sls_area_addr_dep_3,
        "! <p class="shorttext synchronized">Internal names for A_CustSlsAreaAddrDepdntTaxInfoType</p>
        "! See also structure type {@link ..tys_a_cust_sls_area_addr_dep_4}
        BEGIN OF a_cust_sls_area_addr_dep_4,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_cust_sls_area_addr_dep_4,
        "! <p class="shorttext synchronized">Internal names for A_CustUnldgPtAddrDepdntInfoType</p>
        "! See also structure type {@link ..tys_a_cust_unldg_pt_addr_dep_2}
        BEGIN OF a_cust_unldg_pt_addr_dep_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_cust_unldg_pt_addr_dep_2,
        "! <p class="shorttext synchronized">Internal names for A_SupplierCompanyTextType</p>
        "! See also structure type {@link ..tys_a_supplier_company_text_ty}
        BEGIN OF a_supplier_company_text_ty,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_supplier_company_text_ty,
        "! <p class="shorttext synchronized">Internal names for A_SupplierCompanyType</p>
        "! See also structure type {@link ..tys_a_supplier_company_type}
        BEGIN OF a_supplier_company_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_CompanyText
            to_company_text            TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_COMPANY_TEXT',
            "! to_Supplier
            to_supplier                TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SUPPLIER',
            "! to_SupplierDunning
            to_supplier_dunning        TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SUPPLIER_DUNNING',
            "! to_SupplierWithHoldingTax
            to_supplier_with_holding_t TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SUPPLIER_WITH_HOLDING_T',
          END OF navigation,
        END OF a_supplier_company_type,
        "! <p class="shorttext synchronized">Internal names for A_SupplierDunningType</p>
        "! See also structure type {@link ..tys_a_supplier_dunning_type}
        BEGIN OF a_supplier_dunning_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_supplier_dunning_type,
        "! <p class="shorttext synchronized">Internal names for A_SupplierPartnerFuncType</p>
        "! See also structure type {@link ..tys_a_supplier_partner_func_ty}
        BEGIN OF a_supplier_partner_func_ty,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_supplier_partner_func_ty,
        "! <p class="shorttext synchronized">Internal names for A_SupplierPurchasingOrgType</p>
        "! See also structure type {@link ..tys_a_supplier_purchasing_or_3}
        BEGIN OF a_supplier_purchasing_or_3,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_PartnerFunction
            to_partner_function    TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PARTNER_FUNCTION',
            "! to_PurchasingOrgText
            to_purchasing_org_text TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PURCHASING_ORG_TEXT',
          END OF navigation,
        END OF a_supplier_purchasing_or_3,
        "! <p class="shorttext synchronized">Internal names for A_SupplierPurchasingOrgTextType</p>
        "! See also structure type {@link ..tys_a_supplier_purchasing_or_4}
        BEGIN OF a_supplier_purchasing_or_4,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_supplier_purchasing_or_4,
        "! <p class="shorttext synchronized">Internal names for A_SupplierTextType</p>
        "! See also structure type {@link ..tys_a_supplier_text_type}
        BEGIN OF a_supplier_text_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_supplier_text_type,
        "! <p class="shorttext synchronized">Internal names for A_SupplierType</p>
        "! See also structure type {@link ..tys_a_supplier_type}
        BEGIN OF a_supplier_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_SupplierCompany
            to_supplier_company        TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SUPPLIER_COMPANY',
            "! to_SupplierPurchasingOrg
            to_supplier_purchasing_org TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SUPPLIER_PURCHASING_ORG',
            "! to_SupplierText
            to_supplier_text           TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SUPPLIER_TEXT',
          END OF navigation,
        END OF a_supplier_type,
        "! <p class="shorttext synchronized">Internal names for A_SupplierWithHoldingTaxType</p>
        "! See also structure type {@link ..tys_a_supplier_with_holding__2}
        BEGIN OF a_supplier_with_holding__2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_supplier_with_holding__2,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.

