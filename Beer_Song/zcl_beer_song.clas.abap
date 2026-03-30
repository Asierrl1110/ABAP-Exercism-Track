CLASS zcl_beer_song DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS recite
      IMPORTING
        !initial_bottles_count TYPE i
        !take_down_count       TYPE i
      RETURNING
        VALUE(result)          TYPE string_table.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_beer_song IMPLEMENTATION.

  METHOD recite.

          " Variable para guardar el contador de botellas
    DATA: lv_bottles_count TYPE i,
          " Variable para guardar el contador de cuantas botellas se van a añadir
          lv_count TYPE i,
          " Variable para almacenar las cadenas que se van a añadir a la tabla result
          lv_string TYPE string.

    " Asignamos las variables pasadas por parámetro
    lv_bottles_count = initial_bottles_count.
    lv_count = take_down_count.

    " Bucle con el número de iteracion del número de botellas que se van a añadir
    DO lv_count TIMES.
    
      " Si el número de botella es distinto a 0, 1 y 2 se ponen las cadenas genéricas
      IF lv_bottles_count <> 0 AND lv_bottles_count <> 1 AND lv_bottles_count <> 2.
        
        " Añadimos una cadena
        lv_string = |{ lv_bottles_count } bottles of beer on the wall, { lv_bottles_count } bottles of beer.|.
        APPEND lv_string TO result.

        " Restamos uno al contador de botellas
        lv_bottles_count = lv_bottles_count - 1.
        
        " Añadimos una cadena
        lv_string = |Take one down and pass it around, { lv_bottles_count } bottles of beer on the wall.|.
        APPEND lv_string TO result.
      
      ELSEIF lv_bottles_count = 0.

        " Añadimos una cadena
        lv_string = |No more bottles of beer on the wall, no more bottles of beer.|.
        APPEND lv_string TO result.

        " Añadimos una cadena
        lv_string = |Go to the store and buy some more, 99 bottles of beer on the wall.|.
        APPEND lv_string TO result.

        " Finalizamos la ejecución del método porque no quedan más botellas
        RETURN.
        
      ELSEIF lv_bottles_count = 1.

        " Añadimos una cadena
        lv_string = |{ lv_bottles_count } bottle of beer on the wall, { lv_bottles_count } bottle of beer.|.
        APPEND lv_string TO result.

        " Restamos uno al contador de botellas
        lv_bottles_count = lv_bottles_count - 1.

        " Añadimos una cadena
        lv_string = |Take it down and pass it around, no more bottles of beer on the wall.|.
        APPEND lv_string TO result.
        
      ELSEIF lv_bottles_count = 2.

        " Añadimos una cadena
        lv_string = |{ lv_bottles_count } bottles of beer on the wall, { lv_bottles_count } bottles of beer.|.
        APPEND lv_string TO result.

        " Restamos uno al contador de botellas
        lv_bottles_count = lv_bottles_count - 1.

        " Añadimos una cadena
        lv_string = |Take one down and pass it around, { lv_bottles_count } bottle of beer on the wall.|.
        APPEND lv_string TO result.
        
      ENDIF.

      " Si no es la última iteración, añadimos un espacio a la tabla result
      IF sy-index < lv_count.
        APPEND '' TO result.
      ENDIF.
      
    ENDDO.
    
  ENDMETHOD.

ENDCLASS.