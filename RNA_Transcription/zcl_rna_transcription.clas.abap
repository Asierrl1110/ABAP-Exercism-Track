CLASS zcl_rna_transcription DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS
      transcribe
        IMPORTING
          strand             TYPE string
        RETURNING
          VALUE(result)      TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_rna_transcription IMPLEMENTATION.

  METHOD transcribe.
    " Transcribimos el strand siguiendo estas reglas
    " G -> C, C -> G, T -> A, A -> U
    TRANSLATE strand USING 'GCCGTAAU'.
    " Asignamos la strand a result
    result = strand.
  ENDMETHOD.

ENDCLASS.