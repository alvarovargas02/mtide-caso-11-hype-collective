-- Pregunta 1: sector con menor ingreso por cada mil visualizaciones.

select
    sector,
    sum(importe_eur) / nullif(sum(miles_vistas), 0) as ingreso_mil
from {{ ref('fact_publicaciones') }}
group by sector
order by ingreso_mil asc
