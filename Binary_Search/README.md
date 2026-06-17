# Binary Search

## Descripción

La **búsqueda binaria (Binary Search)** es un algoritmo eficiente para localizar un elemento dentro de una colección ordenada. En lugar de recorrer todos los elementos uno por uno, divide repetidamente el rango de búsqueda por la mitad hasta encontrar el valor deseado o determinar que no existe.

El funcionamiento básico es el siguiente:

1. Comparar el valor buscado con el elemento situado en el centro de la lista.
2. Si ambos coinciden, se ha encontrado el elemento.
3. Si el valor buscado es menor, continuar la búsqueda únicamente en la mitad izquierda.
4. Si el valor buscado es mayor, continuar la búsqueda únicamente en la mitad derecha.
5. Repetir el proceso hasta encontrar el elemento o agotar el rango de búsqueda.

Este algoritmo tiene una complejidad temporal de **O(log n)**, lo que lo hace mucho más eficiente que una búsqueda secuencial en listas grandes.

## Objetivo

Implementar en ABAP:

* Un método que reciba una lista ordenada de números.
* Un valor que se desea buscar dentro de la lista.
* La lógica de búsqueda binaria para localizar dicho valor.
* La devolución del índice donde se encuentra el elemento buscado.
* Una excepción o error cuando el elemento no exista en la colección.

## Reglas principales

1. La colección de entrada debe estar **ordenada de menor a mayor**.
2. En cada iteración se debe calcular la posición central del rango actual.
3. Si el valor buscado coincide con el elemento central, devolver su índice.
4. Si el valor buscado es menor que el elemento central, continuar la búsqueda en la mitad izquierda.
5. Si el valor buscado es mayor que el elemento central, continuar la búsqueda en la mitad derecha.
6. Si el rango de búsqueda queda vacío, se debe indicar que el elemento no existe.

## Instrucciones

1. Crea una clase o método en ABAP que permita:

   * Recibir una tabla interna ordenada de números.
   * Recibir el valor objetivo a buscar.
   * Mantener los límites inferior y superior de la búsqueda.
   * Calcular la posición central en cada iteración.
   * Comparar el valor central con el valor objetivo.
2. Continúa reduciendo el rango de búsqueda hasta:

   * Encontrar el elemento y devolver su posición.
   * Determinar que el elemento no está presente y lanzar una excepción.

## Ejemplos

* Buscar un elemento existente:

  Lista: `[1, 3, 4, 6, 8, 9, 11]`
  Valor buscado: `6`
  Resultado: `3`

* Buscar el primer elemento:

  Lista: `[1, 3, 4, 6, 8, 9, 11]`
  Valor buscado: `1`
  Resultado: `0`

* Buscar el último elemento:

  Lista: `[1, 3, 4, 6, 8, 9, 11]`
  Valor buscado: `11`
  Resultado: `6`

* Buscar un elemento inexistente:

  Lista: `[1, 3, 4, 6, 8, 9, 11]`
  Valor buscado: `7`
  Resultado: Excepción indicando que el valor no se encuentra en la lista.

## Consideraciones

* La búsqueda binaria solo funciona correctamente sobre datos previamente ordenados.
* El algoritmo evita recorrer toda la colección, reduciendo el número de comparaciones necesarias.
* En listas muy grandes, la diferencia de rendimiento respecto a una búsqueda lineal es significativa.
* El ejercicio pone el foco en el manejo correcto de índices, límites de búsqueda y condiciones de finalización.
