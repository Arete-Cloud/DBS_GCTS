projection;
strict ( 2 );

define behavior for ZARETE_DBS_PV_INVOICE_001 //alias <alias_name>
{
  use update;

  use action send_invoice;
  use action delete_invoice;
  use action accounting_document;
}