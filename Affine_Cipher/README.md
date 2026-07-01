# 🔐 Affine Cipher

## 📖 Descripción

Este ejercicio forma parte del track de **ABAP** de Exercism y está diseñado para practicar criptografía clásica, aritmética modular, manipulación de cadenas y validación de datos.

El objetivo es implementar el **Affine Cipher**, un cifrado por sustitución monoalfabética en el que cada letra del alfabeto se transforma mediante una función matemática. Además de cifrar mensajes, el ejercicio también requiere implementar el proceso inverso para recuperar el texto original. :contentReference[oaicite:0]{index=0}

Durante el ejercicio trabajarás con:

- Strings.
- Aritmética modular.
- Funciones matemáticas.
- Tablas internas.
- Validación de parámetros.
- Algoritmos de cifrado.

---

## 🎯 Objetivos

Implementar funciones que permitan:

1. Cifrar un mensaje mediante el cifrado afín.
2. Descifrar un texto cifrado.
3. Validar que la clave utilizada sea válida.
4. Ignorar espacios y signos de puntuación durante el cifrado.
5. Agrupar el texto cifrado en bloques de cinco caracteres. :contentReference[oaicite:1]{index=1}

---

## 📂 Estructura del proyecto

```text
affine_cipher.clas.abap
affine_cipher.clas.testclasses.abap
```

- `affine_cipher.clas.abap`: implementación de la solución.
- `affine_cipher.clas.testclasses.abap`: pruebas proporcionadas por Exercism.

---

## 📝 Requisitos

Implementar los métodos encargados de:

```text
encode
decode
```

Parámetros habituales:

| Parámetro | Descripción |
|-----------|-------------|
| `text` | Texto a cifrar o descifrar |
| `a` | Clave multiplicativa |
| `b` | Clave aditiva |

---

## ¿Cómo funciona?

Cada letra se convierte en un número:

```text
a → 0
b → 1
...
z → 25
```

El cifrado utiliza la fórmula:



donde:

- `x` es la letra original.
- `a` y `b` forman la clave.
- `26` representa el tamaño del alfabeto. :contentReference[oaicite:3]{index=3}

---

Para descifrar se utiliza la transformación inversa:



donde `a⁻¹` es el inverso multiplicativo de `a` módulo 26. :contentReference[oaicite:5]{index=5}

---

## Claves válidas

No todos los valores de `a` son válidos.

Debe cumplirse:

```text
mcd(a, 26) = 1
```

Es decir, `a` y `26` deben ser coprimos para que exista el inverso multiplicativo y el mensaje pueda descifrarse correctamente. :contentReference[oaicite:6]{index=6}

---

## Ejemplos

### Cifrar

Texto:

```text
yes
```

Claves:

```text
a = 5
b = 7
```

Resultado:

```text
xbt
```

---

### Descifrar

Texto:

```text
xbt
```

Resultado:

```text
yes
```

---

### Agrupación

Entrada:

```text
The quick brown fox
```

Salida:

```text
rclla oaplw q...
```

El texto cifrado debe agruparse en bloques de cinco caracteres para facilitar su lectura. :contentReference[oaicite:7]{index=7}

---

## Reglas adicionales

- Se ignoran los espacios.
- Se eliminan los signos de puntuación.
- Las letras se convierten a minúsculas.
- Los números permanecen sin cambios.
- El resultado del cifrado se presenta en grupos de cinco caracteres. :contentReference[oaicite:8]{index=8}

---

## 💡 Posible enfoque

### Normalizar el texto

- Convertir a minúsculas.
- Eliminar caracteres no alfanuméricos (excepto números).

---

### Cifrar cada letra

1. Convertir la letra a un valor entre `0` y `25`.
2. Aplicar la fórmula de cifrado.
3. Convertir nuevamente el resultado en una letra.

---

### Agrupar la salida

Insertar un espacio cada cinco caracteres.

---

### Descifrar

- Calcular el inverso multiplicativo de `a`.
- Aplicar la fórmula inversa.
- Reconstruir el mensaje original.

---

## Ejemplo paso a paso

Texto:

```text
abc
```

Valores:

```text
0
1
2
```

Claves:

```text
a = 5
b = 7
```

Aplicando el cifrado:

```text
0 → 7
1 → 12
2 → 17
```

Resultado:

```text
hmr
```

---

## Complejidad

Si el mensaje contiene `n` caracteres:

Tiempo:

```text
O(n)
```

porque cada carácter se procesa una única vez.

Memoria:

```text
O(n)
```

para construir el texto cifrado o descifrado.

---

## 🧠 Conceptos practicados

- Criptografía clásica.
- Aritmética modular.
- Funciones matemáticas.
- Strings.
- Tablas internas.
- Validación de datos.
- Transformación de caracteres.
- Algoritmos de cifrado.

---

## 🚀 Cómo ejecutar las pruebas

Desde la raíz del proyecto:

```bash
exercism test
```

o utilizando el entorno ABAP configurado para Exercism.

---

## 📚 Recursos

- Exercism ABAP Track. :contentReference[oaicite:9]{index=9}
- Affine Cipher. :contentReference[oaicite:10]{index=10}
- SAP ABAP Internal Tables.
- Modular Arithmetic.
- Monoalphabetic Substitution Cipher.

---

**Dificultad:** Media  
**Temática:** Criptografía clásica y aritmética modular  
**Track:** ABAP