CLASS zcl_atbash_cipher DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS decode
      IMPORTING
        cipher_text TYPE string
      RETURNING
        VALUE(plain_text)  TYPE string .
    METHODS encode
      IMPORTING
        plain_text        TYPE string
      RETURNING
        VALUE(cipher_text) TYPE string .
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: letters_table TYPE string_table.
ENDCLASS.



CLASS zcl_atbash_cipher IMPLEMENTATION.

  METHOD decode.

    " Tabla interna con las letras del abecedario en orden
    letters_table = VALUE string_table(
      ( 'a' ) ( 'b' ) ( 'c' ) ( 'd' ) ( 'e' ) ( 'f' ) ( 'g' ) ( 'h' )
      ( 'i' ) ( 'j' ) ( 'k' ) ( 'l' ) ( 'm' ) ( 'n' ) ( 'o' ) ( 'p' )
      ( 'q' ) ( 'r' ) ( 's' ) ( 't' ) ( 'u' ) ( 'v' ) ( 'w' ) ( 'x' )
      ( 'y' ) ( 'z' )
    ).

          " Variable para almacenar el texto cifrado pasado por parámetro
    DATA: lv_text TYPE string,
          " Variable para almacenar el índice del bucle
          lv_index TYPE i,
          " Variable para almacenar el indice de la letra
          lv_letter_index TYPE i,
          " Variable para almacenar la letra del texto cifrado
          lv_cipher_letter TYPE string,
          " Variable para almacenar la letra original
          lv_letter TYPE string.

    " Asignamos la variable pasada por parámetro al texto
    lv_text = cipher_text.

    " Elimimamos todo lo que no sean letras mínusculas ni números del texto cifrado
    REPLACE ALL OCCURRENCES OF REGEX `[^a-z0-9]` IN lv_text WITH ''.

    " Bucle con el número de iteraciones de la longitud del texto cifrado
    DO strlen( lv_text ) TIMES.

      " Indice del bucle menos 1
      lv_index = sy-index - 1.

      " Almacenamos la letra correspondiente
      lv_cipher_letter = lv_text+lv_index(1).

      " Leemos la letra de la tabla de letras del abecedario
      READ TABLE letters_table WITH KEY table_line = lv_cipher_letter TRANSPORTING NO FIELDS.

      IF sy-subrc IS INITIAL.

        " Leemos el índice de la tabla interna correspondiente a la letra
        lv_letter_index = sy-tabix.

        " Buscamos el contrario en la tabla restando al total el indice
        lv_letter_index = 27 - lv_letter_index.

         " Leemos la letra correspondiente al nuevo indice y lo asignamos a la letra original
        READ TABLE letters_table INDEX lv_letter_index INTO lv_letter.
      
      ELSE.
        " Si no la encuentra, es porque es un número, entonces asignamos directamente el
        " valor original
        lv_letter = lv_cipher_letter.
      ENDIF.

      " Asignamos la nueva letra
      plain_text = plain_text && lv_letter.

    ENDDO.
  
  ENDMETHOD.

  METHOD encode.
  
    " Tabla interna con las letras del abecedario en orden
    letters_table = VALUE string_table(
      ( 'a' ) ( 'b' ) ( 'c' ) ( 'd' ) ( 'e' ) ( 'f' ) ( 'g' ) ( 'h' )
      ( 'i' ) ( 'j' ) ( 'k' ) ( 'l' ) ( 'm' ) ( 'n' ) ( 'o' ) ( 'p' )
      ( 'q' ) ( 'r' ) ( 's' ) ( 't' ) ( 'u' ) ( 'v' ) ( 'w' ) ( 'x' )
      ( 'y' ) ( 'z' )
    ).

          " Variable para almacenar el texto plano pasado por parámetro
    DATA: lv_text TYPE string,
          " Variable para almacenar el índice del bucle
          lv_index TYPE i,
          " Variable para almacenar el indice de la letra
          lv_letter_index TYPE i,
          " Variable para almacenar el contador de letras
          lv_count TYPE i,
          " Variable para almacenar la letra del texto plano
          lv_letter TYPE string,
          " Variable para almacenar la letra cifrada
          lv_cipher_letter TYPE string.

    " Asignamos la variable pasada por parámetro al texto
    lv_text = plain_text.

    " Pasamos el texto a minúsculas
    TRANSLATE lv_text TO LOWER CASE.

    " Elimimamos todo lo que no sean letras mínusculas ni números del texto original
    REPLACE ALL OCCURRENCES OF REGEX `[^a-z0-9]` IN lv_text WITH ''.

    " Bucle con el número de iteraciones de la longitud del texto plano
    DO strlen( lv_text ) TIMES.
      
      " Indice del bucle menos 1
      lv_index = sy-index - 1.

      " Almacenamos la letra correspondiente
      lv_letter = lv_text+lv_index(1).

      " Leemos la letra de la tabla de letras del abecedario
      READ TABLE letters_table WITH KEY table_line = lv_letter TRANSPORTING NO FIELDS.

      
      IF sy-subrc IS INITIAL.
        
        " Leemos el índice de la tabla interna correspondiente a la letra
        lv_letter_index = sy-tabix.

        " Buscamos el contrario en la tabla restando al total el indice
        lv_letter_index = 27 - lv_letter_index.

        " Leemos la letra correspondiente al nuevo indice y lo asignamos a la letra encriptada
        READ TABLE letters_table INDEX lv_letter_index INTO lv_cipher_letter.
        
      ELSE.
        " Si no la encuentra, es porque es un número, entonces asignamos directamente el
        " valor original
        lv_cipher_letter = lv_letter.
      ENDIF.

      " Asignamos la nueva letra
      cipher_text = cipher_text && lv_cipher_letter.

      " Sumamos uno al contador
      lv_count = lv_count + 1.

      " Si ya hemos puesto 5 letras y no es la última posición, añadimos un espacio
      IF lv_count = 5 AND sy-index < strlen( lv_text ).
      
        CONCATENATE cipher_text ' ' INTO cipher_text SEPARATED BY space.
        
        " Reiniciamos el contador a 0
        lv_count = 0.
      
      ENDIF.
      
    ENDDO.
    
  ENDMETHOD.
  
ENDCLASS.