  PRIVATE SECTION.

   DATA:
      gt_business_data TYPE TABLE OF zarete_dbs_sc_doc_read_api=>tys_a_operational_acctg_doc__2,
      go_http_client   TYPE REF TO if_web_http_client,
      go_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
      go_request       TYPE REF TO /iwbep/if_cp_request_read_list,
      go_response      TYPE REF TO /iwbep/if_cp_response_read_lst.