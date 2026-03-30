CLASS zcl_crypto_square DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS encode IMPORTING plain_text         TYPE string
                   RETURNING VALUE(crypto_text) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_crypto_square IMPLEMENTATION.

  METHOD encode.

          " Variable para almacenar el texto plano pasado por parámetro
    DATA: lv_plain_text   TYPE string,
          " Variable para almacenar la longitud del texto plano
          lv_len    TYPE i,
          " Variable para almacenar el número de columnas
          lv_c      TYPE i,
          " Variable para almacenar el número de filas
          lv_r      TYPE i,
          " Variable para almacenar el indice de la columna
          lv_i      TYPE i,
          " Variable para almacenar el índice de la fila
          lv_j      TYPE i,
          " Variable para almacenar el indice del caracter a leer
          lv_index  TYPE i,
          " Variable para almacenar el caracter para añadir al chunk
          lv_char   TYPE c LENGTH 1,
          " Variable para añadir la cadena de la fila
          lv_chunk  TYPE string,
          " Variable para almacenar el resultado final
          lv_result TYPE string.

    " Asignamos el texto plano a la variable
    lv_plain_text = plain_text.
    
    " Pasamos el texto a minúsculas
    TRANSLATE lv_plain_text TO LOWER CASE.

    " Eliminamos todo lo que no sean minúsculas o números del texto plano
    REPLACE ALL OCCURRENCES OF REGEX '[^a-z0-9]' IN lv_plain_text WITH ''.

    " Almacenamos la longitud del texto plano
    lv_len = strlen( lv_plain_text ).

    " En caso de ser vacio, se devuelve vacio
    IF lv_len = 0.
      crypto_text = ``.
      RETURN.
    ENDIF.

    " En caso de ser solo un caracter, se devuelve el caracter plano
    IF lv_len = 1.
      crypto_text = lv_plain_text.
      RETURN.
    ENDIF.

    " Calcular dimensiones del rectángulo
    lv_c = ceil( sqrt( lv_len ) ).
    lv_r = ceil( lv_len / lv_c ).

    " Leer por columnas
    DO lv_c TIMES.

      " Limpiamos el chunk
      CLEAR lv_chunk.
      
      " Indice columna
      lv_i = sy-index - 1. 

      " Leer por filas
      DO lv_r TIMES.
      
        " Indice fila
        lv_j = sy-index - 1. 

        " Calculamos el indice del caracter
        lv_index = lv_j * lv_c + lv_i.

        " Si no se pasa el indice, cogemos el caracter de la cadena
        " Si se pasa, asignamos un espacio en blanco
        IF lv_index < lv_len.
          lv_char = lv_plain_text+lv_index(1).
        ELSE.
          lv_char = ' '.
        ENDIF.

        " Añadimos el caracter o el espacio
        IF lv_char <> ' '.
          lv_chunk = lv_chunk && lv_char.
        ELSE.
          CONCATENATE lv_chunk '' INTO lv_chunk SEPARATED BY space.
        ENDIF.
        
      ENDDO.

      " Si es la primera iteración se añade tal cual y si no es la primera
      " iteración se añade el espacio entre medias
      IF sy-index = 1.
        lv_result = lv_chunk.
      ELSE.
        " Añadir chunk + espacio
        CONCATENATE lv_result lv_chunk INTO lv_result SEPARATED BY space.
      ENDIF.      

    ENDDO.

    " Asignamos el resultado final al texto cifrado
    crypto_text = lv_result.

  ENDMETHOD.

ENDCLASS.