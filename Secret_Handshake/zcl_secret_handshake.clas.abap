CLASS zcl_secret_handshake DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_commands
      IMPORTING code            TYPE i
      RETURNING VALUE(commands) TYPE string_table.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_secret_handshake IMPLEMENTATION.

  METHOD get_commands.

          " Variable para almacenar un bit del número binario
    DATA: lv_bit TYPE i,
          " Variable para almacenar el número pasado por parámetro
          lv_code TYPE i,
          " Variable para almacenar el índice del bucle
          lv_index TYPE i VALUE 1,
          " Variable para comprobar si hay que invertir o no las acciones
          lv_reverse TYPE abap_bool,
          " Tabla para almacenar los comandos en orden normal
          lt_commands TYPE string_table,
          " Tabla para almacenar los comandos a la inversa
          lt_reversed_commands TYPE string_table,
          " Variable para recorrer el bucle para invertir los comandos
          ls_command TYPE string,
          " Variable para almacenar el nuevo número para dividir y coger el bit
          lv_temp TYPE i.

    " Asignamos el número pasado por parámetro
    lv_code = code.

    " Bucle con cinco iteraciones
    DO 5 TIMES.

      " Cogemos el nuevo número para coger el resto
      lv_temp = lv_code DIV ( 2 ** ( lv_index - 1 ) ).
      
      " Cogemos el nuevo bit
      lv_bit = lv_temp MOD 2.

      " Si el bit es 1, entonces comprobamos el número del indice, dependiendo de cual sea
      " añadimos una opción u otra
      IF lv_bit = 1.
        CASE lv_index.
          WHEN 1.
            APPEND 'wink' TO lt_commands.
          WHEN 2.
            APPEND 'double blink' TO lt_commands.
          WHEN 3.
            APPEND 'close your eyes' TO lt_commands.
          WHEN 4.
            APPEND 'jump' TO lt_commands.
          WHEN 5.
            " Si el último es 1, entonces se invierten las opciones
            lv_reverse = abap_true.
        ENDCASE.
      ENDIF.

      " Sumamos uno al índice
      lv_index = lv_index + 1.
      
    ENDDO.

    " Si la variable booleana de invertir es true, entonces se recorre la tabla de comandos
    " para invertirlos
    IF lv_reverse = abap_true.
      LOOP AT lt_commands INTO ls_command.
        INSERT ls_command INTO lt_reversed_commands INDEX 1.
      ENDLOOP.
      commands = lt_reversed_commands.
    ELSE.
      commands = lt_commands.
    ENDIF.
    
  ENDMETHOD.

ENDCLASS.