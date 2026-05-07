REPORT zexpense_tracker.

TABLES: zexpense.

DATA: lt_expense TYPE TABLE OF zexpense,
      ls_expense TYPE zexpense,
      lv_total   TYPE p DECIMALS 2.

PARAMETERS:
 p_expid TYPE numc5,
 p_user  TYPE ze_userid,
 p_cat   TYPE ze_category,
 p_amt   TYPE ze_amount,
 p_pay   TYPE ze_paymode,
 p_date  TYPE dats.

START-OF-SELECTION.

ls_expense-exp_id       = p_expid.
ls_expense-user_id      = p_user.
ls_expense-category     = p_cat.
ls_expense-amount       = p_amt.
ls_expense-payment_mode = p_pay.
ls_expense-exp_date     = p_date.

INSERT zexpense FROM ls_expense.

IF sy-subrc = 0.
  WRITE: / 'Expense Added Successfully'.
ELSE.
  WRITE: / 'Error While Adding Expense'.
ENDIF.

SELECT * FROM zexpense
INTO TABLE lt_expense.

WRITE: / '-----------------------------'.
WRITE: / 'Expense Records'.
WRITE: / '-----------------------------'.

LOOP AT lt_expense INTO ls_expense.

  WRITE: /
  ls_expense-exp_id,
  ls_expense-user_id,
  ls_expense-category,
  ls_expense-amount,
  ls_expense-payment_mode,
  ls_expense-exp_date.

  lv_total = lv_total + ls_expense-amount.

ENDLOOP.

WRITE: / '-----------------------------'.
WRITE: / 'Total Expense:', lv_total.
