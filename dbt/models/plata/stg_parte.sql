-- PLATA · el parte diario limpio: la limpieza que hiciste en la J3, ahora como modelo dbt.
-- Cada entrega del parte es una carpeta fecha_carga=… en bronce: aquí se leen todas juntas.
with bruto as (
    select *, parse_filename(filename) as archivo
    from {{ source('bronce', 'parte') }}
),
sin_dup as (
    -- una fila por post_id
    select * from bruto
    qualify row_number() over (partition by post_id order by fecha_carga desc) = 1
),
mediana_sector as (
    select sector, median(miles_vistas::integer) as miles_vistas_mediana
    from sin_dup
    where miles_vistas::integer between 1 and 50000
    group by sector
)
select
    s.post_id,
    s.fecha::date                                              as fecha,
    upper(trim(s.creador))                                         as creador,
    s.plataforma,
    s.sector,
    case when s.miles_vistas::integer between 1 and 50000 then s.miles_vistas::integer
         else round(m.miles_vistas_mediana)::integer end               as miles_vistas,
    not (s.miles_vistas::integer between 1 and 50000)                   as miles_vistas_corregido,
    s.horas_produccion::double                                              as horas_produccion,
    s.importe_eur::double                                      as importe_eur,
    s.incidencia,
    s.archivo,
    s.fecha_carga
from sin_dup s
join mediana_sector m using (sector)
