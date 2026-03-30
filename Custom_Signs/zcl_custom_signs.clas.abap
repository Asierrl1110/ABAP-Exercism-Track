CLASS zcl_custom_signs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    "! Build a sign that includes both of the parameters.
    METHODS build_sign IMPORTING occasion      TYPE string
                                 name          TYPE string
                       RETURNING VALUE(result) TYPE string.

    "! Build a birthday sign that conditionally formats the return string.
    METHODS build_birthday_sign IMPORTING age           TYPE i
                                RETURNING VALUE(result) TYPE string.

    "! Build a graduation sign that includes multiple lines
    METHODS graduation_for IMPORTING name          TYPE string
                                     year          TYPE i
                           RETURNING VALUE(result) TYPE string.

    "! Determine cost based on each character of sign parameter that builds
    "! the template string that includes the currency parameter.
    METHODS cost_of IMPORTING sign          TYPE string
                              currency      TYPE string
                    RETURNING VALUE(result) TYPE string.

ENDCLASS.



CLASS zcl_custom_signs IMPLEMENTATION.


  METHOD build_sign.
    result = |Happy { occasion } { name }!|.
  ENDMETHOD.


  METHOD build_birthday_sign.
    " Si la edad es superior o igual a 50, ponemos 'mature', sino 'young'
    IF age >= 50.
      result = 'Happy Birthday! What a mature fellow you are.'.
    ELSE.
      result = 'Happy Birthday! What a young fellow you are.'.
    ENDIF.
  ENDMETHOD.


  METHOD graduation_for.
    result = |Congratulations { name }!\nClass of { year }|.
  ENDMETHOD.


  METHOD cost_of.

    " Variable que almacena el coste del sign
    DATA: lv_cost TYPE i.

    " Calculamos el coste siendo 20 fijo más 2 por cada letra de la sign
    lv_cost = 20 + strlen( sign ) * 2.

    result = |Your sign costs { lv_cost }.00 { currency }.|.
    
  ENDMETHOD.


ENDCLASS.