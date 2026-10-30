-- GOLD · dimensión de plataformas.
-- Una fila por cada plataforma distinta del parte limpio.

select distinct
    plataforma
from {{ ref('stg_parte') }}
where plataforma is not null