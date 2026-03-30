# 🧠 ITAB Aggregation — ABAP

*Ejercicio de nivel: Fácil* – Parte de la track de ABAP en Exercism.

## 📌 Objetivo

Practicar técnicas de **agrupación y agregación de datos** en una tabla interna de ABAP. Aprenderás a recorrer una tabla, agrupar por claves y calcular estadísticas básicas para cada grupo.

## 📋 Descripción del problema

En este ejercicio te dan una **internal table** llamada `initial_numbers` con dos columnas:

* `GROUP` — una letra identificadora de grupo.
* `NUMBER` — un entero.

La tabla contiene múltiples registros repartidos en tres grupos (A, B y C). Tu tarea es **agrupar los datos por `GROUP`** y devolver una nueva tabla interna donde cada grupo tenga un único registro con las siguientes estadísticas:

* **COUNT** – número de elementos en ese grupo.
* **SUM** – suma de todos los valores `NUMBER` en el grupo.
* **MIN** – el valor mínimo en ese grupo.
* **MAX** – el valor máximo en ese grupo.
* **AVERAGE** – el promedio de los valores en ese grupo.

El tipo de datos de salida de la tabla resultante se define así:

```abap
TYPES: BEGIN OF aggregated_data_type,
         group   TYPE group,
         count   TYPE i,
         sum     TYPE i,
         min     TYPE i,
         max     TYPE i,
         average TYPE f,
       END OF aggregated_data_type,
       aggregated_data TYPE STANDARD TABLE OF aggregated_data_Type WITH EMPTY KEY.
```

## 🧩 Requisitos

Implementa el método principal (por ejemplo, `perform_aggregation`) que:

1. **Acepta la tabla `initial_numbers`.**
2. **Agrupa por el campo `GROUP`.**
3. **Calcula las estadísticas (count, sum, min, max, average).**
4. **Devuelve una internal table con un registro agregado por grupo.**