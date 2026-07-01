# 📚 Book Store

## 📖 Descripción

Este ejercicio forma parte del track de **ABAP** de Exercism y está diseñado para practicar algoritmos, optimización, tablas internas y manipulación de colecciones.

El objetivo es calcular el **precio mínimo** de una cesta de libros aplicando correctamente una serie de descuentos. Cada libro cuesta el mismo precio base, pero al comprar **libros distintos** en un mismo grupo se obtiene un descuento creciente. El reto consiste en encontrar la combinación de grupos que produzca el coste total más bajo, ya que una agrupación aparentemente óptima no siempre genera el mejor resultado. :contentReference[oaicite:0]{index=0}

Durante el ejercicio trabajarás con:

- Tablas internas.
- Bucles.
- Algoritmos de optimización.
- Conteo de elementos.
- Manipulación de colecciones.
- Estrategias de agrupación.

---

## 🎯 Objetivos

Implementar una función que:

1. Reciba una cesta con varios libros.
2. Agrupe los libros en conjuntos de títulos distintos.
3. Aplique el descuento correspondiente a cada grupo.
4. Encuentre la combinación con el menor precio posible.
5. Devuelva el coste total de la compra. :contentReference[oaicite:1]{index=1}

---

## 📂 Estructura del proyecto

```text
book_store.clas.abap
book_store.clas.testclasses.abap
```

- `book_store.clas.abap`: implementación de la solución.
- `book_store.clas.testclasses.abap`: pruebas proporcionadas por Exercism.

---

## 📝 Requisitos

Implementar el método encargado de calcular el precio final de la cesta.

Parámetros:

| Parámetro | Descripción |
|-----------|-------------|
| `basket` | Colección con los libros comprados |

Debe devolver el precio mínimo posible tras aplicar todos los descuentos.

---

## Precio de los libros

Cada libro cuesta:

```text
8 €
```

antes de aplicar descuentos.

---

## Descuentos

| Libros distintos | Descuento |
|------------------|-----------|
| 1 | 0 % |
| 2 | 5 % |
| 3 | 10 % |
| 4 | 20 % |
| 5 | 25 % |

---

## Ejemplos

### Un libro

Cesta:

```text
[1]
```

Precio:

```text
8 €
```

---

### Dos libros diferentes

```text
[1, 2]
```

Precio:

```text
16 €
```

Descuento:

```text
5 %
```

Resultado:

```text
15.20 €
```

---

### Cinco libros distintos

```text
[1,2,3,4,5]
```

Precio original:

```text
40 €
```

Descuento:

```text
25 %
```

Resultado:

```text
30 €
```

---

## El verdadero reto

No siempre conviene formar el grupo más grande posible.

Por ejemplo:

```text
[1,1,2,2,3,3,4,5]
```

Una agrupación sería:

```text
5 + 3
```

pero otra opción es:

```text
4 + 4
```

Y esta última resulta más barata, por lo que el algoritmo debe encontrar siempre la mejor combinación posible. :contentReference[oaicite:2]{index=2}

---

## 💡 Posible enfoque

### Contar las copias

Determinar cuántas veces aparece cada libro.

---

### Formar grupos

Crear grupos con libros distintos.

---

### Evaluar alternativas

Comparar diferentes formas de agrupar los libros para encontrar el menor precio.

---

### Calcular el coste

Para cada grupo:

```text
precio = libros × 8 €
```

Aplicando después el descuento correspondiente.

---

### Sumar el total

El resultado final será la suma de todos los grupos.

---

## Ejemplo paso a paso

Cesta:

```text
1 1 2 2 3 3 4 5
```

---

Opción A

```text
5 libros
3 libros
```

↓

```text
30 € + 21.60 €
```

↓

```text
51.60 €
```

---

Opción B

```text
4 libros
4 libros
```

↓

```text
25.60 € + 25.60 €
```

↓

```text
51.20 €
```

La segunda opción es la correcta porque obtiene el precio mínimo. :contentReference[oaicite:3]{index=3}

---

## Complejidad

Una solución sencilla puede requerir probar múltiples agrupaciones.

Dependiendo del algoritmo empleado:

Tiempo:

```text
O(n²)
```

o superior para estrategias exhaustivas.

Memoria:

```text
O(n)
```

para almacenar las agrupaciones temporales.

---

## 🧠 Conceptos practicados

- Tablas internas.
- Bucles.
- Conteo de frecuencias.
- Optimización.
- Algoritmos greedy.
- Backtracking (opcional).
- Manipulación de colecciones.
- Diseño de algoritmos.

---

## 🚀 Cómo ejecutar las pruebas

Desde la raíz del proyecto:

```bash
exercism test
```

o utilizando el entorno de desarrollo de ABAP configurado para Exercism.

---

## 📚 Recursos

- Exercism ABAP Track. :contentReference[oaicite:4]{index=4}
- Book Store Exercise Specification. :contentReference[oaicite:5]{index=5}
- SAP ABAP Internal Tables.
- Greedy Algorithms.
- Backtracking Algorithms.

---

**Dificultad:** Difícil  
**Temática:** Optimización y algoritmos de agrupación  
**Track:** ABAP