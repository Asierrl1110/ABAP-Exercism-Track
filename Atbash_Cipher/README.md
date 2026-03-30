# Atbash Cipher

## Descripción

El **cifrado Atbash** es un método muy simple de sustitución de caracteres que invierte el alfabeto. En lugar de usar una clave de cifrado variable, este método toma cada letra del alfabeto y la sustituye por la que está en la posición correspondiente desde el final.  
Por ejemplo, en el alfabeto latino:
Alfabeto original: abcdefghijklmnopqrstuvwxyz
Alfabeto cifrado: zyxwvutsrqponmlkjihgfedcba


Esto significa que:

- `a` se convierte en `z`  
- `b` → `y`  
- `c` → `x`  
... y así hasta el final. 

## Objetivo

Implementar en ABAP:

- Una función para **codificar** texto usando el cifrado Atbash.
- Una función para **decodificar** texto cifrado con Atbash (aunque en este caso la codificación y decodificación usan la misma lógica).
- Al codificar:
  - Todas las letras se tratan en **minúsculas**.
  - Se elimina la puntuación y espacios extra según las reglas de uso de datos.
  - Se agrupan las letras cifradas en bloques (desde los tests de Exercism suele hacerse en grupos de 5 caracteres).
  - Los números se mantienen sin cambio.

## Reglas principales

1. **Invertir el alfabeto**: reemplazar cada letra por su opuesta en el alfabeto invertido (`a` ↔ `z`, `b` ↔ `y`, etc.).
2. **Ignorar signos de puntuación** y caracteres no alfabéticos (excepto los números, que se dejan tal cual).
3. **Agrupar la salida codificada** en grupos de 5 caracteres separados por espacios (esto ayuda a la lectura y análisis de la salida).
4. El método de codificación y decodificación es el mismo: aplicar la sustitución inversa del alfabeto.

## Instrucciones

1. Crea una clase o un conjunto de métodos en ABAP que permitan:
   - Normalizar el texto de entrada (ponerlo en minúsculas y filtrar solo letras y números válidos).
   - Aplicar el mapeo de Atbash a cada carácter.
   - Construir el resultado codificado en bloques de 5 caracteres si hace falta.
2. Asegúrate de que la decodificación también aplique el mismo mapeo de letras para recuperar el texto original legible.

## Ejemplos

- Codificar:  
  Entrada: `test`  
  Salida: `gvhg`

- Codificar con números y espacios:  
  Entrada: `x123 yes`  
  Salida: `c123b vh`

- Decodificar:  
  Entrada: `gvhg`  
  Salida: `test`

- Decodificar ejemplo con frases separadas en bloques:  
  Entrada: `gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt`  
  Salida: `thequickbrownfoxjumpsoverthelazydog`