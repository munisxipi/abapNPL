*&---------------------------------------------------------------------*
*& Report ZCL_CONSTRUCTOR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCL_CONSTRUCTOR.

CLASS cons DEFINITION.
   PUBLIC SECTION.
     METHODS: method1, constructor.
 ENDCLASS.

 CLASS cons IMPLEMENTATION.
   METHOD method1.
     WRITE: / 'This is Method1'.
   ENDMETHOD.

   METHOD constructor.
     WRITE: / 'Constructor Triggered'.
   ENDMETHOD.
 ENDCLASS.

 START-OF-SELECTION.
   DATA consobj TYPE REF TO cons .
 " break-point.
   CREATE OBJECT consobj.
