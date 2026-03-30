# Clock

## Descripción

En este ejercicio vas a implementar una representación simple de un reloj en ABAP que permite:

- Crear una hora específica con horas y minutos.
- Ajustar la hora sumando o restando minutos.
- Asegurar que los ajustes respeten el ciclo de 24 horas.

La idea es que tu reloj siempre muestre la hora correcta incluso si se suman o restan minutos que causan “envolturas” de día (por ejemplo, restar minutos que llevan a un día anterior o sumar suficientes minutos para avanzar al día siguiente).

## Objetivo

- Crear un tipo o método que represente una **hora en formato 24 h**.
- Permitir **sumar o restar minutos** a esa hora.
- Normalizar correctamente la hora cuando se excede el rango 00:00–23:59 ajustando el día de forma circular.

## Reglas de cálculo

- Una hora se representa con **horas** y **minutos** enteros.
- Al sumar o restar minutos:
  - Si el conteo cruza medianoche, se debe ajustar de forma circular (24 horas).
  - Por ejemplo:
    - 00:30 resta 60 → 23:30 (del día anterior).
    - 10:00 + 75 → 11:15.
    - 23:00 + 120 → 01:00 (del día siguiente).

## Instrucciones

1. Define un tipo o clase que represente un reloj con horas (`hh`) y minutos (`mm`).
2. Implementa un constructor que reciba `hh` y `mm`.
3. Implementa un método que:
   - Sume o reste un número de minutos.
   - Ajuste la hora resultante dentro del rango de 24 horas.
4. Devuelve la hora normalizada en formato `hh:mm`.

## Ejemplos de uso

| Operación            | Resultado |
|----------------------|-----------|
| Crear reloj 00:00    | 00:00     |
| 00:00 + 60 min       | 01:00     |
| 10:00 + 75 min       | 11:15     |
| 23:00 + 120 min      | 01:00     |
| 00:30 − 60 min       | 23:30     |