CLASS zcl_resistor_color_duo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS value
      IMPORTING
        colors       TYPE string_table
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_resistor_color_duo IMPLEMENTATION.
  METHOD value.

    " Variable para almacenar el result en string y poder concatenar los valores
    DATA result_string TYPE string.

    " Recorremos los colores de la tabla
    LOOP AT colors INTO DATA(ls_color).
    
      " Solo se leen los dos primeros valores de la tabla
      IF sy-tabix < 3.
        " Comprobamos el color, en función del color que sea agregamos un valor
        " al result_string
        CASE ls_color.
          WHEN 'black'.
            result_string = result_string && '0'.
          WHEN 'brown'.
            result_string = result_string && '1'.
          WHEN 'red'.
            result_string = result_string && '2'.
          WHEN 'orange'.
            result_string = result_string && '3'.
          WHEN 'yellow'.
            result_string = result_string && '4'.
          WHEN 'green'.
            result_string = result_string && '5'.
          WHEN 'blue'.
            result_string = result_string && '6'.
          WHEN 'violet'.
            result_string = result_string && '7'.
          WHEN 'grey'.
            result_string = result_string && '8'.
          WHEN 'white'.
            result_string = result_string && '9'.
        ENDCASE.
      ELSE.
        " Una vez se hayan leido dos, se acaba el bucle
        EXIT.  
      ENDIF.
    
    ENDLOOP.
    
    " Parseamos la cadena del result a la variable returning result
    result = result_string.
  
  ENDMETHOD.
  
ENDCLASS.