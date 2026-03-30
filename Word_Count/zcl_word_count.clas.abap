CLASS zcl_word_count DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES:
      BEGIN OF return_structure,
        word  TYPE string,
        count TYPE i,
      END OF return_structure,
      return_table TYPE STANDARD TABLE OF return_structure WITH KEY word.
    METHODS count_words
      IMPORTING
        !phrase       TYPE string
      RETURNING
        VALUE(result) TYPE return_table .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_word_count IMPLEMENTATION.

  METHOD count_words.

          " Variable que almacena la frase pasada por parámetro
    DATA: lv_phrase TYPE string,
          " Tabla que almacena las palabras separadas de la frase
          lt_words TYPE string_table,
          " Tabla que almacena el resultado final de palabras con su número de apariciones
          lt_return TYPE return_table,
          " Variable que almacena un registro de la tabla resultado
          ls_return TYPE return_structure.

    " Asignamos la frase pasada por parámetro a la variable
    lv_phrase = phrase.

    " Pasamos la frase a minúsculas
    TRANSLATE lv_phrase TO LOWER CASE.

    " Reemplazamos los saltos de linea por un espacio en blanco
    lv_phrase = REPLACE( val = lv_phrase sub = '\n' WITH = | | occ = 0 ).

    " Reemplazamos las tabulaciones por un espacio en blanco
    lv_phrase = REPLACE( val = lv_phrase sub = '\t' WITH = | | occ = 0 ).

    " Reemplazamos las comas por un espacio en blanco
    lv_phrase = REPLACE( val = lv_phrase sub = ',' WITH = | | occ = 0 ).

    " Eliminamos todo lo que no coincida con letras, números y espacios en blanco
    REPLACE ALL OCCURRENCES OF REGEX `[^a-z0-9 ]` IN lv_phrase WITH ''.

    " Eliminamos los espacios en blanco extra
    CONDENSE lv_phrase.

    " Almacenamos las palabras separadas por un espacio en blanco en la tabla interna
    SPLIT lv_phrase AT ' ' INTO TABLE lt_words.

    " Recorremos todas las palabras para añadirlas a la tabla result
    LOOP AT lt_words INTO DATA(lv_word).
    
      " Comprobamos que no sea una cadena vacia
      CHECK lv_word IS NOT INITIAL.
      " Leemos un registro cuya palabra sea la correspondiente al bucle
      READ TABLE lt_return ASSIGNING FIELD-SYMBOL(<ls_result>) WITH KEY word = lv_word.
      " Si encuentra un registro, entonces suma 1 al contador
      " Si no encuentra, creamos un nuevo registro
      IF sy-subrc IS INITIAL.
        <ls_result>-count = <ls_result>-count + 1.
      ELSE.
        CLEAR ls_return.
        ls_return-word = lv_word.
        ls_return-count = 1.
        APPEND ls_return TO lt_return.
      ENDIF.
      
    ENDLOOP.

    " Asignamos la tabla resultante al result
    result = lt_return.
    
  ENDMETHOD.
  
ENDCLASS.