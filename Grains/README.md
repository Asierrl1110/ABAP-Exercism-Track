# Grains

## Descripción

En este ejercicio vas a calcular cuántos granos de trigo hay en un tablero de ajedrez si el número de granos **se duplica en cada casilla** comenzando por 1 en la primera casilla. El tablero de ajedrez tiene 64 casillas, y la secuencia de granos comienza así:  
- Casilla 1: 1 grano  
- Casilla 2: 2 granos  
- Casilla 3: 4 granos  
- Casilla 4: 8 granos  
… y así sucesivamente hasta llegar a la casilla 64.

## Objetivo

Implementar en ABAP las siguientes funcionalidades:

- Una función o método que, dado el número de una casilla (del 1 al 64), **devuelva cuántos granos hay en esa casilla**.
- Una función o método que **calcule el total de granos de trigo en todo el tablero**, sumando todos los granos desde la casilla 1 hasta la 64.

## Reglas y notas

- La cantidad de granos en cada casilla sigue una progresión geométrica de razón 2:  
  **granos = 2^(n‑1)**, donde *n* es el número de la casilla.
- El total de granos en un tablero estándar de 64 casillas es un número muy grande que suele requerir tipos numéricos grandes o métodos alternativos como cadenas de texto para representarlo correctamente.

## Instrucciones para implementar

1. Crea una clase o conjunto de métodos en ABAP que reciba el número de casilla.  
2. Calcula cuántos granos hay en esa casilla usando la fórmula matemática apropiada.  
3. Crea otro método que recorra todas las casillas desde la 1 hasta la 64 y devuelva el total de granos.  
4. Asegúrate de manejar valores fuera del rango 1‑64 de forma adecuada (por ejemplo, con excepciones o validaciones).

## Ejemplos de uso

| Entrada (casilla) | Granos |
|-------------------|--------|
| 1                 | 1      |
| 2                 | 2      |
| 3                 | 4      |
| 4                 | 8      |
| …                 | …      |
| 64                | 2^63   |

El método de total debe devolver el **total de granos en las 64 casillas** sumados.