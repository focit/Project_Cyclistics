/*
Pregunta: ¿En qué se diferencian los Subscriber y los Customer que usan el servicio de bicicletas en la cantidad de viajes y el total del tiempo recorrido?".
- Unifica las cuatro tablas trimestrales en una tabla anual.
- Contabiliza el total de recorridos que realizaron los usuarios.
- Suma el tiempo de los recorridos que realizaron los usuarios.
- Divide ambos resultados entre los dos tipos de usuarios: Customer y Subscriber.
¿Por qué? Establecer la diferencia en el uso del servicio de Cyclistics entre los Customer y los Subscriber en los recorridos realizados en 2019.
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
    usertype,
    COUNT(*) As viajes_totales,
    SUM(ride_length) AS recorridos_totales
FROM 
    viajes_2019_anual
GROUP BY
    usertype;

/*
Insights:
Total de recorridos realizados:
- Los Subscribers tienen una cantidad significativamente mayor de viajes en comparación con los Customers. Con un total de 
2,465,955 viajes durante 2019.
- Mientras que los Customers realizaron 700,318 viajes en el mismo período analizado.
- Esta diferencia sugiere que los Subscribers son usuarios más frecuentes del servicio de bicicletas en comparación con los Customers.

Total del Tiempo Recorrido:
- Aunque los Subscribers tienen más viajes totales, los Customers tienen un total de tiempo recorrido más largo.
- Los Customers acumularon un total de 473,709 horas, 23 minutos y 18 segundos de tiempo recorrido, 
mientras que los Subscribers acumularon 532,008 horas, 4 minutos y 4 segundos de tiempo recorrido.
A pesar de realizar menos viajes en total, los Customers pasan más tiempo en promedio utilizando el servicio de bicicletas 
en comparación con los Subscribers.

Conclusiones:
- Los Subscribers tienden a utilizar el servicio de bicicletas para viajes más cortos y frecuentes, 
como desplazamientos diarios al trabajo u otras actividades regulares.
- Los Customers, por otro lado, pueden utilizar el servicio de bicicletas para viajes más largos y menos frecuentes, 
como actividades recreativas o turísticas.


[
  {
    "usertype": "Customer",
    "viajes_totales": "700318",
    "recorridos_totales": {
      "hours": 473709,
      "minutes": 23,
      "seconds": 18
    }
  },
  {
    "usertype": "Subscriber",
    "viajes_totales": "2465955",
    "recorridos_totales": {
      "hours": 532008,
      "minutes": 4,
      "seconds": 4
    }
  }
]
*/


