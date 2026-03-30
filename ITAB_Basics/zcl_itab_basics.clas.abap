CLASS zcl_itab_basics DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .


  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_type,
             group       TYPE group,
             number      TYPE i,
             description TYPE string,
           END OF initial_type,
           itab_data_type TYPE STANDARD TABLE OF initial_type WITH EMPTY KEY.

    METHODS fill_itab
           RETURNING
             VALUE(initial_data) TYPE itab_data_type.

    METHODS add_to_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
            VALUE(updated_data) TYPE itab_data_type.

    METHODS sort_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
            VALUE(updated_data) TYPE itab_data_type.

    METHODS search_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
             VALUE(result_index) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_itab_basics IMPLEMENTATION.
  METHOD fill_itab.
  
    " Estructura de la tabla interna
    DATA ls_initial_data TYPE initial_type.

    " Limpiamos la estructura, asignamos los valores y la añadimos a la tabla interna
    CLEAR ls_initial_data.
    ls_initial_data-group = 'A'.
    ls_initial_data-number = 10.
    ls_initial_data-description = 'Group A-2'.
    APPEND ls_initial_data TO initial_data.
    
    CLEAR ls_initial_data.
    ls_initial_data-group = 'B'.
    ls_initial_data-number = 5.
    ls_initial_data-description = 'Group B'.
    APPEND ls_initial_data TO initial_data.
    
    CLEAR ls_initial_data.
    ls_initial_data-group = 'A'.
    ls_initial_data-number = 6.
    ls_initial_data-description = 'Group A-1'.
    APPEND ls_initial_data TO initial_data.
    
    CLEAR ls_initial_data.
    ls_initial_data-group = 'C'.
    ls_initial_data-number = 22.
    ls_initial_data-description = 'Group C-1'.
    APPEND ls_initial_data TO initial_data.
    
    CLEAR ls_initial_data.
    ls_initial_data-group = 'A'.
    ls_initial_data-number = 13.
    ls_initial_data-description = 'Group A-3'.
    APPEND ls_initial_data TO initial_data.
    
    CLEAR ls_initial_data.
    ls_initial_data-group = 'C'.
    ls_initial_data-number = 500.
    ls_initial_data-description = 'Group C-2'.
    APPEND ls_initial_data TO initial_data.
    
  ENDMETHOD.

  METHOD add_to_itab.
  
    " Asignamos la tabla interna pasada por parámetro a la tabla actualizada
    updated_data = initial_data.

    " Estructura de la tabla interna
    DATA ls_initial_data TYPE initial_type.

    " Limpiamos la estructura, asignamos los valores y la añadimos a la nueva tabla interna
    CLEAR ls_initial_data.
    ls_initial_data-group = 'A'.
    ls_initial_data-number = 19.
    ls_initial_data-description = 'Group A-4'.
    APPEND ls_initial_data TO updated_data.
    
  ENDMETHOD.

  METHOD sort_itab.
  
    " Asignamos la tabla interna pasada por parámetro a la tabla actualizada
    updated_data = initial_data.

    " Ordenamos la tabla por grupo y número de manera descendente
    SORT updated_data BY group number DESCENDING.
    
  ENDMETHOD.

  METHOD search_itab.
  
    " Leemos la tabla y buscamos un registro cuyo número sea 6
    READ TABLE initial_data WITH KEY number = 6 TRANSPORTING NO FIELDS.
    
    " Obtenemos el indice del registro correspondiente
    result_index = sy-tabix.
  
  ENDMETHOD.

ENDCLASS.