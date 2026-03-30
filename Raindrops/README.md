# Raindrops

## Descripción

En este ejercicio vas a implementar una función que **convierta un número entero en una cadena de sonido de “raindrops”** basándose en reglas sencillas de divisibilidad. Es una variación del clásico problema *FizzBuzz*, donde en lugar de palabras específicas se usan sonidos de “raindrops”.

## Objetivo

- Crear un método o función en ABAP que reciba un número entero.
- Si el número es divisible por ciertos valores, añade cadenas de texto específicas a la salida.
- Si el número **no es divisible por ninguno de esos valores**, la salida debe ser el número original convertido a cadena de texto.

## Reglas

Tu función debe seguir estas reglas:

- Si el número es divisible por **3**, añade `"Pling"` a la salida.
- Si el número es divisible por **5**, añade `"Plang"` a la salida.
- Si el número es divisible por **7**, añade `"Plong"` a la salida.
- Si **ninguna de las condiciones anteriores se cumple**, la salida debe ser el número original como texto (*string*).

## Instrucciones para implementar

1. Define una clase o método, por ejemplo `raindrop_sound`, que reciba un parámetro entero.
2. Comprueba si el número es divisible por 3, 5 o 7 usando el operador módulo (`MOD`).
3. Construye una salida concatenando las cadenas apropiadas (`Pling`, `Plang`, `Plong`) según corresponda.
4. Si no se añadió ninguna de las cadenas anteriores, convierte el número original a `string` y devuélvelo como resultado.

## Ejemplos de uso

- Número: `28`  
  Resultado: `"Plong"` (divisible solo por 7).

- Número: `30`  
  Resultado: `"PlingPlang"` (divisible por 3 y por 5, no por 7).

- Número: `34`  
  Resultado: `"34"` (no es divisible por 3, 5 o 7).