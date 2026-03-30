# ITAB Combination

## 🧠 Descripción

Aprende a combinar los datos de dos *internal tables* diferentes de ABAP (tablas internas) en una sola tabla de resultados. En este ejercicio se proporcionan dos tablas internas con tipos diferentes: `ALPHAS` y `NUMS`. :contentReference[oaicite:0]{index=0}

## 🎯 Objetivo

Tu objetivo es:

- Recibir dos tablas internas (`ALPHAS` y `NUMS`) que contienen datasets distintos.
- Combinar los valores de cada fila de ambas tablas generando una nueva tabla interna.
- Cada registro de la nueva tabla resultante debe contener la concatenación de los valores de **ALPHAS** y **NUMS** por posición correspondiente.
- Por ejemplo, el primer campo del primer registro de la tabla combinada será `"A1"`. :contentReference[oaicite:1]{index=1}

## 📌 Definiciones de tipos esperados

Se espera que utilices estos tipos para construir la tabla resultante:

```abap
TYPES: BEGIN OF combined_data_type,
         colx TYPE string,
         coly TYPE string,
         colz TYPE string,
       END OF combined_data_type.

TYPES: combined_data TYPE STANDARD TABLE OF combined_data_type WITH EMPTY KEY.

📎 Ejemplo

Dadas estas tablas:
ALPHAS	COLA	COLB	COLC
Row 1	A		B		C
Row 2	D		E		F
Row 3	G		H		I
NUMS	COL1	COL2	COL3
Row 1	1		2		3
Row 2	4		5		6
Row 3	7		8		9

El resultado esperado de la tabla combinada tendrá:

Primera fila: A1, B2, C3
Segunda fila: D4, E5, F6
Tercera fila: G7, H8, I9