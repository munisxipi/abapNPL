*&---------------------------------------------------------------------*
*& Report zcl_staticmethod
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcl_staticmethod.

data x type i value 10012.
data y type i value 101.
data z type i value 1022.
data a type i value 100.
data b type i value 100.

if x > y.
write 'x is great than y'.

endif.

new-line.

if x > z.

write 'x is greater than z'.

endif.
