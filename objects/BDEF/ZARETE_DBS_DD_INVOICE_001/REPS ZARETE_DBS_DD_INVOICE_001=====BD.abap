unmanaged implementation in class zbp_arete_dbs_dd_invoice_001 unique;
//strict ( 2 );

define behavior for ZARETE_DBS_DD_INVOICE_001 //alias <alias_name>
//late numbering
lock master
authorization master ( global )
//etag master <field_name>
{
  //  create ( authorization : global );
  update;
  //  delete;
  //  field ( readonly ) Id, InvoiceNumber;

  //  action send_invoice deep parameter ZARETE_DBS_DD_T020 deep result [0..1] ZARETE_DBS_DD_T022;
  action send_invoice parameter ZARETE_DBS_DD_T029 result [0..1] ZARETE_DBS_DD_T029;
  //  action send_invoice result [1] $self;
  action delete_invoice parameter ZARETE_DBS_DD_T029 result [0..1] ZARETE_DBS_DD_T029;
  action accounting_document parameter ZARETE_DBS_DD_T029 result [0..1] ZARETE_DBS_DD_T029;

}