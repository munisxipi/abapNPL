class ZCO_LENGTH_UNIT_SOAP definition
  public
  inheriting from CL_PROXY_CLIENT
  create public .

public section.

  methods CHANGE_LENGTH_UNIT
    importing
      !INPUT type ZCHANGE_LENGTH_UNIT_SOAP_IN
    exporting
      !OUTPUT type ZCHANGE_LENGTH_UNIT_SOAP_OUT
    raising
      CX_AI_SYSTEM_FAULT .
  methods CONSTRUCTOR
    importing
      !LOGICAL_PORT_NAME type PRX_LOGICAL_PORT_NAME optional
    raising
      CX_AI_SYSTEM_FAULT .
protected section.
private section.
ENDCLASS.



CLASS ZCO_LENGTH_UNIT_SOAP IMPLEMENTATION.


  method CHANGE_LENGTH_UNIT.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'CHANGE_LENGTH_UNIT'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method CONSTRUCTOR.

  super->constructor(
    class_name          = 'ZCO_LENGTH_UNIT_SOAP'
    logical_port_name   = logical_port_name
  ).

  endmethod.
ENDCLASS.
