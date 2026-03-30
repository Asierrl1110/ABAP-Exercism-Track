# Crypto Square

## Descripción

El **Crypto Square** es un método clásico de cifrado que consiste en reorganizar un texto en una cuadrícula y leerlo por columnas para obtener un mensaje cifrado.

Este ejercicio consiste en implementar en ABAP una función que:

1. Normalice el texto de entrada.
2. Lo distribuya en una cuadrícula rectangular.
3. Lea la cuadrícula por columnas para generar el texto cifrado.

Este tipo de cifrado es sencillo y se utiliza principalmente con fines educativos para entender transformaciones de texto. :contentReference[oaicite:0]{index=0}

## Objetivo

- Crear un método o función que reciba un texto (`string`).
- Normalizar el texto eliminando caracteres no válidos.
- Organizar el texto en una cuadrícula.
- Generar el texto cifrado leyendo por columnas.
- Devolver el resultado final como `string`.

## Reglas

### 1. Normalización

- Convertir todo el texto a **minúsculas**.
- Eliminar espacios, signos de puntuación y caracteres no alfanuméricos.
- Solo se deben conservar letras y números.

Ejemplo:
Entrada: "If man was meant to stay on the ground, god would have given us roots."
Salida: "ifmanwasmeanttostayonthegroundgodwouldhavegivenusroots"

---

### 2. Construcción de la cuadrícula

- Calcular el tamaño de la cuadrícula en función de la longitud del texto.
- La cuadrícula debe cumplir:
  - Número de columnas ≥ número de filas
  - columnas × filas ≥ longitud del texto
- Distribuir el texto fila por fila.

Ejemplo:
ifmanwasmeanttostayontheground

Se puede organizar como:
ifmanwas
meanttos
tayonthe
ground..
*(Los espacios vacíos se rellenan)*

---

### 3. Generación del texto cifrado

- Leer la cuadrícula **por columnas**.
- Construir el texto final concatenando los caracteres.

Ejemplo:
imtgdvs fearwer mayoogo anouuio nnlnvtw ttddesa ohghnsseo au       

---

## Instrucciones para implementar

1. Define un método, por ejemplo `encode`, que reciba un `string`.
2. Normaliza el texto:
   - Convierte a minúsculas.
   - Filtra solo caracteres alfanuméricos.
3. Calcula el número de filas y columnas necesarias.
4. Construye la cuadrícula (puede ser una tabla interna o estructura similar).
5. Recorre la cuadrícula por columnas para generar el resultado.
6. Devuelve el texto cifrado.

## Ejemplo de uso

Entrada:
"Chill out."

Proceso:

- Normalizado: `"chillout"`
- Cuadrícula:
chi
llo
ut.
Salida: clu hlt io