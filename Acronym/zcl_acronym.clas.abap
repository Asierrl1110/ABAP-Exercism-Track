CLASS zcl_acronym DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS parse IMPORTING phrase         TYPE string
                  RETURNING VALUE(acronym) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_acronym IMPLEMENTATION.

  METHOD parse.

          " Tabla para almacenar las palabras de la frase
    DATA: lt_words TYPE string_table.

    " Pasamos la frase a mayúsculas
    TRANSLATE phrase TO UPPER CASE.

    " Sustituimos los guiones y barra bajas por espacios en blanco
    TRANSLATE phrase USING '- _ '.

    " Separamos las palabras y las guardamos en la tabla
    SPLIT condense( phrase ) AT ' ' INTO TABLE lt_words.

    " Recorremos las palabras y concatenamos la primera letra de cada palabra
    " al acrónimo
    LOOP AT lt_words INTO DATA(lv_word).
      acronym = acronym && lv_word(1).
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.