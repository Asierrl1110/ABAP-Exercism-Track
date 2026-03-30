CLASS zcl_itab_nesting DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF artists_type,
             artist_id   TYPE string,
             artist_name TYPE string,
           END OF artists_type.
    TYPES artists TYPE STANDARD TABLE OF artists_type WITH KEY artist_id.
    TYPES: BEGIN OF albums_type,
             artist_id  TYPE string,
             album_id   TYPE string,
             album_name TYPE string,
           END OF albums_type.
    TYPES albums TYPE STANDARD TABLE OF albums_type WITH KEY artist_id album_id.
    TYPES: BEGIN OF songs_type,
             artist_id TYPE string,
             album_id  TYPE string,
             song_id   TYPE string,
             song_name TYPE string,
           END OF songs_type.
    TYPES songs TYPE STANDARD TABLE OF songs_type WITH KEY artist_id album_id song_id.


    TYPES: BEGIN OF song_nested_type,
             song_id   TYPE string,
             song_name TYPE string,
           END OF song_nested_type.
    TYPES: BEGIN OF album_song_nested_type,
             album_id   TYPE string,
             album_name TYPE string,
             songs      TYPE STANDARD TABLE OF song_nested_type WITH KEY song_id,
           END OF album_song_nested_type.
    TYPES: BEGIN OF artist_album_nested_type,
             artist_id   TYPE string,
             artist_name TYPE string,
             albums      TYPE STANDARD TABLE OF album_song_nested_type WITH KEY album_id,
           END OF artist_album_nested_type.
    TYPES nested_data TYPE STANDARD TABLE OF artist_album_nested_type WITH KEY artist_id.

    METHODS perform_nesting
      IMPORTING
        artists            TYPE artists
        albums             TYPE albums
        songs              TYPE songs
      RETURNING
        VALUE(nested_data) TYPE nested_data.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_itab_nesting IMPLEMENTATION.

  METHOD perform_nesting.

          " Estructura de la tabla final
    DATA: ls_nested_data TYPE artist_album_nested_type,
          " Estructura de la tabla de albumes
          ls_album_nested TYPE album_song_nested_type,
          " Estructura de la tabla de canciones
          ls_song_nested TYPE song_nested_type,
          " Tabla interna de albumes filtrada por id de artista
          lt_filtered_album TYPE albums,
          " Tabla interna de canciones filtrada por id de artista e id de album
          lt_filtered_song TYPE songs.

    " Recorremos la tabla de artistas
    LOOP AT artists INTO DATA(ls_artist).
    
      " Asignamos los valores del artista
      CLEAR ls_nested_data.
      ls_nested_data-artist_id = ls_artist-artist_id.
      ls_nested_data-artist_name = ls_artist-artist_name.

        " Recorremos los albumes correspondiente al artista
        LOOP AT albums INTO DATA(ls_album) WHERE artist_id = ls_artist-artist_id.
        
          " Asignamos los valores del album
          CLEAR ls_album_nested.
          ls_album_nested-album_id = ls_album-album_id.
          ls_album_nested-album_name = ls_album-album_name.

            " Recorremos las canciones correspondientes al artista y al album
            LOOP AT songs INTO DATA(ls_song) 
            WHERE artist_id = ls_album-artist_id 
            AND album_id = ls_album-album_id.
            
              " Asignamos los valores de la canción y
              " la añadimos a la tabla de canciones del album,
              CLEAR ls_song_nested.
              ls_song_nested-song_id = ls_song-song_id.
              ls_song_nested-song_name = ls_song-song_name.
              APPEND ls_song_nested TO ls_album_nested-songs.
              
            ENDLOOP.

          " Añadimos el album a la tabla de albumes del artista
          APPEND ls_album_nested TO ls_nested_data-albums.
        ENDLOOP.

      " Añadimos el registro a la tabla interna
      APPEND ls_nested_data TO nested_data.
      
    ENDLOOP.
    
  ENDMETHOD.

ENDCLASS.