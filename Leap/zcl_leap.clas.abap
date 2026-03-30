CLASS zcl_leap DEFINITION PUBLIC
  FINAL
  CREATE PUBLIC.
  PUBLIC SECTION.
    METHODS leap
      IMPORTING
        year          TYPE i
      RETURNING
        VALUE(result) TYPE abap_bool.
ENDCLASS.

CLASS zcl_leap IMPLEMENTATION.

  METHOD leap.
    
    " Comprobamos que el año sea divisible entre 4
    IF year MOD 4 = 0.
      " Comprobamos que el año sea divisible entre 100
      IF year MOD 100 <> 0.
        " Bisiesto al ser divisible entre 4 y no divisible entre 100
        result = abap_true.
      ELSE.
        " En caso de que sea divisible entre 100, 
        " aún puede ser true si es divisible entre 400
        IF year MOD 400 = 0.
          " Bisiesto al ser divisible entre 4, entre 100 y entre 400
          result = abap_true.
        ELSE.
          " No bisiesto al ser divisible entre 4, entre 100 pero no entre 400
          result = abap_false.
        ENDIF.
      ENDIF.
    ELSE.
      " No bisiesto al no ser divisible entre 4
      result = abap_false.
    ENDIF.
    
  ENDMETHOD.

ENDCLASS.