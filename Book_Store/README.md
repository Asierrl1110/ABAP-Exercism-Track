# Book Store

## Descripción

En este ejercicio vas a implementar un algoritmo que **calcule el precio mínimo de una cesta de libros** aplicando descuentos según el número de títulos diferentes comprados en un mismo grupo.

El reto no consiste únicamente en aplicar los descuentos, sino en **encontrar la mejor forma de agrupar los libros**, ya que formar siempre el grupo más grande posible no garantiza el precio final más bajo.

## Objetivo

- Crear un método o función en ABAP que reciba una cesta con varios libros.
- Agrupar los libros en conjuntos de títulos distintos.
- Aplicar el descuento correspondiente a cada grupo.
- Calcular el precio mínimo posible para toda la compra.

## Reglas

Cada libro tiene un precio fijo de **8 €**.

Los descuentos aplicables son:

- **1 libro diferente:** sin descuento.
- **2 libros diferentes:** 5 % de descuento.
- **3 libros diferentes:** 10 % de descuento.
- **4 libros diferentes:** 20 % de descuento.
- **5 libros diferentes:** 25 % de descuento.

Además:

- Un mismo libro solo puede formar parte de un grupo una vez.
- Si existen varias copias de un libro, deberán repartirse entre distintos grupos.
- El algoritmo debe encontrar siempre la combinación de grupos que produzca el menor precio total.

## Instrucciones para implementar

1. Define un método que reciba una colección con los identificadores de los libros comprados.
2. Cuenta cuántas copias existen de cada título.
3. Forma grupos de libros distintos.
4. Calcula el precio de cada grupo aplicando el descuento correspondiente.
5. Compara distintas agrupaciones cuando sea necesario para obtener el precio mínimo.
6. Devuelve el importe total de la cesta.

## Ejemplos de uso

- Cesta: `[1]`  
  Resultado: **8,00 €**.

- Cesta: `[1, 2]`  
  Resultado: **15,20 €** (5 % de descuento).

- Cesta: `[1, 2, 3, 4, 5]`  
  Resultado: **30,00 €** (25 % de descuento).

- Cesta: `[1, 1, 2, 2, 3, 3, 4, 5]`  
  Resultado: el algoritmo debe encontrar la agrupación que produzca **el menor precio posible**, aunque no sea la formada por el mayor número de libros distintos.