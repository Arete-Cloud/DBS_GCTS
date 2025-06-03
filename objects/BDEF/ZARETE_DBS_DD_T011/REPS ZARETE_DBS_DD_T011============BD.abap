managed implementation in class zbp_r_arete_dbs_t011 unique;
strict ( 2 );
define behavior for ZARETE_DBS_DD_T011
persistent table zarete_dbs_t011
etag master LocalLastChangedAt
lock master
authorization master ( global )

{
  field ( mandatory : create )
  FinteoStatusCode,
  FinteoBankCode;

  field ( readonly )
  CreatedBy,
  CreatedAt,
  LastChangedAt,
  LocalLastChangedBy,
  LocalLastChangedAt;

  field ( readonly : update )
  FinteoStatusCode,
  FinteoBankCode;

  create;
  update;
  delete;

  mapping for zarete_dbs_t011
    {
      FinteoStatusCode       = finteo_status_code;
      FinteoBankCode         = finteo_bank_code;
      FinteoStatusDefinition = finteo_status_definition;
      CreatedBy              = created_by;
      CreatedAt              = created_at;
      LastChangedAt          = last_changed_at;
      LocalLastChangedBy     = local_last_changed_by;
      LocalLastChangedAt     = local_last_changed_at;
    }
}