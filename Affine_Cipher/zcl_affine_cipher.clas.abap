CLASS zcl_affine_cipher DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF key,
             a TYPE i,
             b TYPE i,
           END OF key.
    METHODS:
      encode IMPORTING phrase        TYPE string
                       key           TYPE key
             RETURNING VALUE(cipher) TYPE string
             RAISING   cx_parameter_invalid,
      decode IMPORTING cipher        TYPE string
                       key           TYPE key
             RETURNING VALUE(phrase) TYPE string
             RAISING   cx_parameter_invalid.

  PROTECTED SECTION.

  PRIVATE SECTION.
    CONSTANTS: mc_m         TYPE i      VALUE 26,
               mc_alphabet  TYPE string VALUE 'abcdefghijklmnopqrstuvwxyz'.

    METHODS:
      gcd           IMPORTING iv_a          TYPE i
                              iv_b          TYPE i
                    RETURNING VALUE(rv_gcd) TYPE i,
      mmi           IMPORTING iv_a          TYPE i
                    RETURNING VALUE(rv_mmi) TYPE i,
      validate_key  IMPORTING iv_a TYPE i
                    RAISING   cx_parameter_invalid,
      modulo        IMPORTING iv_x            TYPE i
                              iv_m            TYPE i
                    RETURNING VALUE(rv_modulo) TYPE i.
ENDCLASS.


CLASS zcl_affine_cipher IMPLEMENTATION.

  METHOD gcd.
    DATA(lv_a) = iv_a.
    DATA(lv_b) = iv_b.
    WHILE lv_b <> 0.
      DATA(lv_t) = lv_b.
      lv_b = lv_a MOD lv_b.
      lv_a = lv_t.
    ENDWHILE.
    rv_gcd = lv_a.
  ENDMETHOD.

  METHOD modulo.
    rv_modulo = iv_x MOD iv_m.
    IF rv_modulo < 0.
      rv_modulo = rv_modulo + iv_m.
    ENDIF.
  ENDMETHOD.

  METHOD mmi.
    DATA lv_x TYPE i.
    DO mc_m TIMES.
      lv_x = sy-index - 1.
      IF modulo( iv_x = iv_a * lv_x  iv_m = mc_m ) = 1.
        rv_mmi = lv_x.
        RETURN.
      ENDIF.
    ENDDO.
  ENDMETHOD.

  METHOD validate_key.
    IF gcd( iv_a = iv_a  iv_b = mc_m ) <> 1.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
  ENDMETHOD.

  METHOD encode.
    validate_key( key-a ).

    DATA lv_char    TYPE c LENGTH 1.
    DATA lv_result  TYPE string.
    DATA lv_index   TYPE i.
    DATA lv_enc_idx TYPE i.

    DATA(lv_lower) = to_lower( phrase ).
    DATA(lv_len)   = strlen( lv_lower ).

    DO lv_len TIMES.
      lv_index = sy-index - 1.
      lv_char  = lv_lower+lv_index(1).

      IF lv_char CA 'abcdefghijklmnopqrstuvwxyz'.
        DATA(lv_pos) = find( val = mc_alphabet  sub = lv_char ).
        lv_enc_idx   = modulo( iv_x = key-a * lv_pos + key-b  iv_m = mc_m ).
        lv_result    = lv_result && mc_alphabet+lv_enc_idx(1).
      ELSEIF lv_char CA '0123456789'.
        lv_result = lv_result && lv_char.
      ENDIF.
      " espacios y signos de puntuación se descartan
    ENDDO.

    " Agrupar en bloques de 5 caracteres separados por espacio
    DATA lv_group   TYPE string.
    DATA(lv_reslen) = strlen( lv_result ).

    DO lv_reslen TIMES.
      lv_index = sy-index - 1.
      IF lv_index > 0 AND lv_index MOD 5 = 0.
        lv_group = lv_group && ` `.
      ENDIF.
      lv_group = lv_group && lv_result+lv_index(1).
    ENDDO.

    cipher = lv_group.
  ENDMETHOD.

  METHOD decode.
    validate_key( key-a ).

    DATA(lv_ainv) = mmi( key-a ).

    DATA lv_char    TYPE c LENGTH 1.
    DATA lv_result  TYPE string.
    DATA lv_index   TYPE i.
    DATA lv_dec_idx TYPE i.

    DATA(lv_clean) = cipher.
    REPLACE ALL OCCURRENCES OF ` ` IN lv_clean WITH ``.
    lv_clean = to_lower( lv_clean ).

    DATA(lv_len) = strlen( lv_clean ).

    DO lv_len TIMES.
      lv_index = sy-index - 1.
      lv_char  = lv_clean+lv_index(1).

      IF lv_char CA 'abcdefghijklmnopqrstuvwxyz'.
        DATA(lv_pos) = find( val = mc_alphabet  sub = lv_char ).
        lv_dec_idx   = modulo( iv_x = lv_ainv * ( lv_pos - key-b )  iv_m = mc_m ).
        lv_result    = lv_result && mc_alphabet+lv_dec_idx(1).
      ELSEIF lv_char CA '0123456789'.
        lv_result = lv_result && lv_char.
      ENDIF.
    ENDDO.

    phrase = lv_result.
  ENDMETHOD.

ENDCLASS.