CLASS zcl_scrabble_score DEFINITION PUBLIC .

  PUBLIC SECTION.
    METHODS score
      IMPORTING
        input         TYPE string OPTIONAL
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_scrabble_score IMPLEMENTATION.
  METHOD score.
  
    " Constantes con las letras agrupadas por valor
    CONSTANTS: letters_1 TYPE string VALUE 'AEIOULNRST',
               letters_2 TYPE string VALUE 'DG',
               letters_3 TYPE string VALUE 'BCMP',
               letters_4 TYPE string VALUE 'FHVWY',
               letters_5 TYPE string VALUE 'K',
               letters_8 TYPE string VALUE 'JX',
               letters_10 TYPE string VALUE 'QZ'.

          " Variable que almacena el caracter leido de la palabra
    DATA: lv_char TYPE c LENGTH 1,
          " Posición para leer la letra
          lv_pos TYPE i.

    " Pasamos la cadena pasada por parámetro a mayusculas
    TRANSLATE input TO UPPER CASE.

    " Bucle el número de iteraciones correspondiente a la longitud de la cadena
    DO strlen( input ) TIMES.
    
      " Restamos uno al indice
      lv_pos = sy-index - 1.
      " Cogemos el caracter
      lv_char = input+lv_pos(1).

      " Comprobamos el valor del caracter, comprobando a que variable
      " pertenece la letra, en función de a cual pertenezca se le suma un valor al result
      IF letters_1 CA lv_char.
        result = result + 1.
      ELSEIF letters_2 CA lv_char.
        result = result + 2.
      ELSEIF letters_3 CA lv_char.
        result = result + 3.
      ELSEIF letters_4 CA lv_char.
        result = result + 4.
      ELSEIF letters_5 CA lv_char.
        result = result + 5.
      ELSEIF letters_8 CA lv_char.
        result = result + 8.
      ELSEIF letters_10 CA lv_char.
        result = result + 10.
      ENDIF.
      
    ENDDO.
    
  ENDMETHOD.

ENDCLASS.