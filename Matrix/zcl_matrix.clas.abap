CLASS zcl_matrix DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS matrix_row
      IMPORTING
        string        TYPE string
        index         TYPE i
      RETURNING
        VALUE(result) TYPE integertab.
    METHODS matrix_column
      IMPORTING
        string        TYPE string
        index         TYPE i
      RETURNING
        VALUE(result) TYPE integertab.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_matrix IMPLEMENTATION.
  METHOD matrix_row.

          " Tabla que almacena las filas de la matriz del string
    DATA: lt_string TYPE string_table,
          " Variable que almacena una fila individual de la matriz
          lv_string TYPE string,
          " Tabla que almacena los números de una fila
          lt_nums TYPE string_table.

    " Separamos las filas de la matriz y las almacenamos en una tabla
    SPLIT string AT '\n' INTO TABLE lt_string.

    " Leemos la fila correspondiente al indice pasado por parámetro
    READ TABLE lt_string INDEX index INTO lv_string.

    " Separamos los números de la fila y los almancenamos en una tabla
    SPLIT lv_string AT ' ' INTO TABLE lt_nums.

    " Recorremos la tabla de números y los añadimos al result
    LOOP AT lt_nums INTO DATA(lv_num).
      APPEND lv_num TO result.
    ENDLOOP.
    
  ENDMETHOD.

  METHOD matrix_column.

          " Tabla que almacena las filas de la matriz del string
    DATA: lt_string TYPE string_table,
          " Tabla que almacena los números de una fila
          lt_nums TYPE string_table,
          " Variable que almacena un número de una fila
          lv_num TYPE string.

    " Separamos las filas de la matriz y las almacenamos en una tabla
    SPLIT string AT '\n' INTO TABLE lt_string.

    " Recorremos la tabla de las filas de la matriz
    LOOP AT lt_string INTO DATA(lv_string).

      " Separamos los números de la fila y los almancenamos en una tabla
      SPLIT lv_string AT ' ' INTO TABLE lt_nums.

      " Leemos el número de la fila correspondiente al índice pasado por parámetro
      READ TABLE lt_nums INDEX index INTO lv_num.

      " Añadimos el número al result
      APPEND lv_num TO result.
      
    ENDLOOP.
  
  ENDMETHOD.
  
ENDCLASS.