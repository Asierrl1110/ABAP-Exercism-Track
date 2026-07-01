CLASS zcl_state_of_tic_tac_toe DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.
  PUBLIC SECTION.
    TYPES player_type TYPE c LENGTH 1.
    "! E.g., ( ( `XOO` ) ( ` X ` ) ( `  X` ) )
    TYPES board_type TYPE TABLE OF string INITIAL SIZE 3.
    CONSTANTS: BEGIN OF player_enum,
                 one TYPE player_type VALUE 'X',
                 two TYPE player_type VALUE 'O',
               END OF player_enum.
    CONSTANTS: BEGIN OF state_enum,
                 ongoing_game TYPE string VALUE `Ongoing game`,
                 draw         TYPE string VALUE `Draw`,
                 win          TYPE string VALUE `Win`,
               END OF state_enum.
    "! @parameter state | Possible values are enumerated in state_enum
    "! @raising cx_parameter_invalid | Board is invalid
    METHODS get_state
      IMPORTING board        TYPE board_type
      RETURNING VALUE(state) TYPE string
      RAISING   cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS has_won
      IMPORTING board         TYPE board_type
                player        TYPE player_type
      RETURNING VALUE(result) TYPE abap_bool.
ENDCLASS.


CLASS zcl_state_of_tic_tac_toe IMPLEMENTATION.

  METHOD get_state.
    DATA lv_x_count TYPE i.
    DATA lv_o_count TYPE i.
    DATA lv_row      TYPE string.
    DATA lv_char     TYPE c LENGTH 1.
    DATA lv_off      TYPE i.
    DATA lv_x_wins   TYPE abap_bool.
    DATA lv_o_wins   TYPE abap_bool.

    " --- Validación estructural básica ---
    IF lines( board ) <> 3.
      RAISE EXCEPTION TYPE cx_parameter_invalid
        EXPORTING parameter = 'BOARD'.
    ENDIF.

    LOOP AT board INTO lv_row.
      IF strlen( lv_row ) <> 3.
        RAISE EXCEPTION TYPE cx_parameter_invalid
          EXPORTING parameter = 'BOARD'.
      ENDIF.

      DO 3 TIMES.
        lv_off = sy-index - 1.
        lv_char = lv_row+lv_off(1).
        CASE lv_char.
          WHEN player_enum-one.
            lv_x_count = lv_x_count + 1.
          WHEN player_enum-two.
            lv_o_count = lv_o_count + 1.
          WHEN ' '.
            " celda vacía, ok
          WHEN OTHERS.
            RAISE EXCEPTION TYPE cx_parameter_invalid
              EXPORTING parameter = 'BOARD'.
        ENDCASE.
      ENDDO.
    ENDLOOP.

    " --- Validación de orden de turnos ---
    " X empieza, por lo que #X = #O  ó  #X = #O + 1
    IF lv_x_count <> lv_o_count AND lv_x_count <> lv_o_count + 1.
      RAISE EXCEPTION TYPE cx_parameter_invalid
        EXPORTING parameter = 'BOARD'.
    ENDIF.

    " --- Comprobación de victorias ---
    lv_x_wins = has_won( board = board player = player_enum-one ).
    lv_o_wins = has_won( board = board player = player_enum-two ).

    " No pueden ganar ambos a la vez
    IF lv_x_wins = abap_true AND lv_o_wins = abap_true.
      RAISE EXCEPTION TYPE cx_parameter_invalid
        EXPORTING parameter = 'BOARD'.
    ENDIF.

    " Si X gana, tuvo que jugar la última ficha -> #X = #O + 1
    IF lv_x_wins = abap_true AND lv_x_count <> lv_o_count + 1.
      RAISE EXCEPTION TYPE cx_parameter_invalid
        EXPORTING parameter = 'BOARD'.
    ENDIF.

    " Si O gana, tuvo que jugar la última ficha -> #X = #O
    IF lv_o_wins = abap_true AND lv_x_count <> lv_o_count.
      RAISE EXCEPTION TYPE cx_parameter_invalid
        EXPORTING parameter = 'BOARD'.
    ENDIF.

    " --- Determinar el estado ---
    IF lv_x_wins = abap_true OR lv_o_wins = abap_true.
      state = state_enum-win.
    ELSEIF lv_x_count + lv_o_count = 9.
      state = state_enum-draw.
    ELSE.
      state = state_enum-ongoing_game.
    ENDIF.
  ENDMETHOD.


  METHOD has_won.
    DATA lv_r0 TYPE string.
    DATA lv_r1 TYPE string.
    DATA lv_r2 TYPE string.
    DATA lv_line TYPE string.
    DATA lv_off TYPE i.

    result = abap_false.

    lv_r0 = board[ 1 ].
    lv_r1 = board[ 2 ].
    lv_r2 = board[ 3 ].

    lv_line = |{ player }{ player }{ player }|.

    " Filas
    IF lv_r0 = lv_line OR lv_r1 = lv_line OR lv_r2 = lv_line.
      result = abap_true.
      RETURN.
    ENDIF.

    " Columnas
    DO 3 TIMES.
      lv_off = sy-index - 1.
      IF lv_r0+lv_off(1) = player AND
         lv_r1+lv_off(1) = player AND
         lv_r2+lv_off(1) = player.
        result = abap_true.
        RETURN.
      ENDIF.
    ENDDO.

    " Diagonal principal
    IF lv_r0+0(1) = player AND lv_r1+1(1) = player AND lv_r2+2(1) = player.
      result = abap_true.
      RETURN.
    ENDIF.

    " Diagonal secundaria
    IF lv_r0+2(1) = player AND lv_r1+1(1) = player AND lv_r2+0(1) = player.
      result = abap_true.
      RETURN.
    ENDIF.
  ENDMETHOD.

ENDCLASS.