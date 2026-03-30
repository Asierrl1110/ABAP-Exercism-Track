CLASS zcl_triangle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      is_equilateral
        IMPORTING
          side_a             TYPE f
          side_b             TYPE f
          side_c             TYPE f
        RETURNING
          VALUE(result)      TYPE abap_bool
        RAISING
          cx_parameter_invalid,
      is_isosceles
        IMPORTING
          side_a             TYPE f
          side_b             TYPE f
          side_c             TYPE f
        RETURNING
          VALUE(result)      TYPE abap_bool
        RAISING
          cx_parameter_invalid,
      is_scalene
        IMPORTING
          side_a             TYPE f
          side_b             TYPE f
          side_c             TYPE f
        RETURNING
          VALUE(result)      TYPE abap_bool
        RAISING
          cx_parameter_invalid.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_triangle IMPLEMENTATION.

  METHOD is_equilateral.
  
    " En caso de que algún lado sea 0 o valor negativo, lanzamos una excepción
    IF side_a <= 0 OR side_b <= 0 OR side_c <= 0.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    " Si no se cumple esta regla de la longitud de los lados, lanzamos una excepción
    " a + b >= c
    " b + c >= a
    " a + c >= b
    IF side_a + side_b < side_c OR side_b + side_c < side_a OR side_a + side_c < side_b.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    " Si los tres lados son iguales, entonces el triangulo si es equilatero
    IF side_a = side_b AND side_a = side_c.
      result = abap_true.
    ELSE.
      result = abap_false.
    ENDIF.
    
  ENDMETHOD.

  METHOD is_isosceles.
  
    " En caso de que algún lado sea 0 o valor negativo, lanzamos una excepción
    IF side_a <= 0 OR side_b <= 0 OR side_c <= 0.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    " Si no se cumple esta regla de la longitud de los lados, lanzamos una excepción
    " a + b >= c
    " b + c >= a
    " a + c >= b
    IF side_a + side_b < side_c OR side_b + side_c < side_a OR side_a + side_c < side_b.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    " Si dos lados son iguales, entonces el triangulo es isosceles
    IF side_a = side_b OR side_a = side_c OR side_b = side_c.
      result = abap_true.
    ELSE.
      result = abap_false.
    ENDIF.
    
  ENDMETHOD.

  METHOD is_scalene.
  
    " En caso de que algún lado sea 0 o valor negativo, lanzamos una excepción
    IF side_a <= 0 OR side_b <= 0 OR side_c <= 0.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    " Si no se cumple esta regla de la longitud de los lados, lanzamos una excepción
    " a + b >= c
    " b + c >= a
    " a + c >= b
    IF side_a + side_b < side_c OR side_b + side_c < side_a OR side_a + side_c < side_b.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    " Si los tres lados son distintos, entonces el triangulo es escaleno
    IF side_a <> side_b AND side_a <> side_c AND side_b <> side_c.
      result = abap_true.
    ELSE.
      result = abap_false.
    ENDIF.
  
  ENDMETHOD.

ENDCLASS.