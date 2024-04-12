/*
Pregunta: ¿En qué se diferencian los Subscriber y los Customer que usan el servicio de bicicletas en cuanto al género?
- Retomar la tabla anterior con los viajes anuales.
- Contablizar la cantidad de viajes realizados según el tipo de usuario.
- Agrupar los datos en el género de cada usuario que utilizó el servicio.
¿Por qué? Conocer el género de los cilentes subscriptores y ocasionales que utilizan el servicio.
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
    gender,
    SUM(CASE WHEN usertype = 'Customer' THEN 1 ELSE 0 END) AS viajes_customer,
    SUM(CASE WHEN usertype = 'Subscriber' THEN 1 ELSE 0 END) AS viajes_suscriber
FROM
    viajes_2019_anual
WHERE
    gender IS NOT NULL
GROUP BY
    gender;

/*
Insights:
Cantidad de Viajes:
- Tanto para Customers como para Subscribers, los hombres realizan una cantidad significativamente 
mayor de viajes en comparación con las mujeres.
- Los hombres tienen un total de 1,847,245 viajes como Subscribers, mientras que las mujeres tienen solo 599,795 viajes.
- Del mismo modo, los hombres tienen 164,712 viajes como Customers, mientras que las mujeres tienen 103,695 viajes.

Conslusiones:
- Esta diferencia puede estar influenciada por diversos factores, como las preferencias de transporte, 
la ubicación geográfica, la seguridad percibida y las actividades recreativas.
- La promoción de la igualdad de género y la inclusión en el uso del servicio de bicicletas podría ser una área de 
enfoque para aumentar la diversidad de usuarios y promover una mayor participación en el ciclismo urbano.

[
  {
    "gender": "Female",
    "viajes_customer": "103695",
    "viajes_suscriber": "599795"
  },
  {
    "gender": "Male",
    "viajes_customer": "164712",
    "viajes_suscriber": "1847245"
  }
]
*/