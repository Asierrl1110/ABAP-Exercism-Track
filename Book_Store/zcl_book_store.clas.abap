CLASS zcl_book_store DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES book_id TYPE i.
    TYPES basket_type TYPE SORTED TABLE OF book_id
      WITH NON-UNIQUE KEY table_line.
    TYPES total TYPE p LENGTH 8 DECIMALS 2.

    METHODS calculate_total
      IMPORTING basket       TYPE basket_type
      RETURNING VALUE(total) TYPE total.

  PRIVATE SECTION.
    METHODS get_group_price
      IMPORTING iv_size         TYPE i
      RETURNING VALUE(rv_price) TYPE total.
ENDCLASS.


CLASS zcl_book_store IMPLEMENTATION.

  METHOD get_group_price.
    DATA lv_discount TYPE p LENGTH 8 DECIMALS 2.

    CASE iv_size.
      WHEN 1. lv_discount = '0.00'.
      WHEN 2. lv_discount = '0.05'.
      WHEN 3. lv_discount = '0.10'.
      WHEN 4. lv_discount = '0.20'.
      WHEN 5. lv_discount = '0.25'.
      WHEN OTHERS. lv_discount = '0.00'.
    ENDCASE.

    rv_price = iv_size * 8 * ( 1 - lv_discount ).
  ENDMETHOD.


  METHOD calculate_total.
    DATA: lt_counts     TYPE STANDARD TABLE OF i WITH DEFAULT KEY,
          lt_groups     TYPE STANDARD TABLE OF i WITH DEFAULT KEY,
          lv_group_size TYPE i,
          lv_remaining  TYPE i.

    " Inicializar contadores para los 5 títulos (índices 1..5)
    lt_counts = VALUE #( ( 0 ) ( 0 ) ( 0 ) ( 0 ) ( 0 ) ).

    " Contar cuántos ejemplares hay de cada título en la cesta
    LOOP AT basket INTO DATA(lv_book).
      READ TABLE lt_counts INDEX lv_book INTO DATA(lv_val).
      lv_val += 1.
      MODIFY lt_counts INDEX lv_book FROM lv_val.
    ENDLOOP.

    lv_remaining = REDUCE i( INIT s = 0 FOR wa IN lt_counts NEXT s = s + wa ).

    " Formar grupos de forma "greedy": en cada vuelta se coge un
    " ejemplar de cada título que todavía tenga stock, formando así
    " el grupo más grande posible en ese momento.
    WHILE lv_remaining > 0.
      lv_group_size = 0.
      DO 5 TIMES.
        READ TABLE lt_counts INDEX sy-index INTO DATA(lv_c).
        IF lv_c > 0.
          lv_c -= 1.
          MODIFY lt_counts INDEX sy-index FROM lv_c.
          lv_group_size += 1.
          lv_remaining -= 1.
        ENDIF.
      ENDDO.
      APPEND lv_group_size TO lt_groups.
    ENDWHILE.

    " Optimización conocida de este problema: un grupo de 5 y otro de
    " 3 libros salen más baratos repartidos como dos grupos de 4.
    " Se aplica el cambio tantas veces como parejas (5,3) existan.
    LOOP AT lt_groups ASSIGNING FIELD-SYMBOL(<lv_g1>).
      IF <lv_g1> = 5.
        READ TABLE lt_groups WITH KEY table_line = 3
             ASSIGNING FIELD-SYMBOL(<lv_g2>).
        IF sy-subrc = 0.
          <lv_g1> = 4.
          <lv_g2> = 4.
        ENDIF.
      ENDIF.
    ENDLOOP.

    " Calcular el precio total sumando el precio de cada grupo
    total = 0.
    LOOP AT lt_groups INTO DATA(lv_group).
      total += get_group_price( lv_group ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.