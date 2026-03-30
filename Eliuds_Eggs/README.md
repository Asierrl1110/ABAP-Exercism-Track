# Eliud’s Eggs

## Descripción

Eliud ha heredado una granja y la gallinero tiene una pantalla digital que muestra un número codificado en binario indicando la presencia de huevos. Cada casilla del gallinero se marca con `1` si hay un huevo o `0` si está vacía.  
Tu tarea es interpretar ese número y calcular cuántos **huevos reales** hay en el gallinero.

## Objetivo

- Escribir una función o método en ABAP que reciba un **número entero** que representa la posición codificada de los huevos.
- Interpretar ese número como **un valor binario**.
- Contar cuántos bits `1` contiene esa representación binaria.
- Devolver esa cantidad como la **cantidad de huevos reales**.

## ¿Cómo funciona?

1. Escanea las posiciones posibles y marca un `1` para cada huevo presente o `0` para cada espacio vacío.  
2. Convierte ese número binario a su forma decimal.  
3. El resultado representa visualmente la presencia de huevos, pero tú debes **contar cuántos bits `1` tiene esa representación**.  
4. Ese conteo es el número de huevos reales en el gallinero.

## Reglas

- No utilices funciones de biblioteca que cuenten directamente los bits de un número; en su lugar, implementa tú mismo la lógica de conteo.

## Instrucciones para implementar

1. Define una función (por ejemplo, `count_eggs`) o un método ABAP que reciba un **integer**.
2. Convierte, de forma lógica, ese número a su representación binaria.
3. Recorre cada bit y cuenta cuántos son iguales a `1`.
4. Devuelve el total de bits `1` como el número de huevos.

## Ejemplos de uso

### Ejemplo 1

Entrada (binario): `1011001` →  
→ decimal 89 (interpreta, pero lo importante es el binario)  
→ hay 4 posiciones con `1`  
Salida: `4` huevos reales.

### Ejemplo 2

Entrada (binario): `0001000` →  
→ decimal 8  
→ hay 1 posición con `1`  
Salida: `1` huevo real.