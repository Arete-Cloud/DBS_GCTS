unmanaged implementation in class zbp_arete_dbs_dd_t027 unique;
strict ( 2 ); //Uncomment this line in order to enable strict mode 2. The strict mode has two variants (strict(1), strict(2)) and is prerequisite to be future proof regarding syntax and to be able to release your BO.

define behavior for ZARETE_DBS_DD_T027 //alias <alias_name>
//late numbering
lock master
authorization master ( global )
//etag master <field_name>
{
  create ( authorization : global );
  update;
  delete;
  //  field ( readonly:create ) request_time;

  association _invoices { create; }
}


define behavior for ZARETE_DBS_DD_T024 //alias <alias_name>
//late numbering
lock dependent
authorization master ( global )
//etag master <field_name>
{
  create ( authorization : global );
  update;
  delete;
  //  field ( readonly )  request_time;
  field ( readonly : update ) request_time;

  association _header;
}