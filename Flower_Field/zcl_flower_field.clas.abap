CLASS zcl_flower_field DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS annotate
        IMPORTING
          !input        TYPE string_table
        RETURNING
          VALUE(result) TYPE string_table.

ENDCLASS.

CLASS zcl_flower_field IMPLEMENTATION.

  METHOD annotate.

    DATA: lv_rows        TYPE i,          " número total de filas
          lv_cols        TYPE i,          " número de columnas de la fila actual
          lv_row         TYPE string,     " fila actual del input
          lv_new_row     TYPE string,     " fila construida para el resultado
          lv_neighbor    TYPE string,     " fila vecina
          lv_char        TYPE c LENGTH 1, " carácter actual
          lv_count       TYPE i,          " contador de flores adyacentes
          lv_i           TYPE i,          " índice de fila
          lv_j           TYPE i,          " índice de columna
          lv_x           TYPE i,          " índice de fila vecina
          lv_y           TYPE i.          " índice de columna vecina

    lv_rows = lines( input ).

    " Recorrer cada fila
    LOOP AT input INTO lv_row.

      " Almacenamos el indice del bucle
      lv_i = sy-tabix.

      " Limpiamos la variable de la nueva fila
      CLEAR lv_new_row.

      " Número de columnas de la fila
      lv_cols = strlen( lv_row ).

      " Recorrer la columna
      DO lv_cols TIMES.
      
        " Almacenamos el índice de la columna
        lv_j = sy-index - 1.
        " Cogemos el valor correspondiente
        lv_char = lv_row+lv_j(1).

        
        IF lv_char = '*'.
        
          " Si es un '*' entonces se añade directamente a la nueva fila
          lv_new_row = lv_new_row && '*'.
          
        ELSE.
          " Si no es un '*' entonces contamos el número de asteriscos que tiene alrededor
          
          " Limpiamos el contador
          CLEAR lv_count.

          " Bucle con 3 iteraciones
          DO 3 TIMES.

            " Fila vecina (-1, 0, +1)
            lv_x = lv_i + sy-index - 2. 

            " Validar límites de fila
            IF lv_x < 1 OR lv_x > lv_rows.
              CONTINUE.
            ENDIF.

            " Leemos la fila vecina
            READ TABLE input INTO lv_neighbor INDEX lv_x.

            " Bucle con 3 iteraciones
            DO 3 TIMES.
              " Columna vecina (-1, 0, +1)
              lv_y = lv_j + sy-index - 2. 

              " Validar límites de columna
              IF lv_y < 0 OR lv_y >= strlen( lv_neighbor ).
                CONTINUE.
              ENDIF.

              " Evitar contar la misma celda
              IF lv_x = lv_i AND lv_y = lv_j.
                CONTINUE.
              ENDIF.

              " Contar flores
              IF lv_neighbor+lv_y(1) = '*'.
                lv_count = lv_count + 1.
              ENDIF.
              
            ENDDO.
            
          ENDDO.

          " Si no se cuentan flores alrededor, se añade un espacio
          " Si se cuentan, entonces se añade el contador
          IF lv_count = 0.
            CONCATENATE lv_new_row '' INTO lv_new_row SEPARATED BY space.
          ELSE.
            lv_new_row = lv_new_row && lv_count.
          ENDIF.
          
        ENDIF.
        
      ENDDO.

      " Añadir fila al resultado
      APPEND lv_new_row TO result.
      
    ENDLOOP.
    
  ENDMETHOD.

ENDCLASS.