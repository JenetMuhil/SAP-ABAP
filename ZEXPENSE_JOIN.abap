REPORT zexpense_join.

DATA: lt_result TYPE TABLE OF zexpense.

SELECT a~user_name,
       b~category,
       b~amount,
       b~payment_mode
FROM zuser_info AS a
INNER JOIN zexpense AS b
ON a~user_id = b~user_id
INTO TABLE @DATA(lt_join).

LOOP AT lt_join INTO DATA(ls_join).

WRITE: /
ls_join-user_name,
ls_join-category,
ls_join-amount,
ls_join-payment_mode.

ENDLOOP.
