-- Historia: evolución semanal de las publicaciones y visualizaciones.

select
    date_trunc('week', fecha)::date as semana,
    count(*) as publicaciones,
    sum(miles_vistas) as miles_vistas_totales,
    round(avg(miles_vistas), 2) as media_por_publicacion
from {{ ref('fact_publicaciones') }}
group by 1
order by 1
