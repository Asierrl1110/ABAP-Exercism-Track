CLASS zcl_armstrong_numbers DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS is_armstrong_number IMPORTING num           TYPE i
                                RETURNING VALUE(result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_armstrong_numbers IMPLEMENTATION.
  METHOD is_armstrong_number.

          " Variable que almacena el indice del bucle
    DATA: lv_index TYPE i,
          " Variable que almacena el número de digitos del número
          lv_digits TYPE i,
          " Variable que almacena un digito del número
          lv_num TYPE i,
          " Variable que almacena el número elevado
          lv_num_power   TYPE i,
          " Variable que almacena el número pasado por parámetro en una cadena
          lv_num_string TYPE string.

    " Asignamos el número a la cadena
    lv_num_string = num.

    " Cogemos la cantidad de números
    lv_digits = strlen( lv_num_string ).

    " Recorremos un bucle con el número de iteraciones de la longitud del número
    DO lv_digits TIMES.
    
      " Indice menos 1
      lv_index = sy-index - 1.
      
      " Cogemos el número correspondiente
      lv_num = lv_num_string+lv_index(1).
      
      " Sumamos al número la potencia del dígito elevado al número de digitos
      lv_num_power = lv_num_power + ( lv_num ** ( lv_digits - 1 )  ).
      
    ENDDO.

    " Si son iguales, entonces el número es armstrong
    IF lv_num_power = num.
      result = 'X'.
    ENDIF.
    
  ENDMETHOD.
  
ENDCLASS.