CLASS zcl_etl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES:
      BEGIN OF ty_legacy_data,
        number TYPE i,
        string TYPE string,
      END OF ty_legacy_data,
      BEGIN OF ty_new_data,
        letter TYPE c LENGTH 1,
        number TYPE i,
      END OF ty_new_data,
      tty_legacy_data TYPE SORTED TABLE OF ty_legacy_data WITH UNIQUE KEY number,
      tty_new_data    TYPE SORTED TABLE OF ty_new_data WITH UNIQUE KEY letter.

    METHODS transform IMPORTING legacy_data     TYPE tty_legacy_data
                      RETURNING VALUE(new_data) TYPE tty_new_data.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_etl IMPLEMENTATION.
  METHOD transform.

    " Recorremos la tabla de legacy data
    LOOP AT legacy_data INTO DATA(ls_legacy_data).

            " Variable que almacena una letra
      DATA: lv_letter TYPE c,
            " Variable que almacena el indice del bucle DO
            lv_index  TYPE i,
            " Estructura del nuevo data
            ls_new_data TYPE ty_new_data.

      " Bucle con numero de iteracion igual que la longitud de la cadena del legacy data
      DO strlen( ls_legacy_data-string ) TIMES.
      
        " Guardamos indice menos 1
        lv_index = sy-index - 1.
        " Guardamos la letra
        lv_letter = ls_legacy_data-string+lv_index(1).
        " Si es una coma, se ignora
        IF lv_letter <> ','.
        
          " Pasamos la letra a minúscula
          TRANSLATE lv_letter TO LOWER CASE.
          " Añadimos el nuevo registro de la letra y su valor
          CLEAR ls_new_data.
          ls_new_data-letter = lv_letter.
          ls_new_data-number = ls_legacy_data-number.
          INSERT ls_new_data INTO TABLE new_data.
          
        ENDIF.
        
      ENDDO.
      
    ENDLOOP.
    
  ENDMETHOD.
  
ENDCLASS.