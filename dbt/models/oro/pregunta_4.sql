-- Pregunta 4: rendimiento de cada creador por euro invertido.
-- Comparamos las interacciones brutas con las interacciones reales.
-- Agregamos antes de unir con las tarifas para evitar duplicaciones.

with interacciones_brutas as (
    select
        upper(trim(creador)) as creador,
        count(*) as total_brutas
    from {{ source('bronce', 'eventos') }}
    group by upper(trim(creador))
),

interacciones_reales as (
    select
        creador,
        count(*) as total_reales
    from {{ ref('stg_eventos') }}
    group by creador
)

select
    t.creador,
    t.tarifa_campana_eur,
    coalesce(b.total_brutas, 0) as interacciones_brutas,
    coalesce(r.total_reales, 0) as interacciones_reales,
    round(coalesce(b.total_brutas, 0) / t.tarifa_campana_eur, 4)
        as interacciones_brutas_por_euro,
    round(coalesce(r.total_reales, 0) / t.tarifa_campana_eur, 4)
        as interacciones_reales_por_euro
from {{ ref('stg_tarifas') }} t
left join interacciones_brutas b
    on t.creador = b.creador
left join interacciones_reales r
    on t.creador = r.creador
order by interacciones_reales_por_euro desc