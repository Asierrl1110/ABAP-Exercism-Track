# Kindergarten Garden

## Descripción

En este ejercicio vas a trabajar con un diagrama de plantas y asignarás plantas a niños de un jardín de infancia según un patrón específico. Recibirás una representación visual del jardín y deberás determinar qué plantas le corresponden a cada estudiante.

## Objetivo

- Implementar una función o método en ABAP que reciba un **diagrama de dos filas** que representa plantas sembradas en tazas.
- El diagrama utiliza letras para representar tipos de plantas:
  - `G` → grass (césped)
  - `C` → clover (trébol)
  - `R` → radishes (rábanos)
  - `V` → violets (violetas)
- Existen **12 estudiantes** en la clase, cuyo orden alfabético es importante:  
  **Alice, Bob, Charlie, David, Eve, Fred, Ginny, Harriet, Ileana, Joseph, Kincaid, Larry**.
- A cada estudiante se le asignan **cuatro plantas**: dos de la primera fila y dos de la segunda, según la posición en el diagrama.
- El orden de asignación se basa en el orden alfabético de los nombres.

## Entradas

Tu implementación recibirá un único argumento que representa el diagrama completo de plantas en dos líneas. Cada línea contiene un conjunto de letras que representan las tazas de plantas, siguiendo el orden de izquierda a derecha en la fila más cercana a la ventana primero.

## Instrucciones

1. Divide el diagrama de entrada en dos filas, separadas por el salto de línea (`\n`).
2. Para cada estudiante, calcula su índice según el orden alfabético de nombres.
3. Usa ese índice para identificar **cuatro letras clave**:
   - Dos de la primera fila
   - Dos de la segunda fila
4. Conviértelas a los nombres completos de plantas según la tabla (Grass, Clover, Radish, Violet).
5. Devuelve la lista de plantas correspondientes al estudiante.

## Ejemplo de uso

Imagina este diagrama de jardín:
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV


Entonces:

- Para **Alice**, la salida podría ser:  
  `Violets, Radishes, Violets, Radishes`

- Para **Bob**, la salida podría ser:  
  `Clover, Grass, Clover, Clover`

Esto se basa en tomar dos letras seguidas de cada fila para cada estudiante según su posición alfabética en la lista de estudiantes.