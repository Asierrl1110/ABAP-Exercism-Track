# Line Up

## Descripción

Este ejercicio simula una situación en una tienda donde los clientes van llegando a una fila (*line up*) y necesitan un ticket personalizado que combine su nombre con su posición de llegada en forma de número ordinal en inglés (por ejemplo: *1st*, *2nd*, *3rd*, *4th*, etc.).

## Objetivo

- Crear una función o método en ABAP que reciba un **nombre** y un **número**.
- Devolver una frase que incluya el nombre y el número en formato ordinal en inglés.
- El número puede ir de **1 a 999**.

## Reglas del ordinal en inglés

- Los números que terminan en **1** (excepto los que terminan en **11**) usan el sufijo `"st"`.
- Los números que terminan en **2** (excepto los que terminan en **12**) usan el sufijo `"nd"`.
- Los números que terminan en **3** (excepto los que terminan en **13**) usan el sufijo `"rd"`.
- Todos los demás números usan el sufijo `"th"`.

## Instrucciones

1. Define un método ABAP que reciba dos parámetros:
   - Un **string** con el nombre del cliente.
   - Un **integer** con la posición en la fila.
2. Determina el sufijo apropiado para el número según las reglas anteriores.
3. Construye y devuelve una frase completa usando el nombre y el número ordinal.

## Ejemplos de uso

| Entrada                   | Salida                                                              |
|---------------------------|---------------------------------------------------------------------|
| `"Mary", 1`               | `Mary, you are the 1st customer we serve today. Thank you!`         |
| `"John", 12`              | `John, you are the 12th customer we serve today. Thank you!`        |
| `"Dahir", 162`            | `Dahir, you are the 162nd customer we serve today. Thank you!`      |