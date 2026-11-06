-- Historia: eficiencia de la inversión por sector.
-- Medimos miles de visualizaciones obtenidas por cada euro invertido.

select
    sector,
    count(*) as publicaciones,
    sum(miles_vistas) as miles_vistas_totales,
    sum(importe_eur) as inversion_eur,
    round(
        sum(miles_vistas) / nullif(sum(importe_eur), 0),
        6
    ) as miles_vistas_por_euro
from {{ ref('fact_publicaciones') }}
group by sector
order by miles_vistas_por_euro desc
