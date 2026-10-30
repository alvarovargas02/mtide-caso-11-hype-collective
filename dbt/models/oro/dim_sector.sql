-- GOLD · dimensión de sectores.
-- Una fila por cada sector distinto del parte limpio.

select distinct
    sector
from {{ ref('stg_parte') }}
where sector is not null