# Two Fer

## Descripción

Este ejercicio consiste en implementar la famosa función “two‑fer” (*two for one*), que genera una frase dependiendo de si conoces o no el nombre de una persona. En inglés, la frase “two for one” se pronuncia parecido a “two‑fer”, de ahí el nombre del ejercicio.

## Objetivo

- Crear una función o método en ABAP que reciba opcionalmente un nombre (*string*).
- Si se proporciona un nombre, la función debe devolver:
	One for <nombre>, one for me.
- Si no se proporciona, debe devolver:
	One for you, one for me.


Este ejercicio te ayuda a practicar la manipulación de strings y parámetros opcionales en ABAP.

## Instrucciones para implementar

1. Crea una clase o método llamado, por ejemplo, `two_fer` o `get_two_fer`.
2. Recibe como parámetro una cadena de texto que puede ser vacía o nula.
3. Si se proporciona un nombre válido, genera la frase con ese nombre.
4. Si no se proporciona nombre, utiliza `"you"` como valor por defecto.
5. Devuelve el resultado como un `string`. 

## Ejemplos de uso

| Entrada 	        | Salida esperada 			  |
|-------------------|-----------------------------|
| `"Alice"` 		| `One for Alice, one for me.`|
| `""` 				| `One for you, one for me.`  |
| *(sin parámetro)* | `One for you, one for me.`  |