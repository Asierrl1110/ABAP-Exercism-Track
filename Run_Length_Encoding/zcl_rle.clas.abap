CLASS zcl_rle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS encode IMPORTING input         TYPE string
                   RETURNING VALUE(result) TYPE string.

    METHODS decode IMPORTING input         TYPE string
                   RETURNING VALUE(result) TYPE string.

ENDCLASS.


CLASS zcl_rle IMPLEMENTATION.

  METHOD encode.

          " Variable para almacenar el índice del bucle
    DATA: lv_index TYPE i,
          " Variable para almacenar la letra de la cadena
          lv_letter TYPE string,
          " Variable para almacenar el contador de letras
          lv_count TYPE i.

    " Bucle con el número de iteraciones de la longitud del input
    DO strlen( input ) TIMES.

      " Indice de la cadena
      lv_index = sy-index - 1.

      " Si la letra es igual a la anterior, se suma 1
      IF lv_letter = input+lv_index(1).
        lv_count = lv_count + 1.
        
      " Si es la primera iteración, entonces se asigna por primera vez
      ELSEIF sy-index = 1.
      
        lv_count = lv_count + 1.
        lv_letter = input+lv_index(1).
        
      " Si la letra no es igual, hay un cambio de letra y
      " añadimos la letra anterior al result
      ELSE.
      
        " Si el contador es mayor que uno, 
        " añadimos el número y la letra, si es solo uno, añadimos solo la letra
        IF lv_count > 1.
          result = result && lv_count && lv_letter.
          " Establecemos el contador a uno de la nueva letra
          lv_count = 1.
        ELSE.
          result = result && lv_letter.
        ENDIF.
        " Asignamos la nueva letra a la variable
        lv_letter = input+lv_index(1).
        
      ENDIF.
      
    ENDDO.

    " Añadimos la última letra del bucle
    IF lv_count > 1.
      result = result && lv_count && lv_letter.
    ELSE.
      result = result && lv_letter.
    ENDIF.
  
  ENDMETHOD.


  METHOD decode.

          " Variable para almacenar el índice del bucle
    DATA: lv_index TYPE i,
          " Variable para almacenar la letra de la cadena
          lv_letter TYPE string,
          " Variable para almacenar el contador de letras
          lv_count TYPE i,
          " Variable para leer el número de la cadena directamente
          lv_num TYPE string.

    " Bucle con el número de iteraciones de la longitud del input
    DO strlen( input ) TIMES.

      " Indice de la cadena
      lv_index = sy-index - 1.

      " Cogemos el caracter correspondiente
      lv_letter = input+lv_index(1).

      " Si el caracter es un número, entonces se almacena en el numero
      IF lv_letter CA '1234567890'.
        lv_num = lv_num && lv_letter.
      ELSE.
      
        " Comprobamos si el número es inicial o no
        IF lv_num IS INITIAL.
          " Si no hay número, es que solo hay una letra
          lv_count = 1.
        ELSE.
          " Si hay número, parseamos el número a la variable integer
          lv_count = lv_num.
        ENDIF.

        " Bucle con el número de iteraciones del contador
        DO lv_count TIMES.
          " Añadimos la letra correspondiente al result
          " el número de veces del contador
          result = result && lv_letter.
        ENDDO.

        " Limpiamos la variable del número en cadena
        CLEAR lv_num.
        
      ENDIF.

    ENDDO.

  ENDMETHOD.

ENDCLASS.