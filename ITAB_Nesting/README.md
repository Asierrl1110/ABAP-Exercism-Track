# ITAB Nesting

## 🧠 Descripción

Este ejercicio te introduce en cómo **anidar datos de múltiples tablas internas en ABAP** (*internal tables*) para construir una estructura de datos más compleja.  
Se te proporcionan tres tablas internas con distintos conjuntos de datos: `ARTISTS`, `ALBUMS` y `SONGS`. Tu reto es combinarlos en una única tabla interna anidada, siguiendo una jerarquía lógica: primero los artistas, luego sus álbumes y finalmente las canciones de cada álbum.

## 🎯 Objetivo

- Leer tres tablas internas: `ARTISTS`, `ALBUMS` y `SONGS`.
- Anidar la tabla de `SONGS` dentro de la de `ALBUMS`, y la tabla de `ALBUMS` dentro de la de `ARTISTS`.
- Construir una nueva tabla interna `nested_data` que represente una estructura jerárquica de artistas → álbumes → canciones.

## 📋 Tablas internas de entrada

### ARTISTS

| ARTIST_ID | ARTIST_NAME |
|-----------|--------------|
| 1         | Godsmack     |
| 2         | Shinedown    |

### ALBUMS

| ARTIST_ID | ALBUM_ID | ALBUM_NAME             |
|-----------|----------|------------------------|
| 1         | 1        | Faceless               |
| 1         | 2        | When Legends Rise      |
| 2         | 1        | The Sound of Madness   |
| 2         | 2        | Planet Zero            |

### SONGS

| ARTIST_ID | ALBUM_ID | SONG_ID | SONG_NAME             |
|-----------|----------|---------|-----------------------|
| 1         | 1        | 1       | Straight Out Of Line  |
| 1         | 1        | 2       | Changes               |
| 1         | 2        | 1       | Bullet Proof          |
| 1         | 2        | 2       | Under Your Scars      |
| 2         | 1        | 1       | Second Chance         |
| 2         | 1        | 2       | Breaking Inside       |
| 2         | 2        | 1       | Dysfunctional You     |
| 2         | 2        | 2       | Daylight              |

## 📌 Estructura de datos esperada

Define una tabla interna anidada con esta estructura:

```abap
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

TYPES: nested_data TYPE STANDARD TABLE OF artist_album_nested_type WITH KEY artist_id.