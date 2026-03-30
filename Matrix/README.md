# Matrix

## Descripción

Este ejercicio consiste en **representar una matriz de números a partir de un string** y poder acceder a sus filas y columnas. La matriz se describe como un *string* con varias líneas separadas por saltos de línea, donde cada número está separado por espacios. A partir de esa representación, tu código debe permitir recuperar las filas y las columnas de forma independiente.

## Objetivo

- Parsear una representación en texto de una matriz de números.
- Implementar funciones o métodos que:
  - Devuelvan las **filas** de la matriz como listas de números.
  - Devuelvan las **columnas** de la matriz como listas de números.

## Explicación

La entrada será un *string* múltiple líneas como este:
9 8 7
5 3 2
6 6 7

Esto representa la matriz:
    1  2  3
	-------
1 | 9  8  7
2 | 5  3  2
3 | 6  6  7


### Filas

- Primera fila: `[9, 8, 7]`
- Segunda fila: `[5, 3, 2]`
- Tercera fila: `[6, 6, 7]`

### Columnas

- Primera columna: `[9, 5, 6]`
- Segunda columna: `[8, 3, 6]`
- Tercera columna: `[7, 2, 7]`

## Instrucciones para implementar

1. **Parsea** la entrada de texto:
   - Divide las líneas por `\n`.
   - Divide cada línea por espacios para obtener los números.
2. Convierte los valores en enteros o el tipo numérico que prefieras en ABAP.
3. Crea una función o método que devuelva las **filas** como tablas internas.
4. Crea otra función o método que devuelva las **columnas** como tablas internas.
5. Asegúrate de que los datos se mantengan en el orden correcto.

## Ejemplo de uso

Supón que la entrada es:
1 2 3
4 5 6
7 8 9

- **Rows** → `[[1,2,3], [4,5,6], [7,8,9]]`
- **Columns** → `[[1,4,7], [2,5,8], [3,6,9]]`
