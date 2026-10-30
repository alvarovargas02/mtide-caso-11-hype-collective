-- Plata: publicaciones de la campaña.
-- Normalizamos los nombres y convertimos el alcance a número.

select
    trim(post_id) as post_id,
    upper(trim(creador)) as creador,
    try_cast(alcance as integer) as alcance
from {{ source('bronce', 'posts_campana') }}