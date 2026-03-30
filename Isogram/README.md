# Isogram

## Descripción

Un **isograma** es una palabra en la que **ninguna letra se repite** (ignorando espacios y guiones), por ejemplo:  
- `"lumberjacks"` → isograma  
- `"thumbscrew‑japingly"` → isograma  
- `"six‑year‑old"` → isograma  

Tu reto en este ejercicio es implementar una función en ABAP que determine si una palabra o frase es un isograma.

## Objetivo

- Crear una función o método en ABAP que reciba una **cadena de texto**.
- Determinar si esa cadena es un **isograma**, es decir:
  - No contiene **letras repetidas**, sin importar si son mayúsculas o minúsculas.
  - Se **ignoran espacios y guiones** al evaluar la cadena.
- Devolver un valor lógico (`true`/`false`) según si la entrada **sí** o **no** es un isograma.

## Reglas

- La comparación debe ser **case‑insensitive** (no distingue entre mayúsculas y minúsculas).
- Se deben **omitir espacios y guiones** antes de evaluar repetición de letras.
- Otros caracteres o puntuación pueden ser ignorados o tratados según tu preferencia: el foco está en las letras.

## Instrucciones para implementar

1. Crea un método, por ejemplo `is_isogram`, que reciba un parámetro de tipo `string`.
2. Normaliza la cadena:
   - Convierte todas las letras a **minúsculas**.
   - Elimina espacios (` `) y guiones (`‑`).
3. Recorre la cadena y registra cada letra encontrada.
4. Si se encuentra una letra repetida, la función debe devolver **falso**.
5. Si no hay letras repetidas, devuelve **verdadero**.

## Ejemplos de uso

| Entrada                     | Salida |
|-----------------------------|--------|
| `"lumberjacks"`             | `true` |
| `"background"`              | `true` |
| `"downstream"`              | `true` |
| `"six-year-old"`            | `true` |
| `"isograms"`                | `false`|
| `"hello"`                   | `false`|