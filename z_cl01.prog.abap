*&---------------------------------------------------------------------*
*& Report Z_CL01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_CL01.

*&---------------------------------------------------------------------*
*& Report Z_CL1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_CL1.


CLASS HelloWorld DEFINITION.

  PUBLIC SECTION.

  METHODS dis.

ENDCLASS.

CLASS HelloWorld IMPLEMENTATION.

  method dis.

    write 'first oops program'.

   ENDMETHOD.


ENDCLASS.

CLASS main DEFINITION.

  "// All components defineted as public can be accessed inside and
  "// outside its own Class and its Subclasses
  PUBLIC SECTION.

  "//- Constructor definition ( We can only define the Instance and/or
  "// Static Constructor methods in PUBLIC sections )
  "//- Note the constructor is called automatically during de instance
  "// creation CREATE OBJECT <obj>.
  METHODS constructor IMPORTING i_value TYPE I.

  "// Instance methods
  METHODS GET EXPORTING e_value TYPE I.

  METHODS ADD.

  METHODS PRINT IMPORTING i_value TYPE I.

  "// All components defineted as protected can be accessed only inside
  "// and outside its own Class and its Subclasses
  PROTECTED SECTION.

  METHODS SET IMPORTING i_value TYPE I.

  "// All components defineted as protected can be accessed only inside
  "// its own Class
  PRIVATE SECTION.

  DATA COUNT TYPE I.

ENDCLASS.                    "main DEFINITION

CLASS main IMPLEMENTATION.

  METHOD constructor.

    "// For more informations about the statement 'ME' see the example
    "// created to explain the self-reference me
    CALL METHOD me->set
    EXPORTING
      i_value = i_value.

  ENDMETHOD.                    "constructor

  METHOD SET.
    MOVE i_value TO COUNT.
  ENDMETHOD.                    "set

  METHOD ADD.
    ADD 1 TO COUNT.
  ENDMETHOD.                    "add

  METHOD GET.
    MOVE COUNT TO e_value.
  ENDMETHOD.                    "get

  METHOD PRINT.
    WRITE:  / 'Value =',  i_value.
  ENDMETHOD.                    "print

ENDCLASS.                    "main IMPLEMENTATION



DATA object TYPE REF TO main.
DATA v_value TYPE I.

data _helloworld type ref to HelloWorld.


START-OF-SELECTION.

"//- Note the constructor is called automatically during de instance
"// creation CREATE OBJECT <obj>.
CREATE OBJECT object
EXPORTING
  i_value = 10.

* call 5 times the method object->add
DO 5 TIMES.
  CALL METHOD object->add.
ENDDO.

CALL METHOD object->get
IMPORTING
  e_value = v_value.

CALL METHOD object->print
EXPORTING
  i_value = v_value.


"===============================HelloWorld=========================================================

new-LINE.
create object _helloworld.

call method _helloworld->dis.


"====================================HelloWorld===============================================================
