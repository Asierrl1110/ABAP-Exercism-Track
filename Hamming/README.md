# Hamming

## Descripción

La **distancia de Hamming** es una métrica que se usa para comparar dos cadenas de igual longitud y **contar cuántos caracteres son diferentes** entre ellas.  
En este ejercicio de ABAP deberás implementar una función que, dadas dos cadenas (o “strands”), calcule la distancia de Hamming entre ellas.

## Objetivo

- Implementar una función o método en ABAP que reciba **dos cadenas de texto de igual longitud**.
- Calcular cuántas posiciones tienen caracteres diferentes en ambas cadenas.
- Devolver ese número como **entero**.

## Reglas

- Las dos cadenas de entrada **deben tener la misma longitud**.
- La distancia de Hamming se obtiene contando cuántas posiciones tienen caracteres distintos entre las dos cadenas.
- Si las cadenas no tienen la misma longitud, deberás **manejar ese caso** (por ejemplo, con una excepción o una validación adecuada).

## Instrucciones para implementar

1. Define un método, por ejemplo `hamming_distance`, que reciba dos parámetros de tipo `string`.
2. Verifica que ambas cadenas tengan la misma longitud; si no, gestiona esta condición de forma adecuada.
3. Recorre ambas cadenas simultáneamente carácter por carácter.
4. Por cada posición donde los caracteres sean diferentes, incrementa un contador.
5. Devuelve el valor final del contador como la distancia de Hamming.

## Ejemplos de uso

- Entrada: `"A"`, `"A"` → Salida: `0`  
- Entrada: `"A"`, `"G"` → Salida: `1`  
- Entrada: `"AGCT"`, `"AGGT"` → Salida: `1`  
- Entrada: `"GATTACA"`, `"CATTAAC"` → Salida: número de posiciones diferentes  