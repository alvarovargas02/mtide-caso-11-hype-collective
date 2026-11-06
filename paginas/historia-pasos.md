# Cómo se construyó la historia

La decisión es estudiar una mayor inversión en educación. Para llegar a ella hemos analizado las publicaciones, su evolución y la eficiencia de cada sector.

## Paso 1 · De tema a decisión

| Elemento | Definición |
|---|---|
| Tema | Eficiencia de la inversión en publicaciones. |
| Pregunta | ¿Qué sectores generan más visualizaciones por euro? |
| Decisión | Probar una mayor inversión en educación antes del 30 de noviembre de 2026. |

## Paso 2 · Qué muestran los datos

Se han analizado 480 publicaciones entre el 2 de marzo y el 30 de abril de 2026.

```cifras
{{ fact_publicaciones.filas }} | Publicaciones analizadas
{{ historia_sector.sector[0] }} | Sector más eficiente
{{ historia_semanal.semana[0] }} | Inicio del periodo
{{ historia_semanal.semana[8] }} | Última semana

### Evolución semanal

```grafico
tipo: linea
titular: Las visualizaciones cambian a lo largo del periodo
modelo: historia_semanal
x: semana
y: miles_vistas_totales
```

## Distribución de visualizaciones

```grafico
tipo: histograma
titular: Las publicaciones tienen distintos niveles de visualizaciones
modelo: fact_publicaciones
columna: miles_vistas
```