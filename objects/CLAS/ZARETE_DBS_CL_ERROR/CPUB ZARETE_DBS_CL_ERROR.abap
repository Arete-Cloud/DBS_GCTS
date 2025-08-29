CLASS zarete_dbs_cl_error DEFINITION

  PUBLIC
  INHERITING FROM cx_rap_query_provider
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message.

    METHODS constructor
      IMPORTING
        !msgid    TYPE symsgid
        !msgno    TYPE symsgno
        !previous TYPE REF TO cx_root OPTIONAL
        !iv_msg   TYPE string OPTIONAL.
