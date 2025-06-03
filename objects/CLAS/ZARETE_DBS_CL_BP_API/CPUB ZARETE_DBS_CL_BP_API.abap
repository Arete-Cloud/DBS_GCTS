CLASS zarete_dbs_cl_bp_api DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   INTERFACES if_rap_query_provider .


    TYPES: BEGIN OF ty_data .
             INCLUDE TYPE zarete_dbs_sc_bp_api=>tys_a_business_partner_type .
    TYPES:   to_business_partner_tax TYPE STANDARD TABLE OF zarete_dbs_sc_bp_api=>tys_a_business_partner_tax_n_2 WITH EMPTY KEY.

    TYPES END OF ty_data.


    DATA:
      gt_business_data TYPE TABLE OF ty_data,
      go_http_client   TYPE REF TO if_web_http_client,
      go_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
      go_request       TYPE REF TO /iwbep/if_cp_request_read_list,
      go_response      TYPE REF TO /iwbep/if_cp_response_read_lst,
      go_destination   TYPE REF TO if_http_destination.

    METHODS: constructor,

      get_taxnumber  IMPORTING
                    it_filter        TYPE if_rap_query_filter=>tt_name_range_pairs OPTIONAL
                  EXPORTING
                    et_business_data LIKE gt_business_data .
