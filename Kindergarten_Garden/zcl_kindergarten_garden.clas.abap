CLASS zcl_kindergarten_garden DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS plants
      IMPORTING
        diagram        TYPE string
        student        TYPE string
      RETURNING
        VALUE(results) TYPE string_table.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA students TYPE string_table.

ENDCLASS.


CLASS zcl_kindergarten_garden IMPLEMENTATION.

  METHOD plants.
  
    " Tabla interna con los estudiantes
    students = VALUE string_table(
      ( 'Alice' ) ( 'Bob' ) ( 'Charlie' ) ( 'David' )
      ( 'Eve' ) ( 'Fred' ) ( 'Ginny' ) ( 'Harriet' )
      ( 'Ileana' ) ( 'Joseph' ) ( 'Kincaid' ) ( 'Larry' )
    ).

          " Variable que almacena la primera fila de plantas
    DATA: lv_fila1      TYPE string,
          " Variable que almacena la segunda fila de plantas
          lv_fila2      TYPE string,
          " Variable que almacena el indice del estudiante
          lv_student_index TYPE i,
          " Variable para almacenar la posición de la cadena
          lv_pos TYPE i,
          " Tabla para almacenar las letras de las plantas
          lt_plants TYPE string_table.

    " Separamos el diagrama en dos filas separadas que vienen separadas por '\n'
    SPLIT diagram AT '\n' INTO lv_fila1 lv_fila2.

    " Buscamos el indice del estudiante pasado por parámetro
    READ TABLE students WITH KEY table_line = student TRANSPORTING NO FIELDS.
    lv_student_index = sy-tabix.

    " En caso de que el indice sea 0 (no se ha encontrado el estudiante)
    " se finaliza la ejecución del método
    IF lv_student_index = 0.
      RETURN.
    ENDIF.

    " El valor de la posición es el indice menos 1 y multiplicamos por 2
    lv_pos = ( lv_student_index - 1 ) * 2.

    " Añadimos las dos primeras plantas de cada fila a partir de la posición
    APPEND lv_fila1+lv_pos(1) TO lt_plants.
    lv_pos = lv_pos + 1.
    APPEND lv_fila1+lv_pos(1) TO lt_plants.
    
    lv_pos = lv_pos - 1.
    
    APPEND lv_fila2+lv_pos(1) TO lt_plants.
    lv_pos = lv_pos + 1.
    APPEND lv_fila2+lv_pos(1) TO lt_plants.

    " Recorremos toda la tabla de plantas
    LOOP AT lt_plants INTO DATA(lv_plant).
    
      " En función de la letra, añadimos una planta u otra a la tabla results
      CASE lv_plant.
        WHEN 'G'.
          APPEND 'grass' TO results.
        WHEN 'C'.
          APPEND 'clover' TO results.
        WHEN 'R'.
          APPEND 'radishes' TO results.
        WHEN 'V'.
          APPEND 'violets' TO results.
      ENDCASE.
      
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.