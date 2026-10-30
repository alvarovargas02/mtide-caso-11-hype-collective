-- Comprueba que las interacciones válidas de cada publicación
-- no superen el alcance declarado.
-- Los eventos ya están deduplicados y las cuentas bot excluidas en stg_eventos.

with interacciones as (
    select
        post_id,
        count(*) as total_interacciones
    from {{ ref('stg_eventos') }}
    group by post_id
)

select
    p.post_id,
    p.alcance,
    coalesce(i.total_interacciones, 0) as total_interacciones
from {{ ref('stg_posts_campana') }} p
left join interacciones i
    on p.post_id = i.post_id
where coalesce(i.total_interacciones, 0) > p.alcance