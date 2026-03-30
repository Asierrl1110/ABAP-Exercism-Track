# High Scores

## Descripción

Gestiona una lista de puntuaciones (*scores*) de un jugador en un juego clásico similar a *Frogger*. Debes implementar métodos que permitan consultar información útil sobre esas puntuaciones.

## Objetivo

Implementar en ABAP los siguientes comportamientos:

- Devolver la lista completa de puntuaciones tal como fue proporcionada.
- Devolver la última puntuación añadida.
- Devolver la mejor puntuación (*personal best*), es decir, el valor máximo.
- Devolver las tres mejores puntuaciones de forma descendente.

## Instrucciones para implementar

1. Crea una clase o conjunto de métodos que reciban una tabla de puntuaciones (`scores`) como entrada.
2. Implementa métodos que permitan:
   - `list_scores`: devolver todas las puntuaciones en el orden original.
   - `latest_score`: devolver la última puntuación de la lista.
   - `personal_best`: devolver la puntuación más alta.
   - `top_three`: devolver las tres puntuaciones más altas en orden descendente.

## Ejemplos de uso

Imagina la lista de puntuaciones:
[30, 50, 20, 70]

- `list_scores` → devuelve `[30, 50, 20, 70]`
- `latest_score` → devuelve `70`
- `personal_best` → devuelve `70`
- `top_three` → devuelve `[70, 50, 30]`
