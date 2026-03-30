# Collatz Conjecture

## Descripción

La **conjetura de Collatz** es un famoso problema matemático que plantea lo siguiente:  
¿Puede cualquier número entero positivo llegar a 1 siguiendo una serie de reglas simples?

Las reglas son:

- Si el número es **par**, divídelo entre 2.
- Si el número es **impar**, multiplícalo por 3 y súmale 1.
- Repite el proceso con el nuevo valor hasta llegar a 1.

Aunque parece sencillo, este problema sigue sin demostración formal y es un clásico en programación y matemáticas.

## Objetivo

- Crear un método o función en ABAP que reciba un número entero positivo.
- Aplicar las reglas de la conjetura de Collatz repetidamente.
- Contar cuántos pasos se necesitan para llegar a 1.
- Devolver ese número de pasos.

## Reglas

Dado un número `n`:

- Si `n` es par → `n = n / 2`
- Si `n` es impar → `n = 3 * n + 1`
- Repetir hasta que `n = 1`
- El resultado es el número de pasos realizados para llegar a 1 

## Instrucciones para implementar

1. Define un método, por ejemplo `steps`, que reciba un entero positivo `n`.
2. Inicializa un contador de pasos en 0.
3. Mientras `n` no sea igual a 1:
   - Si es par, divídelo entre 2.
   - Si es impar, aplica `3n + 1`.
   - Incrementa el contador en cada iteración.
4. Devuelve el número total de pasos.
5. Opcional: valida que `n` sea mayor que 0 (puedes lanzar una excepción si no lo es).

## Ejemplo de uso

Entrada: `12`

Proceso:
12 → 6 → 3 → 10 → 5 → 16 → 8 → 4 → 2 → 1

Número de pasos: `9`

## Ejemplos adicionales

| Entrada | Pasos |
|---------|-------|
| `1`     | `0`   |
| `16`    | `4`   |
| `12`    | `9`   |