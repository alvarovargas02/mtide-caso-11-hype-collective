# Educación logra la mayor eficiencia: {{ historia_sector.miles_vistas_por_euro[0] }} miles de visualizaciones por euro

Hype Collective debería estudiar una mayor inversión en educación: es el sector con más visualizaciones por euro invertido. Educación alcanza {{ historia_sector.miles_vistas_por_euro[0] }}, frente a {{ historia_sector.miles_vistas_por_euro[7] }} de tecnología. Proponemos realizar una prueba controlada antes del 30 de noviembre de 2026.

```grafico
tipo: barras
titular: Educación consigue la mayor eficiencia de visualizaciones por euro
modelo: historia_sector
barras: sector → miles_vistas_por_euro
destacar: educación
orden: desc

## Distribución de visualizaciones

```grafico
tipo: histograma
titular: La distribución de visualizaciones por publicación
modelo: fact_publicaciones
columna: miles_vistas
```