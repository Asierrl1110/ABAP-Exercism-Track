CLASS zcl_high_scores DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS constructor
      IMPORTING
        scores TYPE integertab.

    METHODS list_scores
      RETURNING
        VALUE(result) TYPE integertab.

    METHODS latest
      RETURNING
        VALUE(result) TYPE i.

    METHODS personalbest
      RETURNING
        VALUE(result) TYPE i.

    METHODS personaltopthree
      RETURNING
        VALUE(result) TYPE integertab.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA scores_list TYPE integertab.

ENDCLASS.


CLASS zcl_high_scores IMPLEMENTATION.

  METHOD constructor.
    me->scores_list = scores.
  ENDMETHOD.

  METHOD list_scores.
    " Asignamos al result la lista de puntuaciones
    result = scores_list.
  ENDMETHOD.

  METHOD latest.
    
    " Ordenamos la lista de puntuaciones de manera ascendente
    SORT scores_list ASCENDING.
    
    " Recorremos la lista de puntuaciones para conseguir la puntuación menos
    LOOP AT scores_list INTO DATA(ls_int).
      
      " En caso de que haya puntuación 0, se ignora
      IF ls_int <> 0.
        result = ls_int.
        EXIT.
      ENDIF.
      
    ENDLOOP.
    
  ENDMETHOD.

  METHOD personalbest.
    
    " Ordenamos la lista de puntuaciones de manera descendente
    SORT scores_list DESCENDING.
    
    " Almacenamos el primer registro de la tabla ordenada en el result
    READ TABLE scores_list INDEX 1 INTO result.
    
  ENDMETHOD.

  METHOD personaltopthree.

    " Ordenamos la lista de puntuaciones de manera descendente
    SORT scores_list DESCENDING.

    " Leemos el primer registro para el top 1 y lo añadimos al result
    READ TABLE scores_list INDEX 1 INTO DATA(ls_score_1).
    IF sy-subrc IS INITIAL.
      APPEND ls_score_1 TO result.
    ENDIF.

    " Leemos el segundo registro para el top 2 y lo añadimos al result
    READ TABLE scores_list INDEX 2 INTO DATA(ls_score_2).
    IF sy-subrc IS INITIAL.
      APPEND ls_score_2 TO result.
    ENDIF.

    " Leemos el tercer registro para el top 3 y lo añadimos al result
    READ TABLE scores_list INDEX 3 INTO DATA(ls_score_3).
    IF sy-subrc IS INITIAL.
      APPEND ls_score_3 TO result.
    ENDIF.
    
  ENDMETHOD.

ENDCLASS.