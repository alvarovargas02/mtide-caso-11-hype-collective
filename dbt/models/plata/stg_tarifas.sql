-- Plata: tarifas pactadas para cada creador.

select
    upper(trim(creador)) as creador,
    try_cast(tarifa_campana_eur as decimal(12,2)) as tarifa_campana_eur
from {{ source('bronce', 'tarifas') }}