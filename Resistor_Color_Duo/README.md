# Resistor Color Duo

## Descripción

En este ejercicio vas a crear un programa en ABAP que decodifique los **dos primeros colores** de una resistencia usando el código de colores estándar.  
Cada color representa un dígito, y el resultado será un número de **dos cifras**, incluso si se proporcionan más colores.

## Objetivo

- Crear una función o método que reciba una lista de nombres de colores.
- Tomar los **dos primeros colores** de la lista.
- Convertir cada color en su valor numérico correspondiente.
- Construir y devolver un número de dos dígitos a partir de esos dos valores.

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

1. Crea un método en ABAP que reciba una lista (tabla interna) de strings con los nombres de colores.
2. Extrae los **dos primeros colores** de la lista.
3. Asigna a cada color su valor numérico usando la tabla anterior.
4. Devuelve el número formado por concatenar los dos valores (por ejemplo, *brown* + *green* → `15`).
5. Si hay más de dos colores en la entrada, **ignora** los extras.

## Ejemplos de uso

- Entrada: `["brown", "black"]` → Salida: `10`  
- Entrada: `["blue", "grey"]` → Salida: `68`  
- Entrada: `["yellow", "violet", "red"]` → Salida: `47`  