CLASS zcl_collatz_conjecture DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS ret_steps IMPORTING num          TYPE i
                      RETURNING VALUE(steps) TYPE i
                      RAISING   cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_collatz_conjecture IMPLEMENTATION.
  METHOD ret_steps.

    " Si el número pasado por parámetro es cero o negativo, se lanza una excepción
    IF num <= 0.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    " Variable para almacenar una copia del num pasado por parámetro
    DATA: lv_num TYPE i.

    " Almacenamos una copia del número pasado por parámetro
    lv_num = num.

    " Bucle que se ejecuta mientras que el número sea superior a 1
    WHILE lv_num > 1.

      " En caso de que sea par, dividimos entre 2
      " Si es impar, multiplicamos por 3 y sumamos 1
      IF lv_num MOD 2 = 0.
        lv_num = lv_num / 2.
      ELSE.
        lv_num = lv_num * 3 + 1.
      ENDIF.

      " Sumamos uno al paso
      steps = steps + 1.
      
    ENDWHILE.
    
  ENDMETHOD.
  
ENDCLASS.