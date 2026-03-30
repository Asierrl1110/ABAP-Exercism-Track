# Secret Handshake

## Descripción

En este ejercicio vas a implementar un sistema que traduzca un número en una secuencia de acciones conocidas como un **"secret handshake"**.  
El número se interpreta en **binario**, y cada bit indica si una acción debe realizarse o no.

## Objetivo

- Crear un método o función en ABAP que reciba un número entero.
- Interpretar ese número en binario.
- Generar una lista de acciones basadas en los bits activos.
- Devolver la lista de acciones en el orden correcto.

## Reglas

Cada uno de los **5 bits menos significativos** del número representa una acción:

| Bit (binario) | Valor | Acción                       |
|---------------|-------|------------------------------|
| 00001         | 1     | "wink"                       |
| 00010         | 2     | "double blink"               |
| 00100         | 4     | "close your eyes"            |
| 01000         | 8     | "jump"                       |
| 10000         | 16    | **reverse** (invertir orden) |

- Se deben evaluar los bits **de derecha a izquierda**.
- Si un bit está activo (`1`), se añade la acción correspondiente.
- Si el bit de valor **16** está activo, se debe **invertir el orden de las acciones obtenidas**.

## Instrucciones para implementar

1. Define un método, por ejemplo `commands`, que reciba un número entero.
2. Evalúa cada uno de los bits usando operaciones binarias (por ejemplo `BIT-AND` o `MOD`).
3. Añade las acciones correspondientes a una tabla interna.
4. Si el bit de reversa está activo:
   - Invierte el orden de la lista de acciones.
5. Devuelve la lista final de acciones.

## Ejemplos de uso

- Entrada: `3`  
  Binario: `00011`  
  Resultado: `["wink", "double blink"]`

- Entrada: `19`  
  Binario: `10011`  
  Resultado:
  - Acciones normales: `["wink", "double blink"]`
  - Con reversa → `["double blink", "wink"]`

- Entrada: `16`  
  Binario: `10000`  
  Resultado: `[]` (no hay acciones, solo reversa)