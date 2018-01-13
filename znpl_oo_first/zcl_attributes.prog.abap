*&---------------------------------------------------------------------*
*& Report ZCL_ATTRIBUTES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCL_ATTRIBUTES.


CLASS c1 DEFINITION.
  PUBLIC SECTION.
  CLASS-DATA TEXT TYPE string VALUE `Static data`.
  CLASS-DATA num TYPE I VALUE 100.
  CLASS-DATA DATE TYPE datum VALUE IS INITIAL.

  DATA: TEXT1 TYPE string VALUE `Static data`,
        num1 TYPE I VALUE 100,
        DATE1 TYPE datum VALUE IS INITIAL.

  METHODS dis.

ENDCLASS.

CLASS c1 IMPLEMENTATION.

  METHOD dis.

    WRITE text1.
  ENDMETHOD.
ENDCLASS.

CLASS c2 DEFINITION.
  PRIVATE SECTION.
  CLASS-DATA TEXT TYPE string VALUE `non static data`.
  CLASS-DATA num TYPE I VALUE 100.
  CLASS-DATA DATE TYPE datum VALUE IS INITIAL.

ENDCLASS.

CLASS c2 IMPLEMENTATION.

ENDCLASS.



START-OF-SELECTION.

DATA obj_c1 TYPE REF TO c1.


"write c1=>text.

"cl_demo_output=>display_text( c1=>text ). "does not matter where you place this statement. this will be displyaed first.


"below staments wont work
*CL_DEMO_OUTPUT=>DISPLAY( C2=>TEXT ).
*CL_DEMO_OUTPUT=>DISPLAY( C2=>NUM ).
*CL_DEMO_OUTPUT=>DISPLAY( C2=>DATE ).

CREATE object obj_c1.

  "using method

  CALL METHOD obj_c1->dis.

  "directly accessing the variable using object reference
  WRITE obj_c1->text1.

  cl_demo_output=>display( c1=>text ).
  cl_demo_output=>display( c1=>num ).
  cl_demo_output=>display( c1=>date ).
