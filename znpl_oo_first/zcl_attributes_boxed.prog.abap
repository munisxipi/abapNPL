*&---------------------------------------------------------------------*
*& Report ZCL_ATTRIBUTES_BOXED
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCL_ATTRIBUTES_BOXED.

CLASS c1 DEFINITION.
  PUBLIC SECTION.
  TYPES: BEGIN OF t_struc,
    comp1 TYPE C LENGTH 10 ,
    comp2 TYPE n LENGTH 10 ,
  END OF t_struc.

  CLASS-DATA struc3 TYPE t_struc BOXED.
  DATA       struc4 TYPE t100    BOXED.


  METHODS dis.

  PRIVATE SECTION.
  CLASS-DATA struc1 TYPE t_struc BOXED.
  DATA       struc2 TYPE t100    BOXED.


ENDCLASS.

CLASS c1 IMPLEMENTATION.

  METHOD dis.
    WRITE / 'via method accesing'.
    new-LINE.
    WRITE struc1-COMP1.
    WRITE struc1-COMP2.

  ENDMETHOD.

ENDCLASS.

DATA _c1 TYPE REF TO c1.


START-OF-SELECTION.

WRITE / 'directly accesing'.

WRITE c1=>struc3-COMP1.
WRITE c1=>struc3-COMP2.

CREATE object _c1.

CALL METHOD _c1->dis.
