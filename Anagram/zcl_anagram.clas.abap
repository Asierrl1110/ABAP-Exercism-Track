CLASS zcl_anagram DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS anagram
      IMPORTING
        input         TYPE string
        candidates    TYPE string_table
      RETURNING
        VALUE(result) TYPE string_table.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_anagram IMPLEMENTATION.
  METHOD anagram.

          " Tabla para almacenar los caracteres del input
    DATA: lt_input TYPE STANDARD TABLE OF c,
          " Tabla para almacenar los caracteres de cada candidato
          lt_candidate TYPE STANDARD TABLE OF c,
          " Variable para almacenar el indice de los bucles
          lv_index TYPE i,
          " Variable para almacenar un caracter
          lv_caracter TYPE c,
          " Variable para almacenar una copia del input
          lv_input TYPE string,
          " Variable para almacenar una copia del candidato
          lv_candidate TYPE string.

    " Asignamos el input a la variable auxiliar
    lv_input = input.

    " Pasamos el input a minúsculas
    TRANSLATE lv_input TO LOWER CASE.

    " Recorremos todo el input para almacenar sus caracteres en la tabla interna
    DO strlen( lv_input ) TIMES.
      lv_index = sy-index - 1.
      lv_caracter = lv_input+lv_index(1).
      APPEND lv_caracter TO lt_input.
    ENDDO.

    " Ordenamos la tabla de caracteres de input de manera ascendente
    SORT lt_input ASCENDING.

    " Recorremos todos los candidatos para ver cuales son anagram
    LOOP AT candidates INTO DATA(lv_candidate_original).

      " Limpiamos la tabla de letras del candidate
      CLEAR lt_candidate.

      " Asignamos el candidate a la variable auxiliar
      lv_candidate = lv_candidate_original.

      " Pasamos el candidate a minúsculas
      TRANSLATE lv_candidate TO LOWER CASE.

      " Si el candidate es igual al input, ignoramos y pasamos a la siguiente iteración
      IF lv_candidate = lv_input.
        CONTINUE.
      ENDIF.

      " Recorremos todo el candidate para almacenar sus caracteres en la tabla interna
      DO strlen( lv_candidate ) TIMES.
        lv_index = sy-index - 1.
        lv_caracter = lv_candidate+lv_index(1).
        APPEND lv_caracter TO lt_candidate.
      ENDDO.

      " Ordenamos la tabla de caracteres de candidate de manera ascendente
      SORT lt_candidate ASCENDING.

      " Si ambas tablas son iguales entonces añadimos el candidato original a result
      IF lt_input = lt_candidate.
        APPEND lV_candidate_original TO result.
      ENDIF.
      
    ENDLOOP.
    
  ENDMETHOD.

ENDCLASS.