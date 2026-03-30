# Elyse’s Enchantments

## Descripción

En este ejercicio ayudarás a Elyse, una aprendiz de maga, a practicar trucos básicos manipulando una baraja de cartas.  
La baraja se representa como una **tabla interna de números** (valores del 1 al 10), donde cada posición corresponde a una carta en el mazo.

El objetivo es implementar diferentes operaciones para **acceder, modificar e interactuar con el mazo**.

## Objetivo

Implementar varios métodos en ABAP que permitan:

- Obtener una carta en una posición específica.
- Reemplazar una carta.
- Insertar cartas en distintas posiciones.
- Eliminar cartas.
- Consultar el tamaño del mazo.

## Operaciones a implementar

### 1. Obtener una carta

- Devuelve la carta en una posición dada.

Ejemplo:
stack = [1, 2, 4, 1]
posición = 3
→ resultado = 4

---

### 2. Reemplazar una carta

- Sustituye la carta en una posición por otra.

Ejemplo:
stack = [1, 2, 4, 1]
posición = 3, nueva carta = 6
→ resultado = [1, 2, 6, 1]

---

### 3. Insertar una carta en la parte superior

- Añade una carta al final del mazo.

Ejemplo:
stack = [5, 9, 7, 1]
nueva carta = 8
→ resultado = [5, 9, 7, 1, 8]

---

### 4. Eliminar una carta en una posición

- Elimina la carta en la posición indicada.

Ejemplo:
stack = [3, 2, 6, 4, 8]
posición = 3
→ resultado = [3, 2, 4, 8]

---

### 5. Eliminar la carta superior

- Elimina la última carta del mazo.

Ejemplo:
stack = [3, 2, 6, 4, 8]
→ resultado = [3, 2, 6, 4]

---

### 6. Insertar una carta en la parte inferior

- Añade una carta al inicio del mazo.

Ejemplo:
stack = [5, 9, 7, 1]
nueva carta = 8
→ resultado = [8, 5, 9, 7, 1]

---

### 7. Eliminar la carta inferior

- Elimina la primera carta del mazo.

Ejemplo:
stack = [8, 5, 9, 7, 1]
→ resultado = [5, 9, 7, 1]

---

### 8. Obtener el tamaño del mazo

- Devuelve el número total de cartas.

Ejemplo:
stack = [3, 2, 6, 4, 8]
→ resultado = 5

## Instrucciones para implementar

1. Define los métodos necesarios para cada operación.
2. Usa **tablas internas** de ABAP para representar el mazo.
3. Aplica operaciones como:
   - Acceso por índice
   - Inserción (`APPEND`, `INSERT`)
   - Eliminación (`DELETE`)
4. Asegúrate de devolver el mazo actualizado tras cada operación.