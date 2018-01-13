*&---------------------------------------------------------------------*
*& Report ZCL_MEHODS01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCL_MEHODS01.

CLASS c1 DEFINITION.
  PUBLIC SECTION.

   methods dis.

ENDCLASS.
CLASS c1 IMPLEMENTATION.

  METHOD dis.

    write 'in dis method.'.

  ENDMETHOD.
ENDCLASS.


data _c1 type ref to c1.


start-of-SELECTION.

create object _c1.

call method _c1->dis.
