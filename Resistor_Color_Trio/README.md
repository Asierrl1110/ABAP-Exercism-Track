# Resistor Color Trio

## Descripción

En este ejercicio vas a crear un programa en ABAP que decodifique el valor de una resistencia a partir de **tres bandas de color**. Cada banda representa un dígito y un factor multiplicador, y tu programa debe devolver una etiqueta legible con el valor en ohmios (*ohms*) o con un prefijo adecuado (*kiloohms*, *megaohms*, etc.).

## Objetivo

- Crear una función o método en ABAP que reciba **una lista de tres colores** como entrada.
- Traducir cada color a su valor numérico utilizando el código de colores estándar.
- Construir el valor numérico de la resistencia combinando:
  - Los dos primeros colores como dígitos base.
  - El tercer color como la cantidad de ceros (*zeros*) que se deben añadir al número base.
- Devolver el valor completo en una etiqueta humanamente legible, por ejemplo:  
  `"33 ohms"`, `"2 kiloohms"`, `"51 kiloohms"`.

## Código de colores

| Color   | Valor |
|---------|-------|
| black   | 0     |
| brown   | 1     |
| red     | 2     |
| orange  | 3     |
| yellow  | 4     |
| green   | 5     |
| blue    | 6     |
| violet  | 7     |
| grey    | 8     |
| white   | 9     |

## Instrucciones

1. Define una tabla o mapa que relacione cada color con su valor numérico.
2. Toma los **dos primeros colores** para formar un número base de dos dígitos.
3. Usa el valor del **tercer color** para determinar cuántos ceros añadir al final del número base.
4. Calcula el valor total de la resistencia.
5. Si el valor es menor que 1000, exprésalo en *ohms*. Si es mayor o igual a 1000, convierte a unidades más grandes (*kiloohms*, *megaohms*, etc.) según sea necesario.
6. Devuelve una cadena de texto (*string*) con el valor y la unidad apropiada.

## Ejemplos de uso

- Entrada: `["orange", "orange", "black"]` → Salida: `"33 ohms"`  
- Entrada: `["blue", "grey", "brown"]` → Salida: `"680 ohms"`  
- Entrada: `["red", "black", "red"]` → Salida: `"2 kiloohms"`  
- Entrada: `["green", "brown", "orange"]` → Salida: `"51 kiloohms"`

## Recursos

- Ejercicio original en *Exercism* — Resistor Color Trio (página del ejercicio).  