# Anagram

## Descripción

Un **anagrama** es una palabra o frase formada reorganizando las letras de otra palabra o frase, usando todas las letras exactamente una vez. El objetivo de este ejercicio es implementar en ABAP una función que **identifique cuáles palabras de una lista son anagramas de otra palabra dada**.

## Objetivo

- Crear un método o función en ABAP que reciba:
  - Una **palabra base**.
  - Una **lista de palabras candidatas**.
- Determinar cuáles de las palabras candidatas son **anagramas** de la palabra base.
- Devolver la lista de palabras candidatas que sí lo son.

## Reglas

- Dos palabras son anagramas si contienen **las mismas letras** con **la misma frecuencia**, sin importar el orden.
- La comparación **no debe distinguir entre mayúsculas y minúsculas** (case‑insensitive).
- Una palabra **no se considera anagrama de sí misma** (la palabra base exacta no debe incluirse como resultado).
- Se deben ignorar diferencias de caso o acentos cuando se comparan las letras.

## Instrucciones para implementar

1. Define un método, por ejemplo `find_anagrams`, que reciba:
   - Un **string** con la palabra base.
   - Una **tabla interna** de strings con las palabras candidatas.
2. Normaliza la palabra base y cada candidata:
   - Convierte todas las letras a **minúsculas**.
   - Ordena las letras dentro de la palabra para facilitar la comparación.
3. Para cada palabra candidata:
   - Comprueba si es anagrama de la palabra base comparando las versiones ordenadas.
   - No incluyas la palabra base exacta en la lista de resultados.
4. Devuelve una tabla interna con las palabras candidatas que cumplen como anagramas.

## Ejemplo de uso

- Palabra base: `"listen"`  
  Candidatas: `["enlists", "google", "inlets", "banana"]`  
  Resultado: `["inlets"]`

- Palabra base: `"master"`  
  Candidatas: `["stream", "pigeon", "maters"]`  
  Resultado: `["stream", "maters"]`

- Palabra base: `"allergy"`  
  Candidatas: `["gallery", "ballerina", "regally", "clergy", "largely", "leading"]`  
  Resultado: `["gallery", "regally", "largely"]`