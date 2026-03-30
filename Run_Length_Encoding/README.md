# Run Length Encoding

## Descripción

La **codificación por longitud de ejecución** (*Run Length Encoding, RLE*) es un algoritmo simple de compresión de datos que consiste en sustituir secuencias de caracteres repetidos por el número de veces que se repiten seguido del carácter.  
Por ejemplo, la cadena `"AAAABBBCCDAA"` se codifica como `"4A3B2C1D2A"`.  
En este ejercicio vas a implementar en ABAP dos funciones: una para **codificar** texto usando RLE y otra para **decodificar** texto codificado en ese formato.

## Objetivo

- **Codificar** una cadena de texto aplicando RLE.
- **Decodificar** una cadena RLE para recuperar el texto original.

## Reglas

### Codificación

- Recorre la cadena de entrada y cuenta cuántas veces se repite un mismo carácter consecutivamente.
- Cada vez que cambie el carácter, anota el conteo seguido del carácter.
- Devuelve la secuencia de conteos y caracteres resultante.

Ejemplo:
Entrada: "AAAABBBCCDAA"
Salida: "4A3B2C1D2A"


### Decodificación

- Toma una cadena RLE donde cada segmento consiste en un número seguido de un carácter.
- Para cada segmento, repite el carácter tantas veces como indique el número.
- Reconstruye la cadena original.

Ejemplo:
Entrada: "4A3B2C1D2A"
Salida: "AAAABBBCCDAA"


## Instrucciones para implementar

1. Crea un método (por ejemplo `encode_rle`) que:
   - Reciba un `string` de entrada.
   - Recorra la cadena y compute la codificación por longitud de ejecución.
   - Devuelva el *string* codificado.
2. Crea otro método (por ejemplo `decode_rle`) que:
   - Reciba una cadena codificada en RLE.
   - Decodifique cada número y carácter para reconstruir el texto original.
   - Devuelva el *string* decodificado.

## Ejemplos de uso

| Método | Entrada           | Salida          |
|--------|------------------|------------------|
| Encode | `"AAAABBBCCDAA"` | `"4A3B2C1D2A"`   |
| Decode | `"4A3B2C1D2A"`   | `"AAAABBBCCDAA"` |