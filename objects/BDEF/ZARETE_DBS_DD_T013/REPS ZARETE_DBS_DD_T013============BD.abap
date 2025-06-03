managed implementation in class zbp_arete_dbs_dd_t013 unique;
strict ( 2 );

define behavior for ZARETE_DBS_DD_T013 alias t013
persistent table zarete_dbs_t013
etag master LocalLastChangedAt
lock master
authorization master ( global )
//etag master <field_name>
{

  field ( mandatory : create )
  Identifier,
  Limitid;

  field ( readonly )
  CreatedBy,
  CreatedAt,
  LastChangedAt,
  LocalLastChangedBy,
  LocalLastChangedAt;

  field ( readonly : update )
  Identifier,
  Limitid;

  create;
  update;
  delete;

  mapping for zarete_dbs_t013
    {
      Activelimit          = activelimit;
      Bankcode             = bankcode;
      Bankname             = bankname;
      Currencycode         = currencycode;
      Identifier           = identifier;
      Limit                = limit;
      Limitid              = limitid;
      Partycode            = partycode;
      Partytaxnumber       = partytaxnumber;
      Partytitle           = partytitle;
      Pendinginvoiceamount = pendinginvoiceamount;
      Pendinginvoicecount  = pendinginvoicecount;
      CreatedBy            = created_by;
      CreatedAt            = created_at;
      LastChangedAt        = last_changed_at;
      LocalLastChangedBy   = local_last_changed_by;
      LocalLastChangedAt   = local_last_changed_at;
    }
}