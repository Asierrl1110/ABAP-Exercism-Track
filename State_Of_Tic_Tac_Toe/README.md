# State of Tic-Tac-Toe

## Descripción

En este ejercicio vas a implementar un método que **analice el estado de una partida de Tres en Raya (Tic-Tac-Toe)** a partir de un tablero de 3×3.

El objetivo es comprobar si el tablero representa una partida válida y determinar si el juego sigue en curso, ha terminado con un ganador, ha finalizado en empate o corresponde a un estado imposible según las reglas del juego.

## Objetivo

- Crear un método en ABAP que reciba un tablero de Tic-Tac-Toe.
- Comprobar que el tablero sea válido.
- Detectar si existe un ganador.
- Determinar si la partida continúa o ha finalizado.
- Identificar estados imposibles.

## Reglas

El tablero está formado por tres tipos de casillas:

- `X`
- `O`
- Espacio vacío

Además:

- **X siempre realiza el primer movimiento.**
- Los jugadores alternan turnos.
- Un jugador gana al colocar **tres símbolos consecutivos** en una fila, columna o diagonal.
- Si todas las casillas están ocupadas y no hay ganador, la partida termina en empate.

Un tablero es **inválido** si, por ejemplo:

- Hay más fichas `O` que `X`.
- La diferencia entre fichas `X` y `O` es superior a una.
- Ambos jugadores ganan simultáneamente.
- Se han realizado movimientos después de que un jugador ya hubiera ganado.

## Instrucciones para implementar

1. Define un método que reciba un tablero de 3×3.
2. Cuenta el número de fichas `X` y `O`.
3. Comprueba que el orden de los turnos sea válido.
4. Busca líneas ganadoras en filas, columnas y diagonales.
5. Valida que no existan estados imposibles.
6. Devuelve el estado correspondiente de la partida.

## Ejemplos de uso

- Tablero:

  ```text
  X X X
  O O
       
  ```

  Resultado: **Gana X**.

---

- Tablero:

  ```text
  X O X
  X X O
  O X O
  ```

  Resultado: **Empate**.

---

- Tablero:

  ```text
  X O
    X
  O
  ```

  Resultado: **Partida en curso**.

---

- Tablero:

  ```text
  X X X
  O O O
       
  ```

  Resultado: **Estado inválido**, ya que ambos jugadores no pueden ganar en una partida válida.