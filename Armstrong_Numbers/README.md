# Armstrong Numbers

## Descripción

Un **número de Armstrong** (también conocido como número narcisista) es un número que es igual a la suma de sus propios dígitos, donde cada dígito está elevado a la potencia del número total de dígitos.

Por ejemplo:

- `9` → 9¹ = 9 → es un número de Armstrong  
- `10` → 1² + 0² = 1 ≠ 10 → no es Armstrong  
- `153` → 1³ + 5³ + 3³ = 1 + 125 + 27 = 153 → es Armstrong :contentReference[oaicite:0]{index=0}  

## Objetivo

- Crear un método o función en ABAP que reciba un número entero.
- Determinar si ese número es un **número de Armstrong**.
- Devolver un valor lógico (`true`/`false`) indicando el resultado.

## Reglas

Para comprobar si un número es Armstrong:

1. Cuenta cuántos dígitos tiene el número → `n`.
2. Separa el número en sus dígitos individuales.
3. Eleva cada dígito a la potencia `n`.
4. Suma todos los resultados.
5. Si la suma es igual al número original → es Armstrong. :contentReference[oaicite:1]{index=1}  

## Instrucciones para implementar

1. Define un método, por ejemplo `is_armstrong_number`, que reciba un entero.
2. Convierte el número en una cadena para poder recorrer sus dígitos.
3. Calcula la longitud de la cadena (`n`).
4. Recorre cada dígito:
   - Convierte el carácter a número.
   - Eleva el dígito a la potencia `n`.
   - Acumula el resultado en una suma.
5. Compara la suma con el número original.
6. Devuelve `true` si coinciden, en caso contrario `false`.

## Ejemplos de uso

| Entrada | Cálculo                         | Resultado |
|---------|---------------------------------|-----------|
| `5`     | 5¹ = 5                          | `true`    |
| `10`    | 1² + 0² = 1                     | `false`   |
| `153`   | 1³ + 5³ + 3³ = 153              | `true`    |
| `9474`  | 9⁴ + 4⁴ + 7⁴ + 4⁴ = 9474        | `true`    |
