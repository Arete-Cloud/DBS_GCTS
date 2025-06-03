  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define A_GLAccountInChartOfAccountsType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_glaccount_in_chart_of__2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_GLAccountTextType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_glaccount_text_type RAISING /iwbep/cx_gateway.
