# Bloque 3 · Nuevas fuentes y calidad de los datos

## 1. Incorporación de nuevas fuentes

En este bloque se incorporaron tres nuevas fuentes de información en la zona bronce:

- `posts_campana.csv`: contiene las seis publicaciones de la campaña, su creador y el alcance de cada una.
- `tarifas.csv`: recoge el importe pactado con cada creador.
- `interacciones_campana_2026-05-03.json`: contiene el registro de interacciones de los usuarios, incluyendo likes, comentarios y publicaciones compartidas.

Los archivos originales se conservaron sin modificar. La limpieza se realizó en la zona plata.

## 2. Problemas detectados en los datos

El registro original contenía **8.535 interacciones** y **8.316 identificadores distintos**. Por tanto, se detectaron **219 registros duplicados**.

También se identificaron ocho cuentas con un patrón de actividad anómalo: cada una acumulaba 300 interacciones concentradas en una única publicación. Estas cuentas, identificadas por el prefijo `B` en su usuario, sumaban **2.400 interacciones**.

Se decidió excluir los duplicados y estas cuentas automatizadas para calcular las interacciones reales. Esta regla responde al patrón observado en los datos de este caso y no constituye un sistema general de detección de bots.

## 3. Limpieza y transformación

Se crearon tres modelos en plata:

- `stg_posts_campana`: normaliza los identificadores y nombres de creadores y convierte el alcance a formato numérico.
- `stg_tarifas`: normaliza los nombres y convierte las tarifas a formato decimal.
- `stg_eventos`: elimina duplicados por identificador, excluye las cuentas automatizadas y normaliza los campos de las interacciones.

Tras la limpieza quedaron **5.916 interacciones válidas**, correspondientes a 5.625 usuarios distintos.

## 4. Prueba de calidad: interacciones y alcance

Se creó la prueba `alcance_no_superado.sql` para comprobar que las interacciones válidas de cada publicación no superasen su alcance declarado.

La primera versión de la prueba utilizaba los datos brutos y falló, detectando una publicación cuyo número de interacciones superaba el alcance. Después se modificó para utilizar los modelos limpios de plata.

Con los duplicados y las cuentas automatizadas excluidos, la prueba pasó correctamente.

| Publicación | Alcance | Interacciones válidas |
|---|---:|---:|
| CAMP-01 | 1.728 | 1.044 |
| CAMP-02 | 1.248 | 767 |
| CAMP-03 | 2.208 | 1.361 |
| CAMP-04 | 1.152 | 708 |
| CAMP-05 | 1.440 | 870 |
| CAMP-06 | 1.920 | 1.166 |

## 5. Pregunta 4: interacciones reales por euro

Para evaluar el rendimiento de cada creador se compararon las interacciones brutas con las interacciones reales, teniendo en cuenta la tarifa de cada uno.

El cálculo se realizó agregando primero las interacciones por creador y después relacionándolas con las tarifas. De esta forma se evita multiplicar registros al combinar las tablas.

El resultado cambia considerablemente según se utilicen datos brutos o depurados:

- **Julia Reads** obtiene el mejor resultado real, con aproximadamente 1,011 interacciones por euro invertido (708 interacciones válidas y una tarifa de 700 €).
- **Dani Plays** parecía el creador más rentable con los datos brutos, con 3,557 interacciones por euro (3.201 interacciones y una tarifa de 900 €). Sin embargo, tras la limpieza baja a aproximadamente 0,852 interacciones reales por euro (767 interacciones válidas).

Esto demuestra que utilizar los datos sin depurar habría llevado a sobrevalorar el rendimiento de Dani y