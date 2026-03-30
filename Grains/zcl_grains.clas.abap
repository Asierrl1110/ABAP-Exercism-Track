CLASS zcl_grains DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES type_result TYPE p LENGTH 16 DECIMALS 0.
    METHODS square
      IMPORTING
        input         TYPE i
      RETURNING
        VALUE(result) TYPE type_result
      RAISING
        cx_parameter_invalid.
    METHODS total
      RETURNING
        VALUE(result) TYPE type_result
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_grains IMPLEMENTATION.
  METHOD square.
  
    " En caso de que el input sea igual a 0 o menor o superior a 64, se lanza una excepción
    IF input <= 0 OR input > 64.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ELSE.
      " El result es 2 elevado al input menos 1
      result = 2 ** ( input - 1 ).
    ENDIF.
    
  ENDMETHOD.

  METHOD total.
    " El total es 2 elevado a 64 (64 casillas del ajedrez)
    result = 2 ** 64.
  ENDMETHOD.

ENDCLASS.