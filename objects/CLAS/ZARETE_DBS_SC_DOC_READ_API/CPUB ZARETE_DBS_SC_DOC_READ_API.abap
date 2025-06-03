"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>API_OPLACCTGDOCITEMCUBE_SRV</em>
CLASS zarete_dbs_sc_doc_read_api DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">A_OperationalAcctgDocItemCubeType</p>
      BEGIN OF tys_a_operational_acctg_doc__2,
        "! <em>Key property</em> CompanyCode
        company_code               TYPE c LENGTH 4,
        "! <em>Key property</em> FiscalYear
        fiscal_year                TYPE c LENGTH 4,
        "! <em>Key property</em> AccountingDocument
        accounting_document        TYPE c LENGTH 10,
        "! <em>Key property</em> AccountingDocumentItem
        accounting_document_item   TYPE c LENGTH 3,
        "! CompanyCodeName
        company_code_name          TYPE c LENGTH 25,
        "! ChartOfAccounts
        chart_of_accounts          TYPE c LENGTH 4,
        "! AccountingDocumentItemType
        accounting_document_item_t TYPE c LENGTH 1,
        "! ClearingDate
        clearing_date              TYPE datn,
        "! ClearingCreationDate
        clearing_creation_date     TYPE datn,
        "! ClearingAccountingDocument
        clearing_accounting_docume TYPE c LENGTH 10,
        "! IsCleared
        is_cleared                 TYPE abap_bool,
        "! PostingKey
        posting_key                TYPE c LENGTH 2,
        "! FinancialAccountType
        financial_account_type     TYPE c LENGTH 1,
        "! SpecialGLCode
        special_glcode             TYPE c LENGTH 1,
        "! SpecialGLTransactionType
        special_gltransaction_type TYPE c LENGTH 1,
        "! DebitCreditCode
        debit_credit_code          TYPE c LENGTH 1,
        "! BusinessArea
        business_area              TYPE c LENGTH 4,
        "! BusinessAreaName
        business_area_name         TYPE c LENGTH 30,
        "! PartnerBusinessArea
        partner_business_area      TYPE c LENGTH 4,
        "! TaxCode
        tax_code                   TYPE c LENGTH 2,
        "! WithholdingTaxCode
        withholding_tax_code       TYPE c LENGTH 2,
        "! TaxType
        tax_type                   TYPE c LENGTH 1,
        "! TransactionTypeDetermination
        transaction_type_determina TYPE c LENGTH 3,
        "! ValueDate
        value_date                 TYPE datn,
        "! AssignmentReference
        assignment_reference       TYPE c LENGTH 18,
        "! DocumentItemText
        document_item_text         TYPE c LENGTH 50,
        "! PartnerCompany
        partner_company            TYPE c LENGTH 6,
        "! FinancialTransactionType
        financial_transaction_type TYPE c LENGTH 3,
        "! CorporateGroupAccount
        corporate_group_account    TYPE c LENGTH 10,
        "! PlanningLevel
        planning_level             TYPE c LENGTH 2,
        "! ControllingArea
        controlling_area           TYPE c LENGTH 4,
        "! ControllingAreaName
        controlling_area_name      TYPE c LENGTH 25,
        "! CostCenter
        cost_center                TYPE c LENGTH 10,
        "! CostCenterName
        cost_center_name           TYPE c LENGTH 20,
        "! Project
        project                    TYPE c LENGTH 24,
        "! OrderID
        order_id                   TYPE c LENGTH 12,
        "! BillingDocument
        billing_document           TYPE c LENGTH 10,
        "! SalesDocument
        sales_document             TYPE c LENGTH 10,
        "! SalesDocumentItem
        sales_document_item        TYPE c LENGTH 6,
        "! ScheduleLine
        schedule_line              TYPE c LENGTH 4,
        "! MasterFixedAsset
        master_fixed_asset         TYPE c LENGTH 12,
        "! FixedAsset
        fixed_asset                TYPE c LENGTH 4,
        "! AssetTransactionType
        asset_transaction_type     TYPE c LENGTH 3,
        "! AssetValueDate
        asset_value_date           TYPE datn,
        "! PersonnelNumber
        personnel_number           TYPE c LENGTH 8,
        "! IsSalesRelated
        is_sales_related           TYPE abap_bool,
        "! LineItemDisplayIsEnabled
        line_item_display_is_enabl TYPE abap_bool,
        "! IsOpenItemManaged
        is_open_item_managed       TYPE c LENGTH 1,
        "! IsNotCashDiscountLiable
        is_not_cash_discount_liabl TYPE abap_bool,
        "! IsAutomaticallyCreated
        is_automatically_created   TYPE abap_bool,
        "! IsUsedInPaymentTransaction
        is_used_in_payment_transac TYPE abap_bool,
        "! OperationalGLAccount
        operational_glaccount      TYPE c LENGTH 10,
        "! GLAccount
        glaccount                  TYPE c LENGTH 10,
        "! GLAccountName
        glaccount_name             TYPE c LENGTH 30,
        "! GLAccountLongName
        glaccount_long_name        TYPE c LENGTH 50,
        "! Customer
        customer                   TYPE c LENGTH 10,
        "! CustomerName
        customer_name              TYPE c LENGTH 80,
        "! Supplier
        supplier                   TYPE c LENGTH 10,
        "! SupplierName
        supplier_name              TYPE c LENGTH 80,
        "! BranchAccount
        branch_account             TYPE c LENGTH 10,
        "! IsBalanceSheetAccount
        is_balance_sheet_account   TYPE abap_bool,
        "! ProfitLossAccountType
        profit_loss_account_type   TYPE c LENGTH 2,
        "! SpecialGLAccountAssignment
        special_glaccount_assignme TYPE c LENGTH 18,
        "! DueCalculationBaseDate
        due_calculation_base_date  TYPE datn,
        "! PaymentTerms
        payment_terms              TYPE c LENGTH 4,
        "! CashDiscount1Days
        cash_discount_1_days       TYPE p LENGTH 2 DECIMALS 0,
        "! CashDiscount2Days
        cash_discount_2_days       TYPE p LENGTH 2 DECIMALS 0,
        "! NetPaymentDays
        net_payment_days           TYPE p LENGTH 2 DECIMALS 0,
        "! CashDiscount1Percent
        cash_discount_1_percent    TYPE p LENGTH 3 DECIMALS 3,
        "! CashDiscount2Percent
        cash_discount_2_percent    TYPE p LENGTH 3 DECIMALS 3,
        "! PaymentReason
        payment_reason             TYPE c LENGTH 4,
        "! PaymentMethod
        payment_method             TYPE c LENGTH 1,
        "! PaymentBlockingReason
        payment_blocking_reason    TYPE c LENGTH 1,
        "! FixedCashDiscount
        fixed_cash_discount        TYPE c LENGTH 1,
        "! HouseBank
        house_bank                 TYPE c LENGTH 5,
        "! BPBankAccountInternalID
        bpbank_account_internal_id TYPE c LENGTH 4,
        "! TaxDistributionCode1
        tax_distribution_code_1    TYPE c LENGTH 2,
        "! TaxDistributionCode2
        tax_distribution_code_2    TYPE c LENGTH 2,
        "! TaxDistributionCode3
        tax_distribution_code_3    TYPE c LENGTH 2,
        "! InvoiceReference
        invoice_reference          TYPE c LENGTH 10,
        "! InvoiceReferenceFiscalYear
        invoice_reference_fiscal_y TYPE c LENGTH 4,
        "! InvoiceItemReference
        invoice_item_reference     TYPE c LENGTH 3,
        "! FollowOnDocumentType
        follow_on_document_type    TYPE c LENGTH 1,
        "! StateCentralBankPaymentReason
        state_central_bank_payment TYPE c LENGTH 3,
        "! SupplyingCountry
        supplying_country          TYPE c LENGTH 3,
        "! InvoiceList
        invoice_list               TYPE c LENGTH 8,
        "! BillOfExchangeUsage
        bill_of_exchange_usage     TYPE c LENGTH 1,
        "! DunningKey
        dunning_key                TYPE c LENGTH 1,
        "! DunningBlockingReason
        dunning_blocking_reason    TYPE c LENGTH 1,
        "! LastDunningDate
        last_dunning_date          TYPE datn,
        "! DunningLevel
        dunning_level              TYPE c LENGTH 1,
        "! DunningArea
        dunning_area               TYPE c LENGTH 2,
        "! WithholdingTaxCertificate
        withholding_tax_certificat TYPE c LENGTH 10,
        "! Material
        material                   TYPE c LENGTH 40,
        "! Product
        product                    TYPE c LENGTH 40,
        "! Plant
        plant                      TYPE c LENGTH 4,
        "! PurchasingDocument
        purchasing_document        TYPE c LENGTH 10,
        "! PurchasingDocumentItem
        purchasing_document_item   TYPE c LENGTH 5,
        "! AccountAssignmentNumber
        account_assignment_number  TYPE c LENGTH 2,
        "! IsCompletelyDelivered
        is_completely_delivered    TYPE abap_bool,
        "! MaterialPriceControl
        material_price_control     TYPE c LENGTH 1,
        "! ValuationArea
        valuation_area             TYPE c LENGTH 4,
        "! InventoryValuationType
        inventory_valuation_type   TYPE c LENGTH 10,
        "! VATRegistration
        vatregistration            TYPE c LENGTH 20,
        "! DelivOfGoodsDestCountry
        deliv_of_goods_dest_countr TYPE c LENGTH 3,
        "! PaymentDifferenceReason
        payment_difference_reason  TYPE c LENGTH 3,
        "! ProfitCenter
        profit_center              TYPE c LENGTH 10,
        "! ProfitCenterName
        profit_center_name         TYPE c LENGTH 20,
        "! JointVenture
        joint_venture              TYPE c LENGTH 6,
        "! JointVentureCostRecoveryCode
        joint_venture_cost_recover TYPE c LENGTH 2,
        "! JointVentureEquityGroup
        joint_venture_equity_group TYPE c LENGTH 3,
        "! JointVenturePartner
        joint_venture_partner      TYPE c LENGTH 10,
        "! TreasuryContractType
        treasury_contract_type     TYPE c LENGTH 1,
        "! AssetContract
        asset_contract             TYPE c LENGTH 13,
        "! CashFlowType
        cash_flow_type             TYPE c LENGTH 4,
        "! TaxJurisdiction
        tax_jurisdiction           TYPE c LENGTH 15,
        "! RealEstateObject
        real_estate_object         TYPE c LENGTH 40,
        "! SettlementReferenceDate
        settlement_reference_date  TYPE datn,
        "! CommitmentItem
        commitment_item            TYPE c LENGTH 24,
        "! CostObject
        cost_object                TYPE c LENGTH 12,
        "! ProjectNetwork
        project_network            TYPE c LENGTH 12,
        "! OrderInternalBillOfOperations
        order_internal_bill_of_ope TYPE c LENGTH 10,
        "! OrderIntBillOfOperationsItem
        order_int_bill_of_operatio TYPE c LENGTH 8,
        "! WBSElementInternalID
        wbselement_internal_id     TYPE c LENGTH 8,
        "! ProfitabilitySegment
        profitability_segment      TYPE c LENGTH 10,
        "! JointVentureBillingType
        joint_venture_billing_type TYPE c LENGTH 2,
        "! JointVentureEquityType
        joint_venture_equity_type  TYPE c LENGTH 3,
        "! IsEUTriangularDeal
        is_eutriangular_deal       TYPE abap_bool,
        "! CostOriginGroup
        cost_origin_group          TYPE c LENGTH 4,
        "! CompanyCodeCurrencyDetnMethod
        company_code_currency_detn TYPE c LENGTH 1,
        "! ClearingIsReversed
        clearing_is_reversed       TYPE abap_bool,
        "! PaymentMethodSupplement
        payment_method_supplement  TYPE c LENGTH 2,
        "! AlternativeGLAccount
        alternative_glaccount      TYPE c LENGTH 10,
        "! FundsCenter
        funds_center               TYPE c LENGTH 16,
        "! Fund
        fund                       TYPE c LENGTH 10,
        "! PartnerProfitCenter
        partner_profit_center      TYPE c LENGTH 10,
        "! Reference1IDByBusinessPartner
        reference_1_idby_business  TYPE c LENGTH 12,
        "! Reference2IDByBusinessPartner
        reference_2_idby_business  TYPE c LENGTH 12,
        "! IsNegativePosting
        is_negative_posting        TYPE abap_bool,
        "! PaymentCardItem
        payment_card_item          TYPE c LENGTH 3,
        "! PaymentCardPaymentSettlement
        payment_card_payment_settl TYPE c LENGTH 10,
        "! CreditControlArea
        credit_control_area        TYPE c LENGTH 4,
        "! Reference3IDByBusinessPartner
        reference_3_idby_business  TYPE c LENGTH 20,
        "! DataExchangeInstruction1
        data_exchange_instruction  TYPE c LENGTH 2,
        "! DataExchangeInstruction2
        data_exchange_instructio_2 TYPE c LENGTH 2,
        "! DataExchangeInstruction3
        data_exchange_instructio_3 TYPE c LENGTH 2,
        "! DataExchangeInstruction4
        data_exchange_instructio_4 TYPE c LENGTH 2,
        "! Region
        region                     TYPE c LENGTH 3,
        "! HasPaymentOrder
        has_payment_order          TYPE abap_bool,
        "! PaymentReference
        payment_reference          TYPE c LENGTH 30,
        "! TaxDeterminationDate
        tax_determination_date     TYPE datn,
        "! ClearingItem
        clearing_item              TYPE p LENGTH 3 DECIMALS 0,
        "! BusinessPlace
        business_place             TYPE c LENGTH 4,
        "! TaxSection
        tax_section                TYPE c LENGTH 4,
        "! CostCtrActivityType
        cost_ctr_activity_type     TYPE c LENGTH 6,
        "! AccountsReceivableIsPledged
        accounts_receivable_is_ple TYPE c LENGTH 2,
        "! BusinessProcess
        business_process           TYPE c LENGTH 12,
        "! GrantID
        grant_id                   TYPE c LENGTH 20,
        "! FunctionalArea
        functional_area            TYPE c LENGTH 16,
        "! FunctionalAreaName
        functional_area_name       TYPE c LENGTH 30,
        "! CustomerIsInExecution
        customer_is_in_execution   TYPE abap_bool,
        "! FundedProgram
        funded_program             TYPE c LENGTH 24,
        "! ClearingDocFiscalYear
        clearing_doc_fiscal_year   TYPE c LENGTH 4,
        "! LedgerGLLineItem
        ledger_glline_item         TYPE c LENGTH 6,
        "! Segment
        segment                    TYPE c LENGTH 10,
        "! SegmentName
        segment_name               TYPE c LENGTH 50,
        "! PartnerSegment
        partner_segment            TYPE c LENGTH 10,
        "! PartnerFunctionalArea
        partner_functional_area    TYPE c LENGTH 16,
        "! HouseBankAccount
        house_bank_account         TYPE c LENGTH 5,
        "! CostElement
        cost_element               TYPE c LENGTH 10,
        "! SEPAMandate
        sepamandate                TYPE c LENGTH 35,
        "! ReferenceDocumentType
        reference_document_type    TYPE c LENGTH 5,
        "! OriginalReferenceDocument
        original_reference_documen TYPE c LENGTH 20,
        "! ReferenceDocumentLogicalSystem
        reference_document_logical TYPE c LENGTH 10,
        "! AccountingDocumentItemRef
        accounting_document_item_r TYPE c LENGTH 10,
        "! FiscalPeriod
        fiscal_period              TYPE c LENGTH 3,
        "! AccountingDocumentCategory
        accounting_document_catego TYPE c LENGTH 1,
        "! AccountingDocumentCategoryName
        accounting_document_cate_2 TYPE c LENGTH 60,
        "! PostingDate
        posting_date               TYPE datn,
        "! DocumentDate
        document_date              TYPE datn,
        "! AccountingDocumentType
        accounting_document_type   TYPE c LENGTH 2,
        "! AccountingDocumentTypeName
        accounting_document_type_n TYPE c LENGTH 20,
        "! NetDueDate
        net_due_date               TYPE datn,
        "! CashDiscount1DueDate
        cash_discount_1_due_date   TYPE datn,
        "! CashDiscount2DueDate
        cash_discount_2_due_date   TYPE datn,
        "! OffsettingAccount
        offsetting_account         TYPE c LENGTH 10,
        "! OffsettingAccountType
        offsetting_account_type    TYPE c LENGTH 1,
        "! PartnerFund
        partner_fund               TYPE c LENGTH 10,
        "! PartnerGrant
        partner_grant              TYPE c LENGTH 20,
        "! BudgetPeriod
        budget_period              TYPE c LENGTH 10,
        "! PartnerBudgetPeriod
        partner_budget_period      TYPE c LENGTH 10,
        "! BranchCode
        branch_code                TYPE c LENGTH 5,
        "! JointVentureProductionDate
        joint_venture_production_d TYPE datn,
        "! CompanyCodeCurrency
        company_code_currency      TYPE c LENGTH 5,
        "! AmountInCompanyCodeCurrency
        amount_in_company_code_cur TYPE p LENGTH 13 DECIMALS 3,
        "! TaxAmountInCoCodeCrcy
        tax_amount_in_co_code_crcy TYPE p LENGTH 13 DECIMALS 3,
        "! TaxBaseAmountInCoCodeCrcy
        tax_base_amount_in_co_code TYPE p LENGTH 13 DECIMALS 3,
        "! ValuationDiffAmtInCoCodeCrcy
        valuation_diff_amt_in_co_c TYPE p LENGTH 13 DECIMALS 3,
        "! CashDiscountAmtInCoCodeCrcy
        cash_discount_amt_in_co_co TYPE p LENGTH 13 DECIMALS 3,
        "! InvoiceAmtInCoCodeCrcy
        invoice_amt_in_co_code_crc TYPE p LENGTH 13 DECIMALS 3,
        "! TransactionCurrency
        transaction_currency       TYPE c LENGTH 5,
        "! AmountInTransactionCurrency
        amount_in_transaction_curr TYPE p LENGTH 13 DECIMALS 3,
        "! OriginalTaxBaseAmount
        original_tax_base_amount   TYPE p LENGTH 13 DECIMALS 3,
        "! TaxAmount
        tax_amount                 TYPE p LENGTH 13 DECIMALS 3,
        "! TaxBaseAmountInTransCrcy
        tax_base_amount_in_trans_c TYPE p LENGTH 13 DECIMALS 3,
        "! WithholdingTaxBaseAmount
        withholding_tax_base_amoun TYPE p LENGTH 13 DECIMALS 3,
        "! PlannedAmtInTransactionCrcy
        planned_amt_in_transaction TYPE p LENGTH 13 DECIMALS 3,
        "! CashDiscountBaseAmount
        cash_discount_base_amount  TYPE p LENGTH 13 DECIMALS 3,
        "! CashDiscountAmount
        cash_discount_amount       TYPE p LENGTH 13 DECIMALS 3,
        "! NetPaymentAmount
        net_payment_amount         TYPE p LENGTH 13 DECIMALS 3,
        "! WithholdingTaxAmount
        withholding_tax_amount     TYPE p LENGTH 13 DECIMALS 3,
        "! WithholdingTaxExemptionAmt
        withholding_tax_exemption  TYPE p LENGTH 13 DECIMALS 3,
        "! InvoiceAmountInFrgnCurrency
        invoice_amount_in_frgn_cur TYPE p LENGTH 13 DECIMALS 3,
        "! BalanceTransactionCurrency
        balance_transaction_curren TYPE c LENGTH 5,
        "! AmountInBalanceTransacCrcy
        amount_in_balance_transac  TYPE p LENGTH 13 DECIMALS 3,
        "! AdditionalCurrency1
        additional_currency_1      TYPE c LENGTH 5,
        "! ValuationDiffAmtInAddlCrcy1
        valuation_diff_amt_in_addl TYPE p LENGTH 13 DECIMALS 3,
        "! AmountInAdditionalCurrency1
        amount_in_additional_curre TYPE p LENGTH 13 DECIMALS 3,
        "! AdditionalCurrency2
        additional_currency_2      TYPE c LENGTH 5,
        "! AmountInAdditionalCurrency2
        amount_in_additional_cur_2 TYPE p LENGTH 13 DECIMALS 3,
        "! ValuationDiffAmtInAddlCrcy2
        valuation_diff_amt_in_ad_2 TYPE p LENGTH 13 DECIMALS 3,
        "! PaymentCurrency
        payment_currency           TYPE c LENGTH 5,
        "! AmountInPaymentCurrency
        amount_in_payment_currency TYPE p LENGTH 13 DECIMALS 3,
        "! CreditControlAreaCurrency
        credit_control_area_curren TYPE c LENGTH 5,
        "! HedgedAmount
        hedged_amount              TYPE p LENGTH 13 DECIMALS 3,
        "! BaseUnit
        base_unit                  TYPE c LENGTH 3,
        "! Quantity
        quantity                   TYPE p LENGTH 12 DECIMALS 3,
        "! GoodsMovementEntryUnit
        goods_movement_entry_unit  TYPE c LENGTH 3,
        "! QuantityInEntryUnit
        quantity_in_entry_unit     TYPE p LENGTH 7 DECIMALS 3,
        "! PurchasingDocumentPriceUnit
        purchasing_document_price  TYPE c LENGTH 3,
        "! PurchaseOrderQty
        purchase_order_qty         TYPE p LENGTH 7 DECIMALS 3,
        "! MaterialPriceUnitQty
        material_price_unit_qty    TYPE p LENGTH 3 DECIMALS 0,
        "! NumberOfItems
        number_of_items            TYPE p LENGTH 7 DECIMALS 0,
        "! AccountingDocumentCreationDate
        accounting_document_creati TYPE datn,
        "! CreationTime
        creation_time              TYPE timn,
        "! LastChangeDate
        last_change_date           TYPE datn,
        "! ExchangeRateDate
        exchange_rate_date         TYPE datn,
        "! AccountingDocCreatedByUser
        accounting_doc_created_by  TYPE c LENGTH 12,
        "! TransactionCode
        transaction_code           TYPE c LENGTH 20,
        "! IntercompanyTransaction
        intercompany_transaction   TYPE c LENGTH 16,
        "! DocumentReferenceID
        document_reference_id      TYPE c LENGTH 16,
        "! RecurringAccountingDocument
        recurring_accounting_docum TYPE c LENGTH 10,
        "! ReverseDocument
        reverse_document           TYPE c LENGTH 10,
        "! ReverseDocumentFiscalYear
        reverse_document_fiscal_ye TYPE c LENGTH 4,
        "! AccountingDocumentHeaderText
        accounting_document_header TYPE c LENGTH 25,
        "! ExchangeRate
        exchange_rate              TYPE p LENGTH 5 DECIMALS 5,
        "! BusinessTransactionType
        business_transaction_type  TYPE c LENGTH 4,
        "! BatchInputSession
        batch_input_session        TYPE c LENGTH 12,
        "! FinancialManagementArea
        financial_management_area  TYPE c LENGTH 4,
        "! ReversalIsPlanned
        reversal_is_planned        TYPE abap_bool,
        "! PlannedReversalDate
        planned_reversal_date      TYPE datn,
        "! TaxIsCalculatedAutomatically
        tax_is_calculated_automati TYPE abap_bool,
        "! TaxBaseAmountIsNetAmount
        tax_base_amount_is_net_amo TYPE abap_bool,
        "! SourceCompanyCode
        source_company_code        TYPE c LENGTH 4,
        "! LogicalSystem
        logical_system             TYPE c LENGTH 10,
        "! TaxExchangeRate
        tax_exchange_rate          TYPE p LENGTH 5 DECIMALS 5,
        "! ReversalReason
        reversal_reason            TYPE c LENGTH 2,
        "! Branch
        branch                     TYPE c LENGTH 4,
        "! Reference1InDocumentHeader
        reference_1_in_document_he TYPE c LENGTH 20,
        "! Reference2InDocumentHeader
        reference_2_in_document_he TYPE c LENGTH 20,
        "! InvoiceReceiptDate
        invoice_receipt_date       TYPE datn,
        "! Ledger
        ledger                     TYPE c LENGTH 2,
        "! LedgerGroup
        ledger_group               TYPE c LENGTH 4,
        "! AlternativeReferenceDocument
        alternative_reference_docu TYPE c LENGTH 26,
        "! TaxReportingDate
        tax_reporting_date         TYPE datn,
        "! AccountingDocumentClass
        accounting_document_class  TYPE c LENGTH 6,
        "! ExchangeRateType
        exchange_rate_type         TYPE c LENGTH 4,
        "! LatePaymentReason
        late_payment_reason        TYPE c LENGTH 2,
        "! SalesDocumentCondition
        sales_document_condition   TYPE c LENGTH 10,
        "! IsReversal
        is_reversal                TYPE abap_bool,
        "! IsReversed
        is_reversed                TYPE abap_bool,
      END OF tys_a_operational_acctg_doc__2,
      "! <p class="shorttext synchronized">List of A_OperationalAcctgDocItemCubeType</p>
      tyt_a_operational_acctg_doc__2 TYPE STANDARD TABLE OF tys_a_operational_acctg_doc__2 WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! A_OperationalAcctgDocItemCube
        "! <br/> Collection of type 'A_OperationalAcctgDocItemCubeType'
        a_operational_acctg_doc_it TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_OPERATIONAL_ACCTG_DOC_IT',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for A_OperationalAcctgDocItemCubeType</p>
        "! See also structure type {@link ..tys_a_operational_acctg_doc__2}
        BEGIN OF a_operational_acctg_doc__2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_operational_acctg_doc__2,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.

