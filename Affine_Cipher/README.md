# Affine Cipher

## Descripción

En este ejercicio vas a implementar el **cifrado afín (Affine Cipher)**, un algoritmo de criptografía clásica que cifra cada letra mediante una transformación matemática. Además del proceso de cifrado, también deberás implementar el descifrado para recuperar el mensaje original.

El ejercicio también requiere validar las claves utilizadas y dar formato al texto cifrado agrupándolo en bloques de cinco caracteres.

## Objetivo

- Crear métodos en ABAP para cifrar y descifrar mensajes.
- Transformar cada letra utilizando una fórmula matemática.
- Validar que la clave multiplicativa sea válida.
- Ignorar espacios y signos de puntuación durante el cifrado.
- Agrupar el texto cifrado en bloques de cinco caracteres.

## Reglas

El cifrado utiliza el alfabeto inglés de 26 letras:

- Cada letra se convierte en un número entre **0** y **25**.
- Para cifrar una letra se aplica la fórmula:

  ```
  E(x) = (a × x + b) mod 26
  ```

- Para descifrar se utiliza el inverso multiplicativo de `a`.

Además:

- La clave `a` debe ser coprima con **26**.
- Las letras se convierten a minúsculas.
- Los espacios y signos de puntuación se eliminan.
- Los números permanecen sin cambios.
- El texto cifrado debe agruparse en bloques de cinco caracteres separados por espacios.

## Instrucciones para implementar

1. Define métodos para **codificar** y **decodificar** un mensaje.
2. Comprueba que la clave `a` sea válida (coprima con 26).
3. Convierte cada letra en su posición dentro del alfabeto.
4. Aplica la fórmula de cifrado o descifrado según corresponda.
5. Convierte nuevamente el resultado en caracteres.
6. Agrupa el texto cifrado en bloques de cinco caracteres antes de devolverlo.

## Ejemplos de uso

- Texto: `"yes"`  
  Claves: `a = 5`, `b = 7`  
  Resultado: `"xbt"`.

- Texto: `"xbt"`  
  Claves: `a = 5`, `b = 7`  
  Resultado: `"yes"`.

- Texto: `"Testing, 1 2 3"`  
  Resultado: el mensaje se cifra eliminando la puntuación y agrupando los caracteres en bloques de cinco, manteniendo los números sin modificar.