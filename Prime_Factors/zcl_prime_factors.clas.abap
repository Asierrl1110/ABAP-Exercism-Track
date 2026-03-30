CLASS zcl_prime_factors DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS factors
      IMPORTING
        input         TYPE int8
      RETURNING
        VALUE(result) TYPE integertab.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_prime_factors IMPLEMENTATION.
  METHOD factors.

          " Variable para almacenar el número pasado por parámetro
    DATA: lv_number TYPE int8,
          " Variable para almacenar los divisores
          lv_divisor TYPE i VALUE 2.

    " Asignamos el valor pasado por parámetro
    lv_number = input.

    " Mientras que el número sea superior a 1, buscamos los divisores
    WHILE lv_number > 1.

      " Comprobamos si se puede hacer la división
      IF lv_number MOD lv_divisor = 0.
      
        " Guardamos el divisor
        APPEND lv_divisor TO result.

        " Dividimos el número
        lv_number = lv_number / lv_divisor.
        
      ELSE.
        " Probamos el siguiente divisor
        lv_divisor = lv_divisor + 1.
      ENDIF.

    ENDWHILE.
    
  ENDMETHOD.

ENDCLASS.