# Phone Number

## Descripción

En este ejercicio vas a implementar en ABAP una función que **limpie y valide números de teléfono**.  
Los números pueden incluir espacios, guiones u otros caracteres que no forman parte del número real, y la idea es normalizar la entrada para extraer solo los dígitos válidos siguiendo reglas específicas.

## Objetivo

- Crear un método o función que reciba una cadena de entrada con un posible número de teléfono.
- Limpiar la cadena dejando solo los **dígitos**.
- Validar que el número resultante cumple las reglas establecidas.
- Si el número es válido, devolver la versión limpia (solo dígitos).
- Si no es válido, devolver una señal de error o manejarlo según convenga en tu implementación.

## Reglas de validación

Para que un número de teléfono se considere válido:

- Debe contener solo **números de 10 dígitos**.
- Si tiene **11 dígitos**, el primer dígito debe ser `1` y se debe eliminar para obtener los 10 dígitos finales.
- Si tiene más o menos dígitos después de limpiar la entrada, debe considerarse **inválido**.
- No se permiten números con letras ni caracteres que no sean estrictamente parte de formatos válidos.

## Instrucciones para implementar

1. Crea un método, por ejemplo `clean_phone_number`, que reciba una cadena (*string*).
2. Elimina todos los caracteres que no sean dígitos (`0`–`9`).
3. Evalúa la longitud de la cadena resultante:
   - Si tiene exactamente **10 dígitos**, es válido → devuelve esa cadena.
   - Si tiene **11 dígitos** y el primero es `1` → elimina el `1` y devuelve los 10 dígitos restantes.
   - En cualquier otro caso → marca el número como inválido (puede ser con excepción, valor nulo, mensaje, etc.).
4. Devuelve el número validado o el comportamiento que hayas definido para números inválidos.

## Ejemplos de uso

| Entrada                                | Salida        |
|----------------------------------------|---------------|
| `"123-456-7890"`                       | `1234567890`  |
| `"(123) 456 7890"`                     | `1234567890`  |
| `"1 234 567 8901"`                     | `2345678901`  |
| `"21234567890"`                        | inválido      |
| `"123abc4567"`                         | inválido      |