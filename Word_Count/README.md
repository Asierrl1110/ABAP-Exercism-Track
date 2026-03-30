# Word Count

## Descripción

Este ejercicio consiste en implementar una función en ABAP que **cuente cuántas veces aparece cada palabra** en un texto dado. El análisis debe ser sensible a las reglas de separación de palabras habituales, como espacios y saltos de línea, y debe considerar mayúsculas y minúsculas de forma consistente.

## Objetivo

- Crear un método o función que reciba una **cadena de texto** (string).
- Analizar esa cadena, dividirla en palabras y contar cuántas veces aparece cada una.
- Devolver una estructura de datos (por ejemplo una tabla interna) que mapee cada palabra a su número de ocurrencias.

## Reglas

- Los separadores de palabras incluyen:
  - Espacios.
  - Saltos de línea.
  - Tabuladores y puntuación (según convenga en tu implementación).
- El conteo debe ser **case‑insensitive**: es decir, `"Hello"` y `"hello"` se consideran la misma palabra.
- La salida debe listar cada palabra única junto con su **frecuencia** de aparición.

## Instrucciones para implementar

1. Crea una clase o método llamado, por ejemplo, `word_count`.
2. Recibe un parámetro de entrada de tipo `string` con el texto.
3. Normaliza el texto:
   - Convierte todas las letras a minúsculas.
   - Quita o trata adecuadamente la puntuación si no se quiere considerar como parte de palabras.
4. Separa el texto en palabras usando los espacios y saltos de línea.
5. Recorre cada palabra y contabiliza cuántas veces aparece.
6. Devuelve un resultado con cada palabra y su número de apariciones (por ejemplo en una tabla interna asociativa o lista).

## Ejemplo de uso

Dado este texto:
Hello world
hello


- La palabra `"hello"` aparece 2 veces.  
- La palabra `"world"` aparece 1 vez.

Salida esperada (conceptual):
hello → 2
world → 1