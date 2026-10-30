# Memo ejecutivo · Hype Collective

## Resumen para dirección

El análisis del parte de publicaciones y de los datos de campaña permite identificar oportunidades para mejorar la rentabilidad, la eficiencia productiva y el control de las colaboraciones.

## 1. Sectores con menor ingreso por visualizaciones

El sector con menor ingreso por cada mil visualizaciones es **{{ pregunta_1.sector[0] }}**, con {{ pregunta_1.ingreso_mil[0] }} € por cada mil visualizaciones.

**Recomendación:** revisar la rentabilidad de las campañas de este sector antes de incrementar la inversión.

## 2. Eficiencia de producción

El creador que más horas necesita por cada 100.000 visualizaciones es **{{ pregunta_2.creador[0] }}**, con {{ pregunta_2.horas_100mil[0] }} horas.

**Recomendación:** analizar su proceso de producción e identificar posibles mejoras de eficiencia.

## 3. Incidencias por plataforma

La plataforma con mayor número de incidencias por millón de visualizaciones es **{{ pregunta_3.plataforma[0] }}**, con {{ pregunta_3.incidencias_millon[0] }} incidencias.

**Recomendación:** reforzar el seguimiento de las publicaciones y revisar las causas de las incidencias en esta plataforma.

## 4. Rentabilidad de las colaboraciones

El creador que genera más interacciones reales por euro invertido es **{{ pregunta_4.creador[0] }}**, con {{ pregunta_4.interacciones_reales_por_euro[0] }} interacciones por euro.

La comparación con los datos brutos muestra que utilizar registros sin depurar puede alterar la clasificación de los creadores. Por ejemplo, Dani parecía el más rentable antes de eliminar duplicados y actividad automatizada, mientras que Julia obtiene el mejor resultado con las interacciones válidas.

**Recomendación:** utilizar las interacciones depuradas para valorar futuras colaboraciones y asignar el presupuesto.

## Qué no sabemos

- No se dispone de información suficiente para determinar si las diferencias de rentabilidad se mantienen en campañas futuras.
- La identificación de cuentas automatizadas se basa en patrones observados en este conjunto de datos, no en un sistema general de detección de bots.
- El análisis no incorpora otros factores como la calidad de las interacciones, las conversiones o las ventas generadas.
- Las recomendaciones deberían revisarse cuando se disponga de más campañas y datos de resultados comerciales.

## Cómo se ha hecho

Se han integrado los datos en un lakehouse con zonas bronce, plata y oro. Se han limpiado y transformado las fuentes, creado dimensiones y tablas de hechos y aplicado pruebas de calidad con dbt. Los resultados se presentan mediante modelos específicos para cada pregunta de negocio.