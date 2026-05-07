REPORT zexpense_alv.

TYPE-POOLS: slis.

DATA: lt_expense TYPE TABLE OF zexpense,
      ls_fieldcat TYPE slis_fieldcat_alv,
      lt_fieldcat TYPE slis_t_fieldcat_alv.

SELECT * FROM zexpense
INTO TABLE lt_expense.

ls_fieldcat-fieldname = 'EXP_ID'.
ls_fieldcat-seltext_m = 'Expense ID'.
APPEND ls_fieldcat TO lt_fieldcat.

CLEAR ls_fieldcat.

ls_fieldcat-fieldname = 'CATEGORY'.
ls_fieldcat-seltext_m = 'Category'.
APPEND ls_fieldcat TO lt_fieldcat.

CLEAR ls_fieldcat.

ls_fieldcat-fieldname = 'AMOUNT'.
ls_fieldcat-seltext_m = 'Amount'.
APPEND ls_fieldcat TO lt_fieldcat.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
EXPORTING
  it_fieldcat = lt_fieldcat

TABLES
  t_outtab = lt_expense.
