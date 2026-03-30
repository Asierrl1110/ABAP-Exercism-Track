CLASS zcl_clock DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        !hours   TYPE i
        !minutes TYPE i DEFAULT 0.
    METHODS get
      RETURNING
        VALUE(result) TYPE string.
    METHODS add
      IMPORTING
        !minutes TYPE i.
    METHODS sub
      IMPORTING
        !minutes TYPE i.

  PRIVATE SECTION.
    DATA time TYPE t.

ENDCLASS.



CLASS zcl_clock IMPLEMENTATION.

  METHOD add.
    " Sumamos los minutos pasados por parámetro convertidos a segundos
    time = time + minutes * 60.
  ENDMETHOD.


  METHOD constructor.
    " Asignamos al tiempo las horas y los minutos pasados por parámetro
    " Sumamos en segundos
    time = hours * 60 * 60 + minutes * 60.
  ENDMETHOD.


  METHOD get.
    " Parseamos la hora a cadena
     result = time(2) && ':' && time+2(2).
  ENDMETHOD.


  METHOD sub.
    " Restamos los minutos pasados por parámetro convertidos a segundos
    time = time - minutes * 60.
  ENDMETHOD.
  
ENDCLASS.