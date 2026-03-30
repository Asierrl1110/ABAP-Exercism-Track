CLASS zcl_hamming DEFINITION 
  PUBLIC
  FINAL
  CREATE PUBLIC.
  
  PUBLIC SECTION.
    METHODS hamming_distance
      IMPORTING
        first_strand  TYPE string
        second_strand TYPE string
      RETURNING
        VALUE(result) TYPE i
      RAISING
        cx_parameter_invalid.
ENDCLASS.

CLASS zcl_hamming IMPLEMENTATION.

  METHOD hamming_distance.

    " Si ambas strand son vacias, entonces el result pasa a ser 0 y se finaliza el método
    IF first_strand IS INITIAL AND second_strand IS INITIAL.
        result = 0.
        RETURN.
      ENDIF.
  
    " Si alguna de las strand esta vacia o la longitud de ambas strand son distintas,
    " se lanza una excepción
    IF first_strand IS INITIAL OR second_strand IS INITIAL OR 
    strlen( first_strand ) <> strlen( second_strand ).
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

          " Variable que almacena la longitud de las strand
    DATA: lv_len     TYPE i,
          " Variable que almacena el indice del bucle
          lv_index   TYPE i,
          " Variable que almacena el DNA de la primera strand
          lv_strand1 TYPE string,
          " Variable que almacena el DNA de la segunda strand
          lv_strand2 TYPE string.

    " Almacenamos la longitud de una strand
    lv_len = strlen( first_strand ).

    " Bucle con el número de iteraciones de la longitud del strand
    DO lv_len TIMES.

      " Cogemos el indice
      lv_index = sy-index - 1.

      " Cogemos el DNA correspondiente de cada strand
      lv_strand1 = first_strand+lv_index(1).
      lv_strand2 = second_strand+lv_index(1).

      " Si el DNA de cada uno es distinto, sumamos 1 al result
      IF lv_strand1 <> lv_strand2.
        result = result + 1.
      ENDIF.
      
    ENDDO.
    
  ENDMETHOD.

ENDCLASS.