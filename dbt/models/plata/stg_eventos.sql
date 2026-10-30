-- Plata: interacciones válidas de la campaña.
-- Eliminamos duplicados por interaccion_id y cuentas automatizadas.
-- En este caso, las cuentas identificadas con prefijo B presentan
-- 300 interacciones concentradas en un único post.

with eventos_numerados as (
    select
        *,
        row_number() over (
            partition by interaccion_id
            order by ts
        ) as numero_fila
    from {{ source('bronce', 'eventos') }}
)

select
    trim(interaccion_id) as interaccion_id,
    trim(post_id) as post_id,
    upper(trim(creador)) as creador,
    trim(usuario_id) as usuario_id,
    lower(trim(tipo)) as tipo,
    cast(ts as timestamp) as ts
from eventos_numerados
where numero_fila = 1
  and usuario_id not like 'B%'