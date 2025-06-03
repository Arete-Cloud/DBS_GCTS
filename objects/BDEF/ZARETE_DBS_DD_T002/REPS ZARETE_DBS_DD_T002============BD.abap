managed implementation in class ZBP_R_ARETE_DBS_T002 unique;
strict ( 2 );
define behavior for ZARETE_DBS_DD_T002
persistent table zarete_dbs_t002
etag master LocalLastChangedAt
lock master
authorization master ( global )

{
  field ( mandatory : create )
  FinteoBankCode,
  FinteoStatusCode,
  SapStatusCode,
  StatusIcon;

  field ( readonly )
  CreatedBy,
  CreatedAt,
  LastChangedAt,
  LocalLastChangedBy,
  LocalLastChangedAt;

  field ( readonly : update )
  FinteoBankCode,
  FinteoStatusCode,
  SapStatusCode,
  StatusIcon;


  create;
    update;
  delete;

  mapping for zarete_dbs_t002
    {
      FinteoBankCode        = finteo_bank_code;
      FinteoStatusCode      = finteo_status_code;
      FinteoStatusDefinition = finteo_status_definition;
      SapStatusCode         = sap_status_code;
      SapStatusDefinition    = sap_status_definition;
      StatusIcon            = status_icon;
      CreatedBy             = created_by;
      CreatedAt             = created_at;
      LastChangedAt         = last_changed_at;
      LocalLastChangedBy    = local_last_changed_by;
      LocalLastChangedAt    = local_last_changed_at;
    }
}