# Beer Song

## Descripción

En este ejercicio vas a generar la letra de la canción clásica **"99 Bottles of Beer"**.  
La canción consiste en una serie de versos que siguen un patrón repetitivo, decrementando el número de botellas en cada iteración hasta llegar a cero.

## Objetivo

- Crear un método o función en ABAP que genere los versos de la canción.
- El método debe permitir:
  - Generar un solo verso dado un número de botellas.
  - Generar varios versos consecutivos desde un número inicial hasta otro final.

## Reglas de la canción

Cada verso sigue este patrón:
X bottles of beer on the wall, X bottles of beer.
Take one down and pass it around, Y bottles of beer on the wall.


Donde:
- `X` es el número actual de botellas.
- `Y` es el número de botellas después de restar una.

### Casos especiales

Debes manejar correctamente los siguientes casos:

- **Cuando X = 2**
2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.

- **Cuando X = 1**
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.

- **Cuando X = 0**
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.


## Instrucciones para implementar

1. Define un método, por ejemplo `verse`, que reciba un número entero `n`:
 - Devuelve el verso correspondiente a ese número.
2. Define otro método, por ejemplo `sing`, que:
 - Reciba un número inicial y otro final.
 - Genere todos los versos desde el número inicial hasta el final (incluidos).
3. Asegúrate de:
 - Manejar correctamente singular/plural (`bottle` vs `bottles`).
 - Usar las frases especiales en los casos límite (2, 1, 0).
 - Mantener el formato exacto esperado (saltos de línea, puntuación, etc.).
