# Flower Field

## Descripción

**Flower Field** es una reinterpretación del clásico juego *Minesweeper*.  
El objetivo es completar un tablero indicando cuántas flores (`*`) hay alrededor de cada casilla vacía.

El tablero es una matriz rectangular donde cada celda puede contener:
- Un espacio vacío (`' '`)
- Una flor (`'*'`)

Tu tarea es **anotar cada casilla vacía con el número de flores adyacentes**.

## Objetivo

- Crear un método o función en ABAP que:
  - Reciba un tablero representado como lista de strings.
  - Calcule el número de flores adyacentes a cada celda vacía.
  - Devuelva el tablero anotado.

## Reglas

Para cada celda vacía:

- Cuenta cuántas flores (`*`) hay en las **8 posiciones adyacentes**:
  - Horizontal
  - Vertical
  - Diagonal
- Si hay al menos una flor adyacente:
  - Sustituye el espacio por el número de flores.
- Si no hay flores adyacentes:
  - Mantén la celda como espacio vacío.
- Las celdas con `*` deben mantenerse sin cambios. :contentReference[oaicite:0]{index=0}

## Instrucciones para implementar

1. Define un método, por ejemplo `annotate`, que reciba el tablero.
2. Recorre cada celda de la matriz.
3. Para cada celda vacía:
   - Revisa las 8 posiciones alrededor.
   - Cuenta cuántas contienen `*`.
4. Sustituye la celda:
   - Con el número si hay flores cercanas.
   - Con espacio si no hay ninguna.
5. Devuelve el nuevo tablero.

## Consideraciones

- El tablero siempre es rectangular.
- Debes controlar los límites para no acceder fuera de la matriz.
- Puedes usar bucles anidados para recorrer filas y columnas.
- Este ejercicio es similar a **Minesweeper**, pero con flores en lugar de minas.