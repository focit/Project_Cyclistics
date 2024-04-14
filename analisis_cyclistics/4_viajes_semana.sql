/*
Pregunta: ¿En qué se diferencian los Subscriber y los Customer que usan el servicio de bicicletas en el total de viajes realizados por día de la semana?
- Utilizar la tabla con los recorridos totales del año.
- Sumar el tiempo de los recorridos de cada uno de los usuarios y agruparlo por cada uno de los tipos.
- Contabilizar los recorridos de los usuarios y agruparlo por cada uno de los tipos.
¿Por qué? Observar el comportamiento de los dos tipos de usuarios en cada uno de los días de la semana.
*/

WITH viajes_2019_anual AS (
SELECT * FROM viajes_2019_ene_mar
UNION ALL
SELECT * FROM viajes_2019_abr_jun
UNION ALL
SELECT * FROM viajes_2019_jul_sep
UNION ALL
SELECT * FROM viajes_2019_oct_dic
)

SELECT
    weekday,
    AVG( CASE WHEN usertype = 'Customer' THEN ride_length ELSE NULL END) AS promedio_recorrido_customer,
    AVG( CASE WHEN usertype = 'Subscriber' THEN ride_length ELSE NULL END) AS promedio_recorrido_subscriber,
    SUM(CASE WHEN usertype = 'Customer' THEN 1 ELSE 0 END) AS total_viajes_customer,
    SUM(CASE WHEN usertype = 'Subscriber' THEN 1 ELSE 0 END) AS total_viajes_subscriber
FROM 
    viajes_2019_anual
GROUP BY
    weekday;

/*
Insights:
- Los Subscribers tienden a tener un tiempo promedio de recorrido más corto en comparación con los Customers 
en todos los días de la semana.
- El día con la mayor diferencia en el tiempo promedio de recorrido entre Subscribers y Customers es el sábado y el domingo (Día 7 y 1), 
donde los Customers tienen un tiempo promedio de recorrido significativamente más largo que los Subscribers.
- Los Subscribers realizan más recorridos en bicicleta en comparación con los Customers en los días laborables (Días 2-6).


Conclusiones:
- Esto puede sugerir que los usuarios Subscribers tienen rutas más directas y probablemente viajen distancias más cortas para ir a su
trabajo o realizar recados rápidos ya que los días con más recorridos son en días laborales.
- En cambio, los usuarios Customers realizan recorridos con un promedio de tiempo más largo y un aumento de recorridos en fines de semana, 
lo que se puede concluir que sean recorridos para explorar la ciudad o de recreacion.

[
  {
    "weekday": 1,
    "promedio_recorrido_customer": {
      "minutes": 42,
      "seconds": 17,
      "milliseconds": 336.902
    },
    "promedio_recorrido_subscriber": {
      "minutes": 14,
      "seconds": 20,
      "milliseconds": 642.06
    },
    "total_viajes_customer": "139272",
    "total_viajes_subscriber": "217531"
  },
  {
    "weekday": 2,
    "promedio_recorrido_customer": {
      "minutes": 39,
      "seconds": 45,
      "milliseconds": 972.561
    },
    "promedio_recorrido_subscriber": {
      "minutes": 12,
      "seconds": 35,
      "milliseconds": 225.937
    },
    "total_viajes_customer": "77444",
    "total_viajes_subscriber": "388161"
  },
  {
    "weekday": 3,
    "promedio_recorrido_customer": {
      "minutes": 39,
      "milliseconds": 995.101
    },
    "promedio_recorrido_subscriber": {
      "minutes": 12,
      "seconds": 36,
      "milliseconds": 54.736
    },
    "total_viajes_customer": "72260",
    "total_viajes_subscriber": "423379"
  },
  {
    "weekday": 4,
    "promedio_recorrido_customer": {
      "minutes": 38,
      "seconds": 18,
      "milliseconds": 910.936
    },
    "promedio_recorrido_subscriber": {
      "minutes": 12,
      "seconds": 38,
      "milliseconds": 816.617
    },
    "total_viajes_customer": "73026",
    "total_viajes_subscriber": "417095"
  },
  {
    "weekday": 5,
    "promedio_recorrido_customer": {
      "minutes": 39,
      "seconds": 21,
      "milliseconds": 383.225
    },
    "promedio_recorrido_subscriber": {
      "minutes": 12,
      "seconds": 39,
      "milliseconds": 433.15
    },
    "total_viajes_customer": "80882",
    "total_viajes_subscriber": "405072"
  },
  {
    "weekday": 6,
    "promedio_recorrido_customer": {
      "minutes": 39,
      "seconds": 46,
      "milliseconds": 358.564
    },
    "promedio_recorrido_subscriber": {
      "minutes": 12,
      "seconds": 33,
      "milliseconds": 767.854
    },
    "total_viajes_customer": "97436",
    "total_viajes_subscriber": "381406"
  },
  {
    "weekday": 7,
    "promedio_recorrido_customer": {
      "minutes": 42,
      "seconds": 21,
      "milliseconds": 552.688
    },
    "promedio_recorrido_subscriber": {
      "minutes": 14,
      "seconds": 30,
      "milliseconds": 728.165
    },
    "total_viajes_customer": "159998",
    "total_viajes_subscriber": "233311"
  }
]
*/