# Nth Prime

## Descripción

En este ejercicio deberás implementar en ABAP una función que **encuentre el enésimo número primo**: es decir, dado un número *n*, devuelve cuál es el *n‑ésimo número primo* según la secuencia de números primos naturales.  
Por ejemplo, los primeros seis números primos son 2, 3, 5, 7, 11 y 13, por lo que el sexto primo es 13.

## Objetivo

- Crear un método o función que reciba un número entero positivo *n*.
- Calcular cuál es el *n‑ésimo número primo*.
- Devolver ese número primo como resultado.

## Instrucciones

1. Define un método en ABAP (por ejemplo `nth_prime`) que reciba un parámetro entero `n`.
2. Implementa un algoritmo para encontrar números primos uno por uno hasta alcanzar el *n‑ésimo*.
   - Puedes usar chequeos de divisibilidad simples o un enfoque más eficiente como una criba, según prefieras.
3. Devuelve el valor del *n‑ésimo* primo encontrado.
4. Asegúrate de manejar entradas inválidas como números menores que 1 mediante validación o excepciones.

## Ejemplos de uso

- Entrada: `1` → Resultado: `2`  
- Entrada: `6` → Resultado: `13`  
- Entrada: `10` → Resultado: `29`  
  
La secuencia de números primos comienza:  
2, 3, 5, 7, 11, 13, 17, 19, 23, 29 …