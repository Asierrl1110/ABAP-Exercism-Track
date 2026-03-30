# Leap

## Descripción

Un año bisiesto (*leap year*) es un año que tiene **366 días** e incluye un 29 de febrero. En este ejercicio en ABAP deberás implementar una función que, dado un año, determine si ese año es bisiesto o no.

## Objetivo

Tu tarea es:

- Implementar un método o función en ABAP que reciba un número entero (*year*).
- Determinar si el año es un año bisiesto según estas reglas:
  - Es bisiesto si es divisible por **4**.
  - A menos que sea divisible por **100**, en cuyo caso **no es bisiesto**, excepto si también es divisible por **400**, entonces **sí es bisiesto**.

## Reglas de años bisiestos

- Ejemplo:  
  - **1997** → no es bisiesto (no divisible por 4)  
  - **1900** → no es bisiesto (divisible por 100 pero no por 400)  
  - **2000** → es bisiesto (divisible por 400)

## Instrucciones

1. Crea una clase o método en ABAP que reciba un parámetro entero `year`.
2. Implementa la lógica para determinar si `year` es bisiesto:
   - Usa operaciones módulo (`MOD`) para verificar divisibilidad.
3. Devuelve un booleano (`true`/`false`) o un resultado lógico que indique si el año es bisiesto.
4. Asegúrate de manejar correctamente todos los casos según las reglas anteriores.

## Ejemplo de uso

- Entrada: `2000` → Resultado: verdadero (es año bisiesto)  
- Entrada: `1900` → Resultado: falso (no es bisiesto)  
- Entrada: `2016` → Resultado: verdadero (es año bisiesto)  
- Entrada: `2019` → Resultado: falso (no es bisiesto)