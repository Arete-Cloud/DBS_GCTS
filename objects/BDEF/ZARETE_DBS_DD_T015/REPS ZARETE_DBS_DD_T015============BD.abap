managed implementation in class zbp_arete_dbs_dd_t015 unique;
strict ( 2 );

define behavior for ZARETE_DBS_DD_T015 //alias <alias_name>
persistent table zarete_dbs_t015
lock master
authorization master ( global )
//etag master <field_name>
{
  create ( authorization : global );
  update;
  delete;
  field ( readonly ) Uuid;
  field ( numbering : managed )
  uuid;

  mapping for zarete_dbs_t015
    {
      Uuid               = uuid;
      InvoiceNumber      = invoice_number;
      Id                 = id;
      DbsInvoiceId       = dbs_invoice_id;
      ScenarioType       = scenario_type;
      Statu              = statu;
      AccountingDocument = accounting_document;
      CompanyCode        = company_code;
      FiscalYear         = fiscal_year;
      TransactionDate    = transaction_date;
      FiAccount          = fi_account;
      DbsAccountId       = dbs_account_id;
      IsCancelled        = is_cancelled;
      AccError           = acc_error;
      CreatedBy          = created_by;
      CreatedAt          = created_at;
      LastChangedAt      = last_changed_at;
      LocalLastChangedBy = local_last_changed_by;
      LocalLastChangedAt = local_last_changed_at;
    }

}