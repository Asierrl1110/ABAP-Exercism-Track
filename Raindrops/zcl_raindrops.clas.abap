CLASS zcl_raindrops DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS raindrops
      IMPORTING
        input         TYPE i
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_raindrops IMPLEMENTATION.

  METHOD raindrops.

    " Si el input es divisible entre 3, añadimos al result la palabra 'Pling'
    IF input MOD 3 = 0.
      result = result && 'Pling'.
    ENDIF.

    " Si el input es divisible entre 5, añadimos al result la palabra 'Plang'
    IF input MOD 5 = 0.
      result = result && 'Plang'.
    ENDIF.

    " Si el input es divisible entre 7, añadimos al result la palabra 'Plong'
    IF input MOD 7 = 0.
      result = result && 'Plong'.
    ENDIF.

    " Si el result es initial, entonces se añade el input al result
    IF result IS INITIAL.
      result = input.
    ENDIF.
    
  ENDMETHOD.

ENDCLASS.