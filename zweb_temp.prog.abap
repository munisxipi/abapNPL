*&---------------------------------------------------------------------*
*& Report ZWEB_TEMP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZWEB_TEMP.

*& Report  ZTEST_PROXY

 "Data Declarations
 DATA: cl_proxy TYPE REF TO ZCO_LENGTH_UNIT_SOAP, " Proxy Class
       data_in  TYPE ZCHANGE_LENGTH_UNIT_SOAP_IN, " Proxy Input
       data_out TYPE ZCHANGE_LENGTH_UNIT_SOAP_OUT, " Proxy Output
       fault    TYPE REF TO cx_root. " Generic Fault
 "Instantiate the proxy class providing the Logical port name
 CREATE OBJECT cl_proxy EXPORTING LOGICAL_PORT_NAME = 'ZWEB_TEST'.
" Set Fixed Values
 data_in-LENGTH_VALUE = '32'.
 data_in-FROM_LENGTH_UNIT = 'Inches'.
 data_in-TO_LENGTH_UNIT  = 'Millimeters'.
 TRY .
   cl_proxy->CHANGE_LENGTH_UNIT( EXPORTING INPUT = data_in
                                 IMPORTING OUTPUT = data_out ).
 CATCH cx_root INTO fault.
 " Here is the place for error handling
   BREAK-POINT.
 ENDTRY.
"  Here the structure data_out is filled case none Exceptions occurs
 BREAK-POINT.

 write 'output is' .
 write data_out-CHANGE_LENGTH_UNIT_RESULT.
