CLASS zcl_elyses_enchantments DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES ty_stack TYPE STANDARD TABLE OF i WITH EMPTY KEY.

    "! Get card at position
    METHODS get_item
      IMPORTING stack         TYPE ty_stack
                position      TYPE i
      RETURNING VALUE(result) TYPE i.

    "! Replace card at position
    METHODS set_item
      IMPORTING stack         TYPE ty_stack
                position      TYPE i
                replacement   TYPE i
      RETURNING VALUE(result) TYPE ty_stack.

    "Add card to stack
    METHODS insert_item_at_top
      IMPORTING stack         TYPE ty_stack
                new_card      TYPE i
      RETURNING VALUE(result) TYPE ty_stack.

    "! Remove card at position
    METHODS remove_item
      IMPORTING stack         TYPE ty_stack
                position      TYPE i
      RETURNING VALUE(result) TYPE ty_stack.

    "! Remove top card (last row)
    METHODS remove_item_from_top
      IMPORTING stack         TYPE ty_stack
      RETURNING VALUE(result) TYPE ty_stack.

    "! Add card to bottom of stack (first row)
    METHODS insert_item_at_bottom
      IMPORTING stack         TYPE ty_stack
                new_card      TYPE i
      RETURNING VALUE(result) TYPE ty_stack.

    "! Remove bottom card (delete first row)
    METHODS remove_item_from_bottom
      IMPORTING stack         TYPE ty_stack
      RETURNING VALUE(result) TYPE ty_stack.

    "! Count cards
    METHODS get_size_of_stack
      IMPORTING stack         TYPE ty_stack
      RETURNING VALUE(result) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_elyses_enchantments IMPLEMENTATION.

  METHOD get_item.
  
    " Almacenamos en el result el registro correspondiente a la position del stack 
    READ TABLE stack INDEX position INTO result.
    
  ENDMETHOD.


  METHOD set_item.

    " Asignamos al result el stack pasado por parámetro
    result = stack.

    " Comprobamos si el result tiene un valor en la position pasada por parámetro
    READ TABLE result INDEX position TRANSPORTING NO FIELDS.

    " Si la tiene, entonces reemplazamos el valor por el replacement
    IF sy-subrc IS INITIAL.
      result[ position ] = replacement.
    ENDIF.
    
  ENDMETHOD.


  METHOD insert_item_at_top.

    " Asignamos al result el stack pasado por parámetro
    result = stack.

    " Añadimos la new_card al result
    APPEND new_card TO result.
    
  ENDMETHOD.


  METHOD get_size_of_stack.
  
    " Asignamos al result el número de lineas del stack
    result = lines( stack ).
    
  ENDMETHOD.


  METHOD insert_item_at_bottom.

    " Asignamos al result el stack pasado por parámetro
    result = stack.

    " Insertamos en la primera posición la new card
    INSERT new_card INTO result INDEX 1.
  
  ENDMETHOD.


  METHOD remove_item.

    " Asignamos al result el stack pasado por parámetro
    result = stack.

    " Eliminamos el valor correspondiente a la position
    DELETE result INDEX position.
    
  ENDMETHOD.


  METHOD remove_item_from_bottom.

    " Asignamos al result el stack pasado por parámetro
    result = stack.

    " Eliminamos el primer valor del stack
    DELETE result INDEX 1.
    
  ENDMETHOD.


  METHOD remove_item_from_top.

    " Asignamos al result el stack pasado por parámetro
    result = stack.

    " Eliminamos el último valor del stack
    DELETE result INDEX lines( result ).
  
  ENDMETHOD.

ENDCLASS.