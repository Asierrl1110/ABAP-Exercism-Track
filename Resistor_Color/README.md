# Resistor Color

## Descripción

Este ejercicio trata sobre conocer el significado de los **códigos de color en las resistencias eléctricas**. Los fabricantes usan bandas de colores para indicar valores numéricos, ya que imprimir directamente los valores sería difícil de leer en componentes pequeños. El objetivo es crear un programa que te ayude a **consultar el valor numérico asociado a un color** y a **listar todos los colores disponibles**.

## Objetivo

Implementar en ABAP las siguientes funcionalidades:

- Dado un color (string), devolver el valor numérico que le corresponde según el código de colores.
- Devolver una lista de todos los colores válidos en el código.

La codificación de colores para las primeras bandas de una resistencia es:

| Color   | Valor |
|---------|-------|
| black   | 0     |
| brown   | 1     |
| red     | 2     |
| orange  | 3     |
| yellow  | 4     |
| green   | 5     |
| blue    | 6     |
| violet  | 7     |
| grey    | 8     |
| white   | 9     |

## Instrucciones para implementar

1. Define una clase o método que gestione la relación entre un color y su valor asociado.
2. Crea una función para buscar el valor de un color dado.
3. Crea otra función o método que devuelva la lista de todos los colores disponibles.
4. Asegúrate de manejar correctamente entradas inválidas (colores que no están en el código).

## Ejemplo de uso conceptual

- Si la entrada es `"red"`, el resultado debe ser `2`.
- Si la entrada es `"blue"`, el resultado debe ser `6`.
- La lista de colores debe incluir todos los colores desde `"black"` hasta `"white"`.