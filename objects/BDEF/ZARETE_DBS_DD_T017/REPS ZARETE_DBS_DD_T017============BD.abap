managed implementation in class zbp_arete_dbs_dd_t017 unique;
strict ( 2 );

define behavior for ZARETE_DBS_DD_T017 //alias <alias_name>
persistent table zarete_dbs_t017
lock master
authorization master ( global )
//etag master <field_name>
{
  create ( authorization : global );
  update;
  delete;
  //  field ( readonly ) CompanyCode, FiscalYear, AccountingDocument, AccountingDocumentItem, DocumentReferenceId;

  mapping for zarete_dbs_t017
    {
      CompanyCode             = company_code;
      FiscalYear              = fiscal_year;
      AccountingDocument      = accounting_document;
      AccountingDocumentItem  = accounting_document_item;
      DocumentReferenceId     = document_reference_id;
      DebitCreditCode         = debit_credit_code;
      DocumentItemText        = document_item_text;
      Customer                = customer;
      CustomerName            = customer_name;
      PostingDate             = posting_date;
      DocumentDate            = document_date;
      NetDueDate              = net_due_date;
      ValueDate               = value_date;
      HouseBank               = house_bank;
      AccountingDocumentType  = accounting_document_type;
      AmountInTransactionCurr = amount_in_transaction_curr;
      TransactionCurrency     = transaction_currency;
      AssignmentReference     = assignment_reference;
      CreatedBy               = created_by;
      CreatedAt               = created_at;
      LastChangedAt           = last_changed_at;
      LocalLastChangedBy      = local_last_changed_by;
      LocalLastChangedAt      = local_last_changed_at;
    }
}