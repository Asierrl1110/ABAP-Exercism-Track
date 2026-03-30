# RNA Transcription

## Descripción

En este ejercicio vas a implementar una función en ABAP que **convierta una cadena de DNA en su equivalente de RNA**.  
El proceso de transcripción genética sustituye cada base del DNA por su base complementaria en RNA.

## Objetivo

- Crear un método o función que reciba una **cadena DNA**.
- Convertir cada nucleótido de DNA al correspondiente nucleótido de RNA.
- Devolver la cadena RNA resultante.

## Reglas de transcripción

Cada base de DNA se transforma de la siguiente manera:

| DNA | RNA |
|-----|-----|
| `G` | `C` |
| `C` | `G` |
| `T` | `A` |
| `A` | `U` |

## Instrucciones para implementar

1. Define un método, por ejemplo `to_rna`, que reciba una cadena de DNA (`string`).
2. Recorre la cadena y, para cada carácter, reemplázalo con su correspondiente de RNA:
   - `G` → `C`
   - `C` → `G`
   - `T` → `A`
   - `A` → `U`
3. Construye la cadena de RNA a partir de estos reemplazos.
4. Devuelve la cadena RNA resultante.

## Ejemplo de uso

| Entrada DNA      | Salida RNA       |
|------------------|------------------|
| `"C"`            | `"G"`            |
| `"ACGTGGTCTTAA"` | `"UGCACCAGAAUU"` |