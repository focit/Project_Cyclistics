/*
Pregunta: ¿En qué se diferencian los Subscriber y los Customer que usan el servicio de bicicletas en el total de viajes realizados por mes durante el 2019?
- Retomar la tabla sobre la cantidad de recorridos del ejercicio 4.
- Dividir el total de recorridos por mes.
¿Por qué? Observar el comportamiento de los usuarios y qué meses son los que tiene más cantidad de recorridos.
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
    Month,
    SUM(CASE WHEN usertype = 'Customer' THEN 1 ELSE 0 END) AS total_viajes_customer,
    SUM(CASE WHEN usertype = 'Subscriber' THEN 1 ELSE 0 END) AS total_viajes_suscriber
FROM 
    viajes_2019_anual
GROUP BY
    Month;

/*
Insights:
- Los Subscribers muestran consistentemente un total de recorridos más alto que los Customers en todos los meses del año.
- En los meses con mayor actividad, como junio, julio y agosto, la brecha entre Subscribers y Customers es más notable, 
con una diferencia significativa en el total de recorridos.
- Los Subscribers tienden a utilizar el servicio de bicicletas de manera más frecuente y constante a lo largo del año, 
como lo demuestran los totales de recorridos más altos en casi todos los meses.
- Los Customers muestran fluctuaciones en su uso del servicio a lo largo del año, con picos de actividad 
en los meses de mayor clima cálido, como mayo, junio, julio y agosto.

Conclusiones:
- La actividad de los Customers parece estar más influenciada por las estaciones y el clima, 
con un aumento en los meses más cálidos y una disminución en los meses más fríos.
-Los Subscribers muestran una mayor consistencia en su uso del servicio, lo que sugiere que podrían estar utilizando 
el servicio como una forma de transporte regular independientemente de las condiciones climáticas.
- La oferta de promociones y descuentos durante los meses de menor actividad podría ser una forma de incentivar el uso 
del servicio entre los Customers y compensar la disminución estacional en la demanda.

[
  {
    "month": 1,
    "total_viajes_customer": "4602",
    "total_viajes_suscriber": "98670"
  },
  {
    "month": 2,
    "total_viajes_customer": "2638",
    "total_viajes_suscriber": "93548"
  },
  {
    "month": 3,
    "total_viajes_customer": "15923",
    "total_viajes_suscriber": "149688"
  },
  {
    "month": 4,
    "total_viajes_customer": "47744",
    "total_viajes_suscriber": "217566"
  },
  {
    "month": 5,
    "total_viajes_customer": "81624",
    "total_viajes_suscriber": "285834"
  },
  {
    "month": 6,
    "total_viajes_customer": "106566",
    "total_viajes_suscriber": "309241"
  },
  {
    "month": 7,
    "total_viajes_customer": "175632",
    "total_viajes_suscriber": "381683"
  },
  {
    "month": 8,
    "total_viajes_customer": "159395",
    "total_viajes_suscriber": "331865"
  },
  {
    "month": 10,
    "total_viajes_customer": "71035",
    "total_viajes_suscriber": "300751"
  },
  {
    "month": 11,
    "total_viajes_customer": "18729",
    "total_viajes_suscriber": "158447"
  },
  {
    "month": 12,
    "total_viajes_customer": "16430",
    "total_viajes_suscriber": "138662"
  }
]
*/