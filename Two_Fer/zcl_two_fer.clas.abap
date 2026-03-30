CLASS zcl_two_fer DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS two_fer
      IMPORTING
        input         TYPE string OPTIONAL
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_two_fer IMPLEMENTATION.

  METHOD two_fer.
  
    " En caso de que no se pase input, entonces asignamos un valor por defecto al result
    IF input IS INITIAL.
      result = 'One for you, one for me.'.
    ELSE.
      " Concatenamos al result la cadena con el input pasado por parámetro
      CONCATENATE 'One for' input INTO result SEPARATED BY space.
      CONCATENATE result ', one for me.' INTO result.
    ENDIF.
    
  ENDMETHOD.

ENDCLASS.