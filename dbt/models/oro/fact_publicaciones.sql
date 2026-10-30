-- GOLD · tabla de hechos de publicaciones.
-- Cada fila representa una publicación del parte limpio.

select
    post_id,
    fecha,
    creador,
    plataforma,
    sector,
    miles_vistas,
    horas_produccion,
    importe_eur,
    case
        when incidencia is not null and trim(incidencia) <> '' then true
        else false
    end as con_incidencia
from {{ ref('stg_parte') }}