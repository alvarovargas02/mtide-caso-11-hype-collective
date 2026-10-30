# 2 · El oro

## La tabla de hechos y sus dimensiones

La tabla `fact_publicaciones` contiene **480 filas**, una por cada publicación del conjunto de datos. Cada registro recoge información sobre la fecha, el creador, la plataforma, el sector, las visualizaciones, las horas de producción, el importe y si la publicación tuvo alguna incidencia.

Esta tabla se relaciona con tres dimensiones:
- `dim_creador`: identifica los creadores.
- `dim_plataforma`: recoge las plataformas utilizadas.
- `dim_sector`: clasifica las publicaciones por sector.

En total, contamos con 10 creadores, 6 plataformas y 8 sectores distintos.

## Pregunta 1 · Sector con menor ingreso por cada mil visualizaciones

El sector que presenta el menor ingreso por cada mil visualizaciones es **{{ pregunta_1.sector[0] }}**, con **{{ pregunta_1.ingreso_mil[0] }} €**.

Esto indica que, en relación con las visualizaciones obtenidas, es el sector que genera menos ingresos.

## Pregunta 2 · Creador con más horas por cada 100.000 visualizaciones

El creador que necesita más tiempo de producción es **{{ pregunta_2.creador[0] }}**, con **{{ pregunta_2.horas_100mil[0] }} horas por cada 100.000 visualizaciones**.

Este resultado permite identificar qué creador requiere más esfuerzo de producción en relación con el alcance conseguido.

## Pregunta 3 · Plataforma con más incidencias por millón de visualizaciones

La plataforma con mayor tasa de incidencias es **{{ pregunta_3.plataforma[0] }}**, con **{{ pregunta_3.incidencias_millon[0] }} incidencias por millón de visualizaciones**.

Es un dato relevante para valorar la calidad y los posibles problemas asociados a las publicaciones en cada plataforma.

## Comparación con la J3

La nueva remesa incorpora 95 publicaciones a las 385 iniciales, alcanzando un total de 480. Esto supone un incremento aproximado del 24,7 %.

La incorporación de nuevos datos puede modificar los resultados de las preguntas, ya que cambian los volúmenes de publicaciones, visualizaciones, ingresos e incidencias. Por eso, es importante recalcular los indicadores con el conjunto completo y no dar por hecho que las conclusiones iniciales se mantienen.