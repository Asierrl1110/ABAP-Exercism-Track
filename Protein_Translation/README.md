# Protein Translation

## Descripción

En este ejercicio vas a implementar una función en ABAP que traduzca una **secuencia de ARN (RNA)** en una lista de proteínas (*aminoácidos*). Una secuencia de ARNm se divide en grupos de tres nucleótidos llamados **codones**, y cada codón representa un aminoácido o una señal de parada (*STOP*).

## Objetivo

- Crear un método que reciba una cadena de ARN (por ejemplo `"AUGUUUUCU"`). 
- Dividirla en codones de tres letras (por ejemplo: `AUG`, `UUU`, `UCU`).
- Traducir cada codón a su correspondiente proteína.
- Detener la traducción si se encuentra un codón de **STOP** y **ignorar cualquier codón posterior**.

## Tabla de codones

| Codones                      | Proteína         |
|------------------------------|------------------|
| `AUG`                        | Methionine       |
| `UUU`, `UUC`                 | Phenylalanine    |
| `UUA`, `UUG`                 | Leucine          |
| `UCU`, `UCC`, `UCA`, `UCG`   | Serine           |
| `UAU`, `UAC`                 | Tyrosine         |
| `UGU`, `UGC`                 | Cysteine         |
| `UGG`                        | Tryptophan       |
| `UAA`, `UAG`, `UGA`          | **STOP** (termina la traducción) |

## Instrucciones

1. Crea una clase o método que reciba una cadena de ARN (`string`).
2. Divide la cadena en segmentos de **tres letras** (*codones*).
3. Para cada codón:
   - Si corresponde a un aminoácido, agrégalo a la lista de proteínas.
   - Si corresponde a un codón de **STOP**, detén la traducción y no proceses más. 
4. Devuelve la lista de proteínas traducidas.

## Ejemplo de uso

Dada la cadena:
AUGUUUUCU

- El resultado sería:  
  - `["Methionine", "Phenylalanine", "Serine"]`

Si la entrada contiene STOP, como en:
AUGUUUUCUUAAAUG

- El resultado será **igual que antes**:  
  - `["Methionine", "Phenylalanine", "Serine"]`  
  porque se detiene al encontrar `UAA`.