CLASS zcl_resistor_color_trio DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS label
      IMPORTING
        colors       TYPE string_table
      RETURNING
        VALUE(result) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
      

ENDCLASS.

CLASS zcl_resistor_color_trio IMPLEMENTATION.
  METHOD label.
  
          " Tabla interna para almacenar los tres valores de cada color
    DATA: lt_values      TYPE STANDARD TABLE OF i,
          " Variable para almacenar el valor del primer color
          ls_value1      TYPE i,
          " Variable para almacenar el valor del segundo color
          ls_value2      TYPE i,
          " Variable para almacenar el valor del tercer color
          ls_value3      TYPE i,
          " Variable para almacenar el valor total de los tres colores
          ls_value_total TYPE i.

    " Recorremos la tabla de colores
    LOOP AT colors INTO DATA(ls_color).
      " Solo leemos los tres primeros colores, si sigue el bucle se sale
      IF sy-tabix >= 4.
        EXIT.
      ELSE.
        " En función del color añadimos un valor a la tabla de valores
        CASE ls_color.
          WHEN 'black'.   APPEND 0 TO lt_values.
          WHEN 'brown'.   APPEND 1 TO lt_values.
          WHEN 'red'.     APPEND 2 TO lt_values.
          WHEN 'orange'.  APPEND 3 TO lt_values.
          WHEN 'yellow'.  APPEND 4 TO lt_values.
          WHEN 'green'.   APPEND 5 TO lt_values.
          WHEN 'blue'.    APPEND 6 TO lt_values.
          WHEN 'violet'.  APPEND 7 TO lt_values.
          WHEN 'grey'.    APPEND 8 TO lt_values.
          WHEN 'white'.   APPEND 9 TO lt_values.
        ENDCASE.
      ENDIF.
    ENDLOOP.

    " Leemos cada valor de la tabla interna de valores para almacenarlos en cada variable
    READ TABLE lt_values INTO ls_value1 INDEX 1.
    READ TABLE lt_values INTO ls_value2 INDEX 2.
    READ TABLE lt_values INTO ls_value3 INDEX 3.

    " Calculamos el valor total
    " El primer valor son las decenas del número
    " El segundo valor son las unidades del número
    " El tercer valor son el número de ceros del número
    ls_value_total = ( ls_value1 * 10 + ls_value2 ) * ( 10 ** ls_value3 ).

    " Comprobamos que unidad podemos asignarle al valor, si giga, mega, kilo o ohms solo
    IF ls_value_total > 1000000000.
      result = |{ ls_value_total / 1000000000 } gigaohms|.
    ELSEIF ls_value_total > 1000000.
      result = |{ ls_value_total / 1000000 } megaohms|.
    ELSEIF ls_value_total > 1000.
      result = |{ ls_value_total / 1000 } kiloohms|.
    ELSE.
      result = |{ ls_value_total } ohms|.
    ENDIF.
    
  ENDMETHOD.
  
ENDCLASS.