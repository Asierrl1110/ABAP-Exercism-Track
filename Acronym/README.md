# Acronym

## Descripción

En este ejercicio vas a implementar una función que genere un **acrónimo** a partir de una frase.  
Un acrónimo se forma tomando la **primera letra de cada palabra** y convirtiéndolas en mayúsculas.

Por ejemplo:
- `"Portable Network Graphics"` → `"PNG"`
- `"Ruby on Rails"` → `"ROR"`

## Objetivo

- Crear un método o función en ABAP que reciba una **cadena de texto**.
- Extraer las letras iniciales de cada palabra.
- Construir el acrónimo resultante en **mayúsculas**.
- Devolver el acrónimo como un `string`.

## Reglas

- Cada palabra aporta su **primera letra** al acrónimo.
- La salida debe estar en **mayúsculas**.
- Se deben considerar como separadores:
  - Espacios (` `)
  - Guiones (`-`)
- Las palabras pueden contener letras en mayúsculas o minúsculas, pero el resultado final siempre debe estar en mayúsculas.

## Instrucciones para implementar

1. Define un método, por ejemplo `generate_acronym`, que reciba un `string`.
2. Divide la frase en palabras usando espacios y guiones como separadores.
3. Para cada palabra:
   - Toma su primera letra.
   - Conviértela a mayúscula.
4. Concatena todas las letras obtenidas.
5. Devuelve el acrónimo final.

## Ejemplos de uso

| Entrada                                     | Salida |
|---------------------------------------------|--------|
| `"Portable Network Graphics"`               | `PNG`  |
| `"Ruby on Rails"`                           | `ROR`  |
| `"Complementary metal-oxide semiconductor"` | `CMOS` |
