CLASS zcl_itab_aggregation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_numbers_type,
             group  TYPE group,
             number TYPE i,
           END OF initial_numbers_type,
           initial_numbers TYPE STANDARD TABLE OF initial_numbers_type WITH EMPTY KEY.

    TYPES: BEGIN OF aggregated_data_type,
             group   TYPE group,
             count   TYPE i,
             sum     TYPE i,
             min     TYPE i,
             max     TYPE i,
             average TYPE f,
           END OF aggregated_data_type,
           aggregated_data TYPE STANDARD TABLE OF aggregated_data_type WITH EMPTY KEY.

    METHODS perform_aggregation
      IMPORTING
        initial_numbers        TYPE initial_numbers
      RETURNING
        VALUE(aggregated_data) TYPE aggregated_data.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_itab_aggregation IMPLEMENTATION.
  METHOD perform_aggregation.
  
    " Recorremos toda la tabla de números inicial
    LOOP AT initial_numbers ASSIGNING FIELD-SYMBOL(<ls_initial_number>).
    
      " Leemos un registro de la tabla aggregated que tenga el grupo del registro actual
      READ TABLE aggregated_data ASSIGNING FIELD-SYMBOL(<ls_aggregated_data>)
      WITH KEY group = <ls_initial_number>-group.

      " Si no se ha encontrado un registro de ese grupo, creamos un registro de ese grupo
      " Si se encuentra un registro, entonces actualizamos el registro de ese grupo
      IF sy-subrc IS NOT INITIAL.

        DATA ls_aggregated_data TYPE aggregated_data_type.
        ls_aggregated_data-group = <ls_initial_number>-group.
        ls_aggregated_data-count = 1.
        ls_aggregated_data-sum = <ls_initial_number>-number.
        ls_aggregated_data-min = <ls_initial_number>-number.
        ls_aggregated_data-max = <ls_initial_number>-number.
        ls_aggregated_data-average = <ls_initial_number>-number.
        APPEND ls_aggregated_data TO aggregated_data.
        
      ELSE.
      
        " Sumamos 1 al contador
        <ls_aggregated_data>-count = <ls_aggregated_data>-count + 1.
        " Sumamos el número al sumatorio
        <ls_aggregated_data>-sum = <ls_aggregated_data>-sum + <ls_initial_number>-number.
        " Comprobamos si el número es menor que el mínimo
        IF <ls_aggregated_data>-min > <ls_initial_number>-number.
          <ls_aggregated_data>-min = <ls_initial_number>-number.
        ENDIF.
        " Comprobamos si el número es mayor que el máximo
        IF <ls_aggregated_data>-max < <ls_initial_number>-number.
          <ls_aggregated_data>-max = <ls_initial_number>-number.
        ENDIF.
        " Actualizamos el promedio
        <ls_aggregated_data>-average = <ls_aggregated_data>-sum / <ls_aggregated_data>-count.
        
      ENDIF.
      
    ENDLOOP.
    
  ENDMETHOD.

ENDCLASS.