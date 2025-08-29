CLASS zarete_dbs_cl_finteo_lmt DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .

    METHODS fill_t013
      IMPORTING
        it_limit        TYPE zarete_dbs_sc_finteo_api=>ty_limit
        iv_company_code TYPE zarete_dbs_t014-company_code .