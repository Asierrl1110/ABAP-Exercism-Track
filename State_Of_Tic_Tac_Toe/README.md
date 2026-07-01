# ❌⭕ State of Tic-Tac-Toe

## 📖 Descripción

Este ejercicio forma parte del track de **ABAP** de Exercism y está diseñado para practicar validación de estados, matrices, algoritmos y lógica de juego.

El objetivo es determinar el **estado actual de una partida de Tres en Raya (Tic-Tac-Toe)** a partir de un tablero de 3×3. El programa debe identificar si la partida sigue en curso, ha terminado con un ganador, ha finalizado en empate o si el tablero representa un estado imposible según las reglas del juego. :contentReference[oaicite:0]{index=0}

Durante el ejercicio trabajarás con:

- Tablas internas.
- Matrices.
- Validación de reglas.
- Conteo de elementos.
- Algoritmos de búsqueda.
- Manejo de errores.

---

## 🎯 Objetivos

Implementar una función que:

1. Reciba un tablero de Tic-Tac-Toe.
2. Compruebe si existe un ganador.
3. Determine si la partida continúa o ha terminado en empate.
4. Detecte tableros imposibles.
5. Devuelva el estado correcto de la partida. :contentReference[oaicite:1]{index=1}

---

## 📂 Estructura del proyecto

```text
state_of_tic_tac_toe.clas.abap
state_of_tic_tac_toe.clas.testclasses.abap
```

- `state_of_tic_tac_toe.clas.abap`: implementación de la solución.
- `state_of_tic_tac_toe.clas.testclasses.abap`: pruebas proporcionadas por Exercism.

---

## 📝 Requisitos

Implementar el método encargado de analizar el tablero.

Entrada:

| Parámetro | Descripción |
|-----------|-------------|
| `board` | Tablero de 3×3 formado por `X`, `O` y espacios vacíos |

Debe devolver uno de los estados válidos o lanzar un error cuando el tablero sea imposible. :contentReference[oaicite:2]{index=2}

---

## Reglas del juego

- La partida se juega sobre una cuadrícula de **3×3**.
- **X siempre comienza**.
- Los jugadores alternan turnos.
- Gana quien consiga tres símbolos consecutivos.
- La partida termina cuando alguien gana o cuando el tablero queda lleno. :contentReference[oaicite:3]{index=3}

---

## Estados posibles

### Partida en curso

Todavía quedan casillas libres y ningún jugador ha ganado.

Ejemplo:

```text
X| |
 |X|O
O|X|
```

---

### Victoria

Uno de los jugadores consigue tres símbolos consecutivos:

- Horizontal.
- Vertical.
- Diagonal.

Ejemplo:

```text
X X X
O O
```

↓

```text
Gana X
```

---

### Empate

Todas las casillas están ocupadas y no existe ningún ganador.

Ejemplo:

```text
X O X
X X O
O X O
```

↓

```text
Empate
```

---

## Tableros inválidos

El ejercicio también debe detectar situaciones imposibles.

### Orden de turnos incorrecto

Como **X siempre empieza**, el número de jugadas debe cumplir:

```text
X = O
```

o

```text
X = O + 1
```

Cualquier otra combinación es inválida. :contentReference[oaicite:4]{index=4}

---

### La partida continuó tras una victoria

Si un jugador ya había ganado, no deberían existir movimientos posteriores.

Por ejemplo:

```text
X X X
O O O
```

Este tablero nunca puede alcanzarse durante una partida válida. :contentReference[oaicite:5]{index=5}

---

## Combinaciones ganadoras

Existen ocho posibles líneas ganadoras:

### Filas

```text
0 1 2
3 4 5
6 7 8
```

---

### Columnas

```text
0 3 6
1 4 7
2 5 8
```

---

### Diagonales

```text
0 4 8
```

```text
2 4 6
```

---

## 💡 Posible enfoque

### Contar fichas

Calcular:

```text
Número de X
Número de O
```

Validar que respetan el turno correcto.

---

### Buscar ganadores

Comprobar las ocho líneas posibles.

---

### Validar inconsistencias

Por ejemplo:

- Ambos jugadores ganan.
- O tiene más movimientos que X.
- X gana pero ambos jugadores tienen el mismo número de fichas.
- O gana pero X ha jugado una vez más.

Todos estos casos deben considerarse inválidos. :contentReference[oaicite:6]{index=6}

---

### Determinar el estado

Si no existe ningún error:

- Victoria.
- Empate.
- Partida en curso.

---

## Ejemplo paso a paso

Tablero:

```text
X O X
O X
O
```

---

Conteo:

```text
X = 3
O = 3
```

---

Líneas ganadoras:

```text
Ninguna
```

---

Casillas libres:

```text
Sí
```

↓

Resultado:

```text
Partida en curso
```

---

## Complejidad

El tablero siempre tiene un tamaño fijo:

```text
3 × 3
```

Por tanto, todas las comprobaciones se realizan en tiempo constante.

Tiempo:

```text
O(1)
```

Memoria:

```text
O(1)
```

---

## 🧠 Conceptos practicados

- Tablas internas.
- Matrices.
- Validación.
- Conteo.
- Algoritmos.
- Lógica de juego.
- Manejo de errores.
- Comparaciones.

---

## 🚀 Cómo ejecutar las pruebas

Desde la raíz del proyecto:

```bash
exercism test
```

o utilizando el entorno ABAP configurado para Exercism.

---

## 📚 Recursos

- Exercism ABAP Track. :contentReference[oaicite:7]{index=7}
- State of Tic-Tac-Toe Exercise Specification. :contentReference[oaicite:8]{index=8}
- Tic-Tac-Toe.
- SAP ABAP Internal Tables.
- Matrix Algorithms.

---

**Dificultad:** Media  
**Temática:** Validación de estados y algoritmos sobre matrices  
**Track:** ABAP