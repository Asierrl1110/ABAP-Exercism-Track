# 🧠 ITAB Basics — ABAP

*Ejercicio de nivel: Fácil* – Parte de la track de ABAP en Exercism.

## 📌 Objetivo

Practicar el manejo básico de **internal tables** en ABAP: generar una tabla interna con registros, agregar datos, ordenar y buscar.

## 📋 Descripción del problema

Este ejercicio te pide trabajar con una **internal table** llamada `initial_data` compuesta por tres columnas:

* `GROUP` — una letra identificadora.
* `NUMBER` — un entero.
* `DESCRIPTION` — un texto descriptivo.

La tabla se representa mediante un tipo de datos ABAP estructurado.

Tu objetivo es implementar cuatro métodos:

### 1. 🧱 `fill_itab`

Crear y devolver una tabla interna con **6 registros iniciales** usando los siguientes valores:

| GROUP | NUMBER | DESCRIPTION |
| ----- | ------ | ----------- |
| A     | 10     | Group A‑2   |
| B     | 5      | Group B     |
| A     | 6      | Group A‑1   |
| C     | 22     | Group C‑1   |
| A     | 13     | Group A‑3   |
| C     | 500    | Group C‑2   |

### 2. ➕ `add_to_itab`

A partir de la tabla ya creada, agregar un **nuevo registro** al final con:

| GROUP | NUMBER | DESCRIPTION |
| ----- | ------ | ----------- |
| A     | 19     | Group A‑4   |

### 3. 🔃 `sort_itab`

Ordenar la tabla por:

1. La columna `GROUP` en orden **alfabético ascendente**
2. La columna `NUMBER` en orden **descendente**, dentro de cada grupo.

### 4. 🔎 `search_itab`

Buscar en la tabla ordenada el registro cuyo valor en la columna `NUMBER` es **6** y devolver *el índice de esa fila*.