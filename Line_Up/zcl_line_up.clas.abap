CLASS zcl_line_up DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS format IMPORTING name          TYPE string
                             number        TYPE i
                   RETURNING VALUE(result) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_line_up IMPLEMENTATION.
  METHOD format.
  
          " Variable para almacenar la unidad del número
    DATA: lv_last_number TYPE i,
          " Variable para almacenar el sufijo
          lv_sufix TYPE string.

    " Cogemos la unidad cogiendo el resto de la división entre 10
    lv_last_number = number MOD 10.

    " Comprobamos que número es
    CASE lv_last_number.
      WHEN 1.
        " Si es 11, entonces th, sino st
        IF number = 11.
          lv_sufix = 'th'.
        ELSE.
          lv_sufix = 'st'.
        ENDIF.
      WHEN 2.
        " Si es 12, entonces th, sino nd
        IF number = 12.
          lv_sufix = 'th'.
        ELSE.
          lv_sufix = 'nd'.
        ENDIF.
      WHEN 3.
        " Si es 13, entonces th, sino rd
        IF number = 13.
          lv_sufix = 'th'.
        ELSE.
          lv_sufix = 'rd'.
        ENDIF.
      WHEN OTHERS.
        " Si no acaba en 1, 2 o 3, será th
        lv_sufix = 'th'.
    ENDCASE.
    
      " Asignamos la cadena del result
      result = |{ name }, you are the { number }{ lv_sufix } customer we serve today. Thank you!|.
  
  ENDMETHOD.

ENDCLASS.