
# 1 · La remesa nueva

## Qué llegó

El 1 de mayo de 2026 llegó una nueva entrega del parte diario, con 95 publicaciones correspondientes al periodo del 21 al 30 de abril. Al inspeccionar el CSV encontramos 56 filas con valores abreviados con «K» en la columna `miles_vistas`, como `103K` o `73K`. También detectamos 11 publicaciones con espacios sobrantes al principio o al final del nombre del creador.

## Cómo lo descubrimos

Inspeccionamos directamente los datos originales de bronce mediante consultas SQL y comandos de terminal. La conversión directa de `miles_vistas` a entero que utilizaba el modelo anterior no era compatible con valores como `103K`. También comprobamos que los nombres de algunos creadores contenían espacios que podían generar registros diferentes para una misma persona.

No llegamos a ejecutar el modelo con la remesa sin corregir previamente el SQL, por lo que no afirmamos que ningún test fallase inicialmente.

## Cómo lo arreglamos

La solución se aplicó en la capa plata, modificando `stg_parte.sql`. Primero eliminamos la «K» de los valores abreviados y después los convertimos a enteros. También mantenemos la normalización de los creadores mediante `upper(trim(...))`.

No modificamos los archivos de bronce porque representan los datos originales recibidos y deben conservarse sin cambios. La limpieza y las transformaciones corresponden a la capa plata.

## Resultado

La construcción del modelo y sus siete tests terminaron correctamente: 8 de 8 comprobaciones superadas, sin errores ni advertencias. Las comprobaciones posteriores confirmaron que valores como `103K` y `73K` se convierten en `103` y `73`, respectivamente.
