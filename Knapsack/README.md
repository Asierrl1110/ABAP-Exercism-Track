# 🎒 Knapsack

## 📖 Descripción

Este ejercicio forma parte del track de **ABAP** de Exercism y está diseñado para practicar programación dinámica, optimización y manipulación de tablas internas.

El objetivo es resolver el clásico problema de la **mochila 0/1 (0/1 Knapsack Problem)**. Se dispone de una mochila con una capacidad máxima y de un conjunto de objetos, cada uno con un peso y un valor. Cada objeto puede escogerse **como máximo una vez**, y el objetivo es obtener el **máximo valor total** sin superar la capacidad de la mochila. :contentReference[oaicite:0]{index=0}

Durante el ejercicio trabajarás con:

- Tablas internas.
- Bucles anidados.
- Programación dinámica.
- Optimización.
- Algoritmos.
- Manipulación de estructuras de datos.

---

## 🎯 Objetivos

Implementar un método que permita:

1. Recibir una lista de objetos con su peso y valor.
2. Recibir la capacidad máxima de la mochila.
3. Seleccionar la mejor combinación de objetos.
4. Maximizar el valor total sin exceder el peso permitido.
5. Devolver el valor máximo alcanzable. :contentReference[oaicite:1]{index=1}

---

## 📂 Estructura del proyecto

```text
knapsack.clas.abap
knapsack.clas.testclasses.abap
```

- `knapsack.clas.abap`: implementación de la solución.
- `knapsack.clas.testclasses.abap`: pruebas proporcionadas por Exercism.

---

## 📝 Requisitos

Implementar el método encargado de calcular el valor máximo.

Parámetros:

| Parámetro | Descripción |
|-----------|-------------|
| `items` | Lista de objetos con peso y valor |
| `maximum_weight` | Capacidad máxima de la mochila |

Debe devolver el valor máximo que puede transportarse.

---

## Cada objeto posee

- Un peso.
- Un valor.

Ejemplo:

```text
Peso: 4
Valor: 50
```

Cada objeto solo puede utilizarse una vez.

---

## Ejemplo

Objetos:

```text
Peso  Valor

5      10
4      40
6      30
4      50
```

Capacidad:

```text
10
```

La mejor elección es:

```text
Objeto 2
Objeto 4
```

Peso total:

```text
8
```

Valor total:

```text
90
```

No existe ninguna otra combinación con mayor valor. :contentReference[oaicite:2]{index=2}

---

## Otro ejemplo

Objetos:

```text
Peso  Valor

2      6
2      10
3      12
```

Capacidad:

```text
5
```

La mejor solución es:

```text
2 + 3
```

Peso:

```text
5
```

Valor:

```text
22
```

---

## Restricciones

- Los pesos son positivos.
- Los valores son positivos.
- No se puede seleccionar un mismo objeto dos veces.
- El peso total nunca puede superar la capacidad de la mochila. :contentReference[oaicite:3]{index=3}

---

## 💡 Posible enfoque

### Programación dinámica

Crear una tabla donde cada posición represente el mejor valor posible para una determinada capacidad.

---

### Recorrer los objetos

Para cada objeto:

```text
Peso
Valor
```

actualizar las soluciones posibles.

---

### Decidir

Para cada capacidad:

- No utilizar el objeto.
- Utilizar el objeto si cabe.

Escoger siempre la opción con mayor valor.

---

### Resultado

La última posición de la tabla contendrá el valor máximo alcanzable.

---

## Ejemplo paso a paso

Capacidad:

```text
5
```

Objetos:

```text
(2,6)

(2,10)

(3,12)
```

---

Primer objeto:

```text
Valor máximo

6
```

---

Segundo objeto:

```text
16
```

---

Tercer objeto:

```text
22
```

Resultado final:

```text
22
```

---

## Complejidad

Con programación dinámica:

Tiempo:

```text
O(n × W)
```

donde:

- `n` es el número de objetos.
- `W` es la capacidad máxima.

Memoria:

```text
O(W)
```

si se utiliza una única fila de la tabla de programación dinámica.

---

## 🧠 Conceptos practicados

- Programación dinámica.
- Optimización.
- Tablas internas.
- Bucles.
- Algoritmos.
- Maximización.
- Manipulación de estructuras.
- Complejidad algorítmica.

---

## 🚀 Cómo ejecutar las pruebas

Desde la raíz del proyecto:

```bash
exercism test
```

o utilizando el entorno ABAP configurado para Exercism.

---

## 📚 Recursos

- Exercism ABAP Track. :contentReference[oaicite:4]{index=4}
- Knapsack Exercise Specification. :contentReference[oaicite:5]{index=5}
- Dynamic Programming.
- Knapsack Problem (0/1).
- SAP ABAP Internal Tables.

---

**Dificultad:** Media-Alta  
**Temática:** Programación dinámica y optimización  
**Track:** ABAP