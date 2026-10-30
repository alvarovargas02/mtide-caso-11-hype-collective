-- Pregunta 3: plataforma con más incidencias por cada millón de visualizaciones.

select
    plataforma,
    sum(case when con_incidencia then 1 else 0 end) * 1000.0
        / nullif(sum(miles_vistas), 0) as incidencias_millon
from {{ ref('fact_publicaciones') }}
group by plataforma
order by incidencias_millon desc