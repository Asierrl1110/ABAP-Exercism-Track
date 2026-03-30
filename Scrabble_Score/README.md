# Scrabble Score

## Descripción

Calcula la puntuación de una palabra según las reglas del juego Scrabble.  
Cada letra tiene un valor y la puntuación total se obtiene sumando los valores de todas las letras de la palabra.

## Objetivo

- Implementar un método en ABAP que reciba una palabra (string).
- Calcular la puntuación total sumando los valores de las letras según la tabla.

## Valores de letras

| Letras                       | Puntos |
|------------------------------|--------|
| A, E, I, O, U, L, N, R, S, T | 1      |
| D, G                         | 2      |
| B, C, M, P                   | 3      |
| F, H, V, W, Y                | 4      |
| K                            | 5      |
| J, X                         | 8      |
| Q, Z                         | 10     |

## Instrucciones

1. Crea una clase o método `score`.
2. Recibe la palabra como parámetro.
3. Recorre cada letra, determina su valor y suma los puntos.
4. Devuelve la puntuación total.

## Ejemplo

La palabra `"cabbage"` debería retornar **14 puntos**:

- C → 3  
- A → 1  
- B → 3  
- B → 3  
- A → 1  
- G → 2  
- E → 1  

**Total: 14**