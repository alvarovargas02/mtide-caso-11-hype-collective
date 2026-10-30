-- GOLD · dimensión de creadores.
-- Una fila por cada creador distinto del parte limpio.

select distinct
    creador
from {{ ref('stg_parte') }}
where creador is not null