# Difference of Squares

## Descripción

En este ejercicio vas a trabajar con dos conceptos matemáticos clásicos relacionados con los **cuadrados de los números**:

- La **suma de los cuadrados** de los primeros *n* números naturales.
- El **cuadrado de la suma** de los primeros *n* números naturales.

La tarea consiste en calcular la **diferencia entre estos dos valores**.

## Objetivo

- Implementar en ABAP una función o método que, dado un número entero positivo `n`, calcule:
  - La **suma de los cuadrados**:  
    \[
    \sum_{i=1}^{n} i^2
    \]
  - El **cuadrado de la suma**:  
    \[
    \left(\sum_{i=1}^{n} i\right)^2
    \]
  - La **diferencia entre ambos**.

## Fórmulas

- Suma de los cuadrados:
  \[
  1^2 + 2^2 + 3^2 + \ldots + n^2
  \]

- Cuadrado de la suma:
  \[
  (1 + 2 + 3 + \ldots + n)^2
  \]

- Diferencia:
  \[
  (\text{cuadrado de la suma}) - (\text{suma de los cuadrados})
  \]

## Instrucciones para implementar

1. Crea un método, por ejemplo `difference_of_squares`, que reciba un número entero positivo `n`.
2. Calcula la **suma de los cuadrados** recorriendo del 1 al `n`.
3. Calcula el **cuadrado de la suma** sumando todos los enteros de 1 a `n` y elevando al cuadrado el resultado.
4. Resta ambos valores y devuelve la diferencia.

## Ejemplo de uso

Para `n = 10`:

- Suma de los cuadrados:
1² + 2² + 3² + … + 10² = 385
- Cuadrado de la suma:
(1 + 2 + 3 + … + 10)² = 55² = 3025
- Diferencia:
3025 − 385 = 2640

Resultado esperado: `2640`