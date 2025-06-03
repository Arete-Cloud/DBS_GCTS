managed implementation in class zbp_arete_dbs_dd_t012 unique;
strict ( 2 );

define behavior for ZARETE_DBS_DD_T012 alias t012
persistent table zarete_dbs_t012
lock master
authorization master ( global )
//etag master <field_name>
{

  field ( readonly : update )
  CompanyIdentifier,
  LimitId;


  update;
  delete;

  mapping for zarete_dbs_t012
    {
      BpNo               = bp_no;
      BpTaxNumber        = bp_tax_number;
      CompanyBankCode    = company_bank_code;
      CompanyCode        = company_code;
      CompanyIdentifier  = company_identifier;
      LimitId            = limit_id;
      Glaccount          = glaccount;
      HouseBank          = house_bank;
      HouseBankAccount   = house_bank_account;

    }



}