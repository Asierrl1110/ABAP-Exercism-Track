CLASS zcl_eliuds_eggs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS egg_count IMPORTING number       TYPE i
                      RETURNING VALUE(count) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_eliuds_eggs IMPLEMENTATION.
  METHOD egg_count.

    " Dividimos el número mientras sea superior a 2
    WHILE number > 0.
  
      " Comprobamos el resto del número entre 2, si es 1 entonces sumamos 1 al contador
      IF number MOD 2 = 1.
        count = count + 1.
      ENDIF.
  
      " Dividimos el número entre 2
      number = number DIV 2.
      
    ENDWHILE.
    
  ENDMETHOD.
  
ENDCLASS.