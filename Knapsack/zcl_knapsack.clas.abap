CLASS zcl_knapsack DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    TYPES: BEGIN OF item_type,
             weight TYPE i,
             value  TYPE i,
           END OF item_type.
    TYPES items_type TYPE TABLE OF item_type.
    METHODS get_max_possible_value
      IMPORTING weight_limit     TYPE i
                items            TYPE items_type
      RETURNING VALUE(max_value) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_knapsack IMPLEMENTATION.
  METHOD get_max_possible_value.

    DATA: dp        TYPE STANDARD TABLE OF i WITH EMPTY KEY,
          cap       TYPE i,
          candidate TYPE i.

    " dp[cap+1] guarda el mejor valor alcanzable con capacidad "cap"
    " (se usa +1 porque las tablas ABAP empiezan en el índice 1)
    DO weight_limit + 1 TIMES.
      APPEND 0 TO dp.
    ENDDO.

    LOOP AT items INTO DATA(item).

      " Si el item pesa más que el límite, no puede entrar nunca
      IF item-weight > weight_limit.
        CONTINUE.
      ENDIF.

      " Recorremos las capacidades de mayor a menor para no
      " reutilizar el mismo item más de una vez (0/1 knapsack)
      cap = weight_limit.
      WHILE cap >= item-weight.

        candidate = dp[ cap - item-weight + 1 ] + item-value.

        IF candidate > dp[ cap + 1 ].
          dp[ cap + 1 ] = candidate.
        ENDIF.

        cap = cap - 1.
      ENDWHILE.

    ENDLOOP.

    max_value = dp[ weight_limit + 1 ].

  ENDMETHOD.
ENDCLASS.
