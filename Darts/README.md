# Darts

## Descripción

En este ejercicio vas a calcular la puntuación de un lanzamiento de dardos en función de la posición donde impacta en una diana.  
La diana está formada por círculos concéntricos con diferentes puntuaciones según la distancia al centro.

## Objetivo

- Crear un método o función en ABAP que reciba las coordenadas `(x, y)` de un lanzamiento.
- Calcular la distancia del punto al centro de la diana `(0, 0)`.
- Determinar la puntuación en función de dicha distancia.
- Devolver la puntuación como un número entero.

## Reglas de puntuación

La puntuación depende de la distancia al centro:

- Si la distancia es menor o igual a **1** → **10 puntos**
- Si la distancia es menor o igual a **5** → **5 puntos**
- Si la distancia es menor o igual a **10** → **1 punto**
- Si la distancia es mayor que **10** → **0 puntos**

## Fórmula

Para calcular la distancia al centro, utiliza la fórmula:
distancia = sqrt(x² + y²)

## Instrucciones para implementar

1. Define un método, por ejemplo `score`, que reciba dos parámetros numéricos `x` e `y`.
2. Calcula la distancia al centro usando la fórmula euclidiana.
3. Evalúa la distancia según las reglas de puntuación.
4. Devuelve el valor correspondiente.

## Ejemplos de uso

| Coordenadas (x, y) | Distancia | Puntuación |
|--------------------|-----------|------------|
| (0, 0)             | 0         | 10         |
| (0.5, 0.5)         | < 1       | 10         |
| (2, 3)             | < 5       | 5          |
| (7, 7)             | < 10      | 1          |
| (11, 0)            | > 10      | 0          |