# Knapsack

## Descripción

En este ejercicio vas a implementar una solución al problema clásico de la **mochila (0/1 Knapsack Problem)**. Se dispone de una mochila con una capacidad máxima y de una colección de objetos, cada uno con un peso y un valor.

El objetivo es **seleccionar la combinación de objetos que proporcione el mayor valor posible sin superar la capacidad de la mochila**. Cada objeto puede utilizarse **como máximo una vez**.

## Objetivo

- Crear un método o función en ABAP que reciba una lista de objetos.
- Cada objeto tendrá un peso y un valor asociados.
- Calcular el valor máximo que puede obtenerse sin exceder la capacidad de la mochila.
- Devolver únicamente el valor máximo alcanzable.

## Reglas

- Cada objeto dispone de:
  - Un **peso**.
  - Un **valor**.
- La mochila tiene una **capacidad máxima**.
- Un objeto solo puede seleccionarse una vez.
- El peso total de los objetos elegidos no puede superar la capacidad de la mochila.
- Debe encontrarse siempre la combinación con el mayor valor posible.

## Instrucciones para implementar

1. Define un método que reciba la capacidad máxima de la mochila y la lista de objetos.
2. Recorre los objetos disponibles evaluando si pueden añadirse a la mochila.
3. Compara las distintas combinaciones posibles respetando la capacidad máxima.
4. Calcula el valor total de cada combinación válida.
5. Devuelve el mayor valor obtenido.

> Una solución eficiente suele utilizar **programación dinámica**, almacenando los mejores resultados para cada capacidad parcial.

## Ejemplos de uso

- Objetos:

  | Peso | Valor |
  |------|------:|
  | 5 | 10 |
  | 4 | 40 |
  | 6 | 30 |
  | 4 | 50 |

  Capacidad: `10`

  Resultado: **90**, seleccionando los objetos de peso **4** y **4**.

---

- Objetos:

  | Peso | Valor |
  |------|------:|
  | 2 | 6 |
  | 2 | 10 |
  | 3 | 12 |

  Capacidad: `5`

  Resultado: **22**, seleccionando los objetos de peso **2** y **3**.

---

- Objetos:

  | Peso | Valor |
  |------|------:|
  | 3 | 25 |
  | 4 | 20 |

  Capacidad: `2`

  Resultado: **0**, ya que ningún objeto cabe en la mochila.