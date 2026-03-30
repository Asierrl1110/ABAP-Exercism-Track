CLASS zcl_phone_number DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS clean
      IMPORTING
        !number       TYPE string
      RETURNING
        VALUE(result) TYPE string
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_phone_number IMPLEMENTATION.

  METHOD clean.

    " Eliminamos todos los caracteres del parámetro que no sean números
    REPLACE ALL OCCURRENCES OF REGEX '[^0-9]' IN number WITH ''.

    " Si la longitud del número es distinto a 10 u 11, se lanza una excepción
    IF strlen( number ) <> 10 AND strlen( number ) <> 11.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    " En caso de que la longitud del número sea 11, hay que comprobar si el primer número es 1
    " Si no es 1, entonces se lanza una excepción
    IF strlen( number ) = 11.
      IF number(1) = 1 .
        " En caso de que el primer número sea 1, se omite ese número y se cogen los 10 siguientes
        number = number+1(10).
      ELSE.
        RAISE EXCEPTION TYPE cx_parameter_invalid.
      ENDIF.
    ENDIF.

    " Si el primer número no esta entre 2 y 9, se lanza una excepción
    IF number(1) < '2' OR number(1) > '9'.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    " Si el cuarto número no esta entre 2 y 9, se lanza una excepción
    IF number+3(1) < '2' OR number+3(1) > '9'.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    " Si se superan todas las validaciones, el número parseado se asigna al result
    result = number.
    
  ENDMETHOD.

ENDCLASS.