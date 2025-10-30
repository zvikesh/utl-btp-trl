CLASS zvks_cl_temp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zvks_cl_temp IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lo_class) = xco_cp_abap=>class( 'ZVKS_CX_SY_DYN_TEXT').

  ENDMETHOD.
ENDCLASS.
