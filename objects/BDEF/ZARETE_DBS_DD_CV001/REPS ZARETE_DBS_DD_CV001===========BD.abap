unmanaged implementation in class zbp_arete_dbs_dd_cv001 unique;
strict ( 2 );

define behavior for ZARETE_DBS_DD_CV001 //alias <alias_name>
//persistent table <???>
lock master
authorization master ( instance )
//etag master <field_name>
{
  field ( readonly ) PartyTaxNumber, Bankname;
}