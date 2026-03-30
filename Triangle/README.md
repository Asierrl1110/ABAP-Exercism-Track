# Triangle

## Descripción

En este ejercicio vas a clasificar triángulos según la longitud de sus lados.  
Dado un triángulo con lados `a`, `b` y `c`, se determina su tipo y si es válido o no.

## Objetivo

- Crear un método o función en ABAP que reciba tres números enteros positivos representando los lados de un triángulo.
- Determinar si los lados pueden formar un triángulo válido.
- Clasificar el triángulo como:
  - **Equilátero**: los tres lados iguales.
  - **Isósceles**: exactamente dos lados iguales.
  - **Escaleno**: los tres lados diferentes.
  - **Inválido**: los lados no pueden formar un triángulo.

## Reglas

1. Para que un triángulo sea válido, se debe cumplir la **desigualdad triangular**:
a + b > c
a + c > b
b + c > a

2. Clasificación:
- **Equilátero**: `a = b = c`
- **Isósceles**: dos lados iguales y uno diferente
- **Escaleno**: todos los lados diferentes
3. Cualquier conjunto de lados que no cumpla las condiciones anteriores es **inválido**.

## Instrucciones para implementar

1. Define un método, por ejemplo `classify_triangle`, que reciba tres enteros: `a`, `b`, `c`.
2. Comprueba si los lados forman un triángulo válido usando la desigualdad triangular.
3. Si no es válido, devuelve `"invalid"`.
4. Si es válido, clasifícalo según los lados:
- Equilátero
- Isósceles
- Escaleno
5. Devuelve el tipo como `string`.

## Ejemplo de uso

| Lados       | Clasificación |
|-------------|---------------|
| 2, 2, 2     | Equilátero    |
| 3, 3, 4     | Isósceles     |
| 3, 4, 5     | Escaleno      |
| 1, 2, 3     | Inválido      |