# Custom Signs

## Descripción

En este ejercicio vas a ayudar a una empresa de cartelería a generar mensajes personalizados para distintos eventos.  
Deberás implementar varias funciones en ABAP que construyan textos dinámicos en función de los datos proporcionados, como nombres, ocasiones o edades.

## Objetivo

Implementar varios métodos en ABAP que permitan:

- Generar mensajes personalizados para ocasiones.
- Crear mensajes específicos para cumpleaños.
- Generar mensajes de graduación.
- Calcular el coste de un cartel según su contenido.

## Funcionalidades a implementar

### 1. Crear un cartel para una ocasión

Implementa el método `build_sign( )` que reciba:

- `occasion` (string)
- `name` (string)

Debe devolver un mensaje con el siguiente formato:
Happy <occasion> <name>!

Ejemplo:
Entrada: occasion = "Birthday", name = "Rob"
Salida: "Happy Birthday Rob!"

---

### 2. Crear un cartel de cumpleaños

Implementa el método `build_birthday_sign( )` que reciba:

- `age` (entero)

Debe devolver un mensaje dependiendo de la edad:

- Si la edad es **50 o más** → usar la palabra `"mature"`
- Si es menor de 50 → usar `"young"`

Formato:
Happy Birthday! What a <young|mature> fellow you are.

Ejemplo:
Entrada: 45
Salida: "Happy Birthday! What a young fellow you are."

---

### 3. Crear un cartel de graduación

Implementa el método `graduation_for( )` que reciba:

- `name` (string)
- `year` (entero)

Debe devolver un mensaje en dos líneas:
Congratulations <name>!
Class of <year>

Ejemplo:
Entrada: name = "Hannah", year = 2022
Salida:
"Congratulations Hannah!
Class of 2022"

---

### 4. Calcular el coste de un cartel

Implementa el método `cost_of( )` que reciba:

- `sign` (string con el mensaje)
- `currency` (string)

Reglas de coste:

- Precio base: **20 unidades de la moneda**
- Cada carácter del cartel (incluyendo espacios) cuesta **2 unidades**

El resultado debe devolverse como un string con **dos decimales**, en este formato:
Your sign costs <coste> <currency>.

Ejemplo:
Entrada: sign = "Happy Birthday Rob!", currency = "euros"
Salida: "Your sign costs 58.00 euros."

## Instrucciones para implementar

1. Define los métodos indicados en una clase ABAP.
2. Usa **string templates** para construir los mensajes dinámicos.
3. Calcula correctamente la longitud del string para el coste.
4. Asegúrate de formatear el número con **dos decimales**.
5. Devuelve siempre los resultados en el formato exacto esperado.