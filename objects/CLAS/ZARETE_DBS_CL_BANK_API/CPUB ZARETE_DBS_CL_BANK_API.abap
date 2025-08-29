CLASS zarete_dbs_cl_bank_api DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .

    DATA:
      gt_business_data TYPE TABLE OF zarete_dbs_sc_bank_api=>tys_bank_address_type,
      go_http_client   TYPE REF TO if_web_http_client,
      go_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
      go_request       TYPE REF TO /iwbep/if_cp_request_read_list,
      go_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

    METHODS: constructor,
      get_banks  IMPORTING
                   it_filter        TYPE if_rap_query_filter=>tt_name_range_pairs OPTIONAL
                 EXPORTING
                   et_business_data LIKE gt_business_data .