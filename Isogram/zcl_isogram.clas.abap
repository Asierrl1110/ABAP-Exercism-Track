CLASS zcl_isogram DEFINITION PUBLIC.

  PUBLIC SECTION.
    METHODS is_isogram
      IMPORTING
        VALUE(phrase)        TYPE string
      RETURNING
        VALUE(result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_isogram IMPLEMENTATION.

  METHOD is_isogram.
  
          " Variable que almacena el caracter que se esta leyendo de la cadena
    DATA: lv_caracter TYPE c,
          " Variable que almacena una cadena con los caracteres encontrados en la palabra
          lv_caracteres TYPE string,
          " Variable que almacena el indice del bucle
          lv_index TYPE i.

    " Ponemos por defecto que la palabra es un isograma
    result = abap_true.

    " Pasamos la frase a minúsculas
    TRANSLATE phrase TO LOWER CASE.

    " Bucle con número de iteraciones de la longitud de la palabra
    DO strlen( phrase ) TIMES.
    
      " Cogemos el índice menos 1
      lv_index = sy-index - 1.
      " Cogemos el caracter correspondiente
      lv_caracter = phrase+lv_index(1).

      " En caso de que sea un espacio o un guión, continua a la siguiente iteración
      IF lv_caracter = ' ' OR lv_caracter = '-'.
        CONTINUE.
      ENDIF.

      " En caso de que el caracter se repita, 
      " entonces la palabra no es un isograma y se finaliza el método
      IF lv_caracter CA lv_caracteres.
        result = abap_false.
        RETURN.
      ELSE.
        " Si no se repite, se añade a la cadena de caracteres
        lv_caracteres = lv_caracteres && lv_caracter.
      ENDIF.

    ENDDO.
    
  ENDMETHOD.

ENDCLASS.