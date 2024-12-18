/*
1. Comportamiento general
Pregunta: ¿Qué diferencias existen en la duración promedio de viajes?
- Contabilizar la duración promedio de viajes que realizaron cada tipo de cliente.
¿Por qué? Conocer la diferencia del tiempo de uso de cada cliente.
*/


SELECT 
    usertype,
    Round(avg(trip_duration)/60,2) AS promedio_viaje_min
FROM viajes_2019
  GROUP BY 1;


/*
Insights:

-Los miembros realizan viajes más cortos y frecuentes: La menor duración promedio de los viajes de los miembros 
sugiere que utilizan las bicicletas para desplazamientos más cortos, como ir al trabajo, hacer recados o realizar 
actividades recreativas cercanas.

-Los clientes ocasionales prefieren viajes más largos: La mayor duración promedio de los viajes de los clientes 
ocasionales podría indicar que los utilizan para explorar la ciudad, hacer turismo o realizar actividades de ocio 
que requieren más tiempo.

-Propósito del viaje: Los miembros, al tener una suscripción anual, pueden utilizar las bicicletas de forma más regular 
para desplazamientos diarios, mientras que los clientes ocasionales suelen alquilarlas para actividades específicas que 
requieren más tiempo.

-Familiaridad con la ciudad: Los miembros, al ser usuarios frecuentes, probablemente estén más familiarizados con las 
rutas y destinos de la ciudad, lo que les permite realizar viajes más cortos y eficientes.

[
  {
    "usertype": "Miembro",
    "promedio_viaje_min": "14.24"
  },
  {
    "usertype": "Ocasional",
    "promedio_viaje_min": "58.44"
  }
]

*/