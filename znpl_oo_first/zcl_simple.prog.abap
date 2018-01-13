*&---------------------------------------------------------------------*
*& Report ZCL_SIMPLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCL_SIMPLE.


CLASS TEST DEFINITION.

  PUBLIC SECTION.
  METHODS dis.

ENDCLASS.

CLASS test IMPLEMENTATION.

  METHOD dis.
    WRITE 'class test'.

  ENDMETHOD.
ENDCLASS.

DATA _test TYPE REF TO test.



START-OF-SELECTION.
CREATE object _test.

CALL METHOD _test->dis.
