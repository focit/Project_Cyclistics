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
    SUM( CASE WHEN usertype = 'Customer' THEN ride_length ELSE NULL END) AS tiempo_recorrido_customer,
    SUM( CASE WHEN usertype = 'Subscriber' THEN ride_length ELSE NULL END) AS tiempo_recorrido_subscriber,
    SUM(CASE WHEN usertype = 'Customer' THEN 1 ELSE 0 END) AS total_viajes_customer,
    SUM(CASE WHEN usertype = 'Subscriber' THEN 1 ELSE 0 END) AS total_viajes_suscriber
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
- Esto puede sugerir que los Subscribers tienen rutas más directas y probablemente viajen distancias más cortas en comparación 
con los Customers, que pueden ser turistas o usuarios ocasionales que exploran la ciudad.

[
  {
    "weekday": 1,
    "tiempo_recorrido_customer": {
      "hours": 98161,
      "minutes": 6,
      "seconds": 25
    },
    "tiempo_recorrido_subscriber": {
      "hours": 52004,
      "minutes": 32,
      "seconds": 8
    },
    "total_viajes_customer": "139272",
    "total_viajes_suscriber": "217531"
  },
  {
    "weekday": 2,
    "tiempo_recorrido_customer": {
      "hours": 51327,
      "minutes": 34,
      "seconds": 19
    },
    "tiempo_recorrido_subscriber": {
      "hours": 81430,
      "minutes": 20,
      "seconds": 55
    },
    "total_viajes_customer": "77444",
    "total_viajes_suscriber": "388161"
  },
  {
    "weekday": 3,
    "tiempo_recorrido_customer": {
      "hours": 46988,
      "minutes": 58,
      "seconds": 26
    },
    "tiempo_recorrido_subscriber": {
      "hours": 88916,
      "minutes": 1,
      "seconds": 38
    },
    "total_viajes_customer": "72260",
    "total_viajes_suscriber": "423379"
  },
  {
    "weekday": 4,
    "tiempo_recorrido_customer": {
      "hours": 46633,
      "minutes": 24,
      "seconds": 30
    },
    "tiempo_recorrido_subscriber": {
      "hours": 87916,
      "minutes": 16,
      "seconds": 57
    },
    "total_viajes_customer": "73026",
    "total_viajes_suscriber": "417095"
  },
  {
    "weekday": 5,
    "tiempo_recorrido_customer": {
      "hours": 53053,
      "minutes": 43,
      "seconds": 18
    },
    "tiempo_recorrido_subscriber": {
      "hours": 85451,
      "minutes": 25,
      "seconds": 5
    },
    "total_viajes_customer": "80882",
    "total_viajes_suscriber": "405072"
  },
  {
    "weekday": 6,
    "tiempo_recorrido_customer": {
      "hours": 64588,
      "minutes": 7,
      "seconds": 13
    },
    "tiempo_recorrido_subscriber": {
      "hours": 79858,
      "minutes": 46,
      "seconds": 22
    },
    "total_viajes_customer": "97436",
    "total_viajes_suscriber": "381406"
  },
  {
    "weekday": 7,
    "tiempo_recorrido_customer": {
      "hours": 112956,
      "minutes": 29,
      "seconds": 7
    },
    "tiempo_recorrido_subscriber": {
      "hours": 56430,
      "minutes": 40,
      "seconds": 59
    },
    "total_viajes_customer": "159998",
    "total_viajes_suscriber": "233311"
  }
]
*/