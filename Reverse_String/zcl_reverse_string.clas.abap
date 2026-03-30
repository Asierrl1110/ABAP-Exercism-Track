CLASS zcl_reverse_string DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS reverse_string
      IMPORTING
        input         TYPE string
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_reverse_string IMPLEMENTATION.

  METHOD reverse_string.

          " Variable para almacenar el caracter
    DATA: lv_char TYPE c LENGTH 1,
          " Variable para almacenar la posición del indice
          lv_pos TYPE i.

    " Bucle con el número de iteraciones de la longitud del input
    DO strlen( input ) TIMES.
    
      " Posición es igual al indice del bucle menos 1
      lv_pos = sy-index - 1.
      " Leemos el caracter correspondiente de la cadena
      lv_char = input+lv_pos(1).

      " En caso de que no sea un espacio añadimos el caracter por delante del result
      " Si es un espacio concatenamos el vacio separado por espacio
      IF lv_char <> ' '.
        result = lv_char && result.
      ELSE.
        CONCATENATE lv_char result INTO result SEPARATED BY space.
      ENDIF.
      
    ENDDO.
    
  ENDMETHOD.

ENDCLASS.