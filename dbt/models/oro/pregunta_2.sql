-- Pregunta 2: creador con más horas de producción por cada 100.000 visualizaciones.

select
    creador,
    sum(horas_produccion) * 100 / nullif(sum(miles_vistas), 0) as horas_100mil
from {{ ref('fact_publicaciones') }}
group by creador
order by horas_100mil desc