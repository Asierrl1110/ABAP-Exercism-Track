CLASS zcl_protein_translation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS proteins
      IMPORTING
        strand        TYPE string
      RETURNING
        VALUE(result) TYPE string_table
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_protein_translation IMPLEMENTATION.
  METHOD proteins.

          " Variable que almacena la longitud del strand
    DATA: lv_len TYPE i,
          " Variable que almacena el offset para leer cada conjunto de 3
          lv_offset TYPE i VALUE 0,
          " Variable para almacenar el rna
          lv_rna TYPE string.

    " Almacenamos la longitud del strand
    lv_len = strlen( strand ).

    " Bucle que se ejecuta mientras el offset sea inferior a la longitud del strand
    WHILE lv_offset < lv_len.

      " Cogemos el rna
      lv_rna = strand+lv_offset(3).

      " Comprobamos que rna es y añadimos su amino acid correspondiente
      IF lv_rna = 'AUG'.
        APPEND 'Methionine' TO result.
      ELSEIF lv_rna = 'UUU' OR lv_rna = 'UUC'.
        APPEND 'Phenylalanine' TO result.        
      ELSEIF lv_rna = 'UUA' OR lv_rna = 'UUG'.
        APPEND 'Leucine' TO result.
      ELSEIF lv_rna = 'UCU' OR lv_rna = 'UCC' OR lv_rna = 'UCA' OR lv_rna = 'UCG'.
        APPEND 'Serine' TO result.
      ELSEIF lv_rna = 'UAU' OR lv_rna = 'UAC'.
        APPEND 'Tyrosine' TO result.
      ELSEIF lv_rna = 'UGU' OR lv_rna = 'UGC'.
        APPEND 'Cysteine' TO result.
      ELSEIF lv_rna = 'UGG'.
        APPEND 'Tryptophan' TO result.
      ELSEIF lv_rna = 'UAA' OR lv_rna = 'UAG' OR lv_rna = 'UGA'.
        " En caso de que sea UAA, UAG o UGA, entonces finaliza el bucle
        EXIT.
      ELSE.
        " En caso de que haya uno que no exista, se lanza una excepción
        RAISE EXCEPTION TYPE cx_parameter_invalid.
      ENDIF.

      " Sumamos tres al offset
      lv_offset = lv_offset + 3.

      " En caso de que la cadena sea incompleta, es decir, que queden menos de 3
      " Se lanza una excepción
      IF lv_len - lv_offset < 3 AND lv_len - lv_offset > 0.
        RAISE EXCEPTION TYPE cx_parameter_invalid.
      ENDIF.
      
    ENDWHILE.
    
  ENDMETHOD.
  
ENDCLASS.