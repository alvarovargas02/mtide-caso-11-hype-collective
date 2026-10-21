-- horas_produccion tiene que estar en un rango creíble para este negocio (0.85 a 20.8).
select post_id, horas_produccion from {{ ref('stg_parte') }}
where horas_produccion not between 0.85 and 20.8
