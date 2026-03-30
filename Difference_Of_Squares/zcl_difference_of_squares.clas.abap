CLASS zcl_difference_of_squares DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      ret_difference_of_squares IMPORTING num         TYPE i
                                RETURNING VALUE(diff) TYPE i,
      ret_sum_of_squares        IMPORTING num                   TYPE i
                                RETURNING VALUE(sum_of_squares) TYPE i,
      ret_square_of_sum         IMPORTING num                  TYPE i
                                RETURNING VALUE(square_of_sum) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_difference_of_squares IMPLEMENTATION.

  METHOD ret_difference_of_squares.

          " Variable que almacena la suma de los cuadrados
    DATA: sum_of_squares TYPE i,
          " Variable que almacena el cuadrado de la suma
          square_of_sum  TYPE i.

    " Cogemos la suma de los cuadrados
    sum_of_squares = me->ret_sum_of_squares( num ).

    " Cogemos el cuadrado de la suma
    square_of_sum = me->ret_square_of_sum( num ).

    " Restamos y guardamos en la diff
    diff = square_of_sum - sum_of_squares.
    
  ENDMETHOD.

  METHOD ret_sum_of_squares.

    " Bucle con número de iteraciones del num pasado por parámetro
    DO num TIMES.
      " Sumamos el índice al cuadrado
      sum_of_squares = sum_of_squares + sy-index ** 2. 
    ENDDO.
    
  ENDMETHOD.

  METHOD ret_square_of_sum.

    " Bucle con número de iteraciones del num pasado por parámetro
    DO num TIMES.
      " Sumamos el indice
      square_of_sum = square_of_sum + sy-index.
    ENDDO.

    " Elevamos al cuadrado
    square_of_sum = square_of_sum ** 2.
    
  ENDMETHOD.
  
ENDCLASS.