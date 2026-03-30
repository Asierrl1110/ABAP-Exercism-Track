# ETL

## Descripción

ETL significa **Extract, Transform, Load** (Extraer, Transformar, Cargar).  
En este ejercicio vas a transformar una estructura de datos en otra más útil.

Se parte de una estructura donde cada clave es un valor numérico (puntuación) y su valor asociado es una lista de letras.  
El objetivo es transformar esa estructura en otra donde cada letra sea la clave y su valor sea la puntuación correspondiente.

## Objetivo

- Crear un método o función en ABAP que:
  - Reciba una estructura de datos con puntuaciones y listas de letras.
  - Transforme esa estructura en un formato invertido.
- Devolver una nueva estructura donde:
  - Las claves sean letras en minúsculas.
  - Los valores sean las puntuaciones.

## Ejemplo

### Entrada
{
1: ["A", "E", "I", "O", "U"],
2: ["D", "G"],
3: ["B", "C", "M", "P"]
}

### Salida
{
"a": 1,
"e": 1,
"i": 1,
"o": 1,
"u": 1,
"d": 2,
"g": 2,
"b": 3,
"c": 3,
"m": 3,
"p": 3
}

## Reglas

- Cada letra debe convertirse a **minúscula**.
- Cada letra será una clave única en la estructura final.
- El valor asociado a cada letra es el número (clave original) al que pertenecía.
- Se debe recorrer toda la estructura de entrada.

## Instrucciones para implementar

1. Define un método, por ejemplo `transform`, que reciba la estructura de entrada.
2. Recorre cada par clave-valor:
   - La clave es la puntuación.
   - El valor es una lista de letras.
3. Para cada letra:
   - Convierte la letra a minúscula.
   - Inserta en la nueva estructura la letra como clave y la puntuación como valor.
4. Devuelve la nueva estructura transformada.