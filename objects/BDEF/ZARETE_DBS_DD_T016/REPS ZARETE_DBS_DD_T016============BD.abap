managed implementation in class zbp_arete_dbs_dd_t016 unique;
strict ( 2 );

define behavior for ZARETE_DBS_DD_T016 //alias <alias_name>
persistent table zarete_dbs_t016
lock master
authorization master ( global )
//etag master <field_name>
{
  create ( authorization : global );
  update;
  delete;
  //  field ( readonly ) Identifier, DbsInvoiceId;

  mapping for zarete_dbs_t016
    {
      Identifier                  = identifier;
      DbsInvoiceId                = dbs_invoice_id;
      Id                          = id;
      Amount                      = amount;
      DeletedAmount               = deleted_amount;
      CurrencyCode                = currency_code;
      DueDate                     = due_date;
      InvoiceNumber               = invoice_number;
      PartialInvoiceNumber        = partial_invoice_number;
      InvoiceAmountDue            = invoice_amount_due;
      LastPaymentDate             = last_payment_date;
      PartialGuaranteedAmount     = partial_guaranteed_amount;
      AmountRemainingBeforePaymen = amount_remaining_before_paymen;
      PaymentDescription          = payment_description;
      StatusCode                  = status_code;
      StatusDescription           = status_description;
      TransactionDate             = transaction_date;
      DbsAccountId                = dbs_account_id;
      PartyCode                   = party_code;
      PartyTitle                  = party_title;
      PartyTaxNumber              = party_tax_number;
      BankCode                    = bank_code;
      BankName                    = bank_name;
      CreatedBy                   = created_by;
      CreatedAt                   = created_at;
      LastChangedAt               = last_changed_at;
      LocalLastChangedBy          = local_last_changed_by;
      LocalLastChangedAt          = local_last_changed_at;
    }
}