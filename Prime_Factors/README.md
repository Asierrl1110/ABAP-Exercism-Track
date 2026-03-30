# Prime Factors

## Descripción

El ejercicio **Prime Factors** consiste en implementar una función en ABAP que **calcule los factores primos de un número natural**.  
Los factores primos son aquellos números primos que multiplicados entre sí dan como resultado el número original.

## Objetivo

- Crear un método o función en ABAP que reciba un número natural positivo.
- Calcular y devolver la **lista de sus factores primos** en orden creciente.
- Tener en cuenta que:
  - Un número primo es divisible solo por 1 y por sí mismo.
  - El **número 1 no se considera primo**.

## Explicación

Para factorizar un número:

1. Comienza con el divisor más pequeño posible (2).
2. Mientras el número sea divisible por ese divisor:
   - Añade el divisor a la lista de factores.
   - Divide el número por ese divisor.
3. Si el divisor ya no divide limpiamente al número, incrementa el divisor.
4. Continúa hasta que el número sea 1.  
   El conjunto de divisores acumulados serán los **factores primos**.

## Instrucciones para implementar

1. Define una clase o función, por ejemplo `prime_factors`.
2. Haz que reciba el número a factorizar.
3. Itera probando divisores desde 2 en adelante, guardando cada vez que el número sea divisible.
4. Devuelve una tabla o lista con los factores primos encontrados en orden.

## Ejemplo de uso

- Entrada: `60`  
  Proceso de factorización:
  - 60 ÷ 2 = 30 → factor primo 2  
  - 30 ÷ 2 = 15 → factor primo 2  
  - 15 ÷ 3 = 5  → factor primo 3  
  - 5 ÷ 5 = 1   → factor primo 5  
  Resultado: `[2, 2, 3, 5]`  
  *(Porque 2 × 2 × 3 × 5 = 60).*

