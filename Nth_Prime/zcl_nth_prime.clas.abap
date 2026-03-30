CLASS zcl_nth_prime DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS prime
      IMPORTING
        input         TYPE i
      RETURNING
        VALUE(result) TYPE i
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_nth_prime IMPLEMENTATION.
  METHOD prime.
    " En caso de que el input sea 0, lanzamos una excepción
    IF input = 0.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    DATA: lv_count TYPE i, " Número de números primos contados
          lv_limit TYPE i, " Limite de divisores para comprobar si es primo o no
          lv_number TYPE i VALUE 1, " Número del bucle para comprobar si es primo o no
          lv_divisor TYPE i, " Indice de iteración del bucle (divisor)
          lv_is_prime TYPE abap_bool. " Booleano para saber si es primo o no

    WHILE lv_count < input.
      " Empezamos en 2
      lv_number = lv_number + 1.

      " Asignamos que el número es primo
      lv_is_prime = abap_true.

      " Asignamos el limite de divisores haciendo la raiz cuadrada del número
      lv_limit = sqrt( lv_number ).

      " Bucle el número de divisores
      DO lv_limit TIMES.
        " Empezamos el dos el divisor
        lv_divisor = sy-index + 1.

        " En caso de que el resto sea 0 y no sea la división sobre si mismo, no es primo
        IF lv_number MOD lv_divisor = 0 AND lv_number <> lv_divisor.
          lv_is_prime = abap_false.
          EXIT.
        ENDIF.
      ENDDO.

      " Si es primo, incrementamos en uno el contador
      IF lv_is_prime = abap_true.
        lv_count = lv_count + 1.
      ENDIF.
      
    ENDWHILE.

    " Asignamos el número primo correspondiente al input introducido por parámetro
    " al returning
    result = lv_number.
    
  ENDMETHOD.


ENDCLASS.