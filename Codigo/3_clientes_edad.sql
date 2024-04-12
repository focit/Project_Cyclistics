/*
Pregunta: ¿En qué se diferencian los Subscriber y los Customer que usan el servicio de bicicletas en cuanto a la edad de los usuarios?
- El código del problema 2.
- Contablizar la cantidad de viajes realizados según el tipo de usuario.
- Agrupar los datos la fecha de nacimiento de cada usuario que utilizó el servicio.
- Restar el año del registro con su fecha de nacimiento para obtener la edad.
¿Por qué? Conocer la edad de los cilentes subscriptores y ocasionales que utilizan el servicio.
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
    2019-birthyear AS edad_del_usuario,
    SUM(CASE WHEN usertype = 'Customer' THEN 1 ELSE 0 END) AS viajes_customer,
    SUM(CASE WHEN usertype = 'Subscriber' THEN 1 ELSE 0 END) AS viajes_suscriber
FROM
    viajes_2019_anual
WHERE
    birthyear IS NOT NULL AND
    birthyear > 1938
GROUP BY
    birthyear;

/*
Insights:

- Se observa un patrón en el que la cantidad de viajes disminuye a medida que aumenta la edad, 
tanto para Customers como para Subscribers.
- Los usuarios más jóvenes, entre 16 y 30 años, tienden a realizar una mayor cantidad de viajes 
en comparación con los usuarios de mayor edad.
- Los usuarios de entre 30 y 40 años también muestran una cantidad considerable de viajes, 
aunque tienden a disminuir gradualmente a medida que aumenta la edad.

Conclusiones: 

- Los datos sugieren que el servicio de bicicletas puede ser más atractivo para los usuarios más jóvenes, 
quienes tienden a ser más activos en términos de viajes.
- La mayor concentración de usuarios en las edades entre 25 y 40 años podría atribuirse a la población activa 
y en edad laboral que utiliza el servicio como medio de transporte alternativo.
- La diferencia en la cantidad de viajes entre Subscribers y Customers sugiere que los Subscribers 
pueden estar más comprometidos con el servicio y pueden utilizarlo como una forma regular de transporte.
- Este análisis puede ser útil para diseñar estrategias de marketing dirigidas a diferentes grupos de edad 
y para mejorar la participación de los Customers en el servicio de bicicletas.






[
  {
    "edad_del_usuario": 80,
    "viajes_customer": "2",
    "viajes_suscriber": "62"
  },
  {
    "edad_del_usuario": 79,
    "viajes_customer": "9",
    "viajes_suscriber": "194"
  },
  {
    "edad_del_usuario": 78,
    "viajes_customer": "4",
    "viajes_suscriber": "110"
  },
  {
    "edad_del_usuario": 77,
    "viajes_customer": "4",
    "viajes_suscriber": "197"
  },
  {
    "edad_del_usuario": 76,
    "viajes_customer": "14",
    "viajes_suscriber": "85"
  },
  {
    "edad_del_usuario": 75,
    "viajes_customer": "17",
    "viajes_suscriber": "315"
  },
  {
    "edad_del_usuario": 74,
    "viajes_customer": "6",
    "viajes_suscriber": "629"
  },
  {
    "edad_del_usuario": 73,
    "viajes_customer": "14",
    "viajes_suscriber": "1642"
  },
  {
    "edad_del_usuario": 72,
    "viajes_customer": "48",
    "viajes_suscriber": "492"
  },
  {
    "edad_del_usuario": 71,
    "viajes_customer": "33",
    "viajes_suscriber": "1861"
  },
  {
    "edad_del_usuario": 70,
    "viajes_customer": "76",
    "viajes_suscriber": "1832"
  },
  {
    "edad_del_usuario": 69,
    "viajes_customer": "98",
    "viajes_suscriber": "2924"
  },
  {
    "edad_del_usuario": 68,
    "viajes_customer": "143",
    "viajes_suscriber": "4978"
  },
  {
    "edad_del_usuario": 67,
    "viajes_customer": "172",
    "viajes_suscriber": "6234"
  },
  {
    "edad_del_usuario": 66,
    "viajes_customer": "210",
    "viajes_suscriber": "5985"
  },
  {
    "edad_del_usuario": 65,
    "viajes_customer": "212",
    "viajes_suscriber": "7334"
  },
  {
    "edad_del_usuario": 64,
    "viajes_customer": "317",
    "viajes_suscriber": "10192"
  },
  {
    "edad_del_usuario": 63,
    "viajes_customer": "422",
    "viajes_suscriber": "11739"
  },
  {
    "edad_del_usuario": 62,
    "viajes_customer": "469",
    "viajes_suscriber": "11706"
  },
  {
    "edad_del_usuario": 61,
    "viajes_customer": "587",
    "viajes_suscriber": "12409"
  },
  {
    "edad_del_usuario": 60,
    "viajes_customer": "687",
    "viajes_suscriber": "14705"
  },
  {
    "edad_del_usuario": 59,
    "viajes_customer": "968",
    "viajes_suscriber": "20579"
  },
  {
    "edad_del_usuario": 58,
    "viajes_customer": "1064",
    "viajes_suscriber": "21009"
  },
  {
    "edad_del_usuario": 57,
    "viajes_customer": "1320",
    "viajes_suscriber": "24664"
  },
  {
    "edad_del_usuario": 56,
    "viajes_customer": "1291",
    "viajes_suscriber": "22060"
  },
  {
    "edad_del_usuario": 55,
    "viajes_customer": "1659",
    "viajes_suscriber": "25059"
  },
  {
    "edad_del_usuario": 54,
    "viajes_customer": "1417",
    "viajes_suscriber": "24184"
  },
  {
    "edad_del_usuario": 53,
    "viajes_customer": "1705",
    "viajes_suscriber": "27379"
  },
  {
    "edad_del_usuario": 52,
    "viajes_customer": "1693",
    "viajes_suscriber": "24543"
  },
  {
    "edad_del_usuario": 51,
    "viajes_customer": "2121",
    "viajes_suscriber": "23799"
  },
  {
    "edad_del_usuario": 50,
    "viajes_customer": "2068",
    "viajes_suscriber": "30701"
  },
  {
    "edad_del_usuario": 49,
    "viajes_customer": "2316",
    "viajes_suscriber": "31381"
  },
  {
    "edad_del_usuario": 48,
    "viajes_customer": "2300",
    "viajes_suscriber": "25025"
  },
  {
    "edad_del_usuario": 47,
    "viajes_customer": "2039",
    "viajes_suscriber": "28978"
  },
  {
    "edad_del_usuario": 46,
    "viajes_customer": "2286",
    "viajes_suscriber": "24918"
  },
  {
    "edad_del_usuario": 45,
    "viajes_customer": "2174",
    "viajes_suscriber": "33462"
  },
  {
    "edad_del_usuario": 44,
    "viajes_customer": "2743",
    "viajes_suscriber": "29354"
  },
  {
    "edad_del_usuario": 43,
    "viajes_customer": "2411",
    "viajes_suscriber": "36154"
  },
  {
    "edad_del_usuario": 42,
    "viajes_customer": "2845",
    "viajes_suscriber": "44762"
  },
  {
    "edad_del_usuario": 41,
    "viajes_customer": "2581",
    "viajes_suscriber": "36372"
  },
  {
    "edad_del_usuario": 40,
    "viajes_customer": "3239",
    "viajes_suscriber": "44410"
  },
  {
    "edad_del_usuario": 39,
    "viajes_customer": "3762",
    "viajes_suscriber": "54894"
  },
  {
    "edad_del_usuario": 38,
    "viajes_customer": "3931",
    "viajes_suscriber": "58541"
  },
  {
    "edad_del_usuario": 37,
    "viajes_customer": "4200",
    "viajes_suscriber": "68820"
  },
  {
    "edad_del_usuario": 36,
    "viajes_customer": "6385",
    "viajes_suscriber": "69021"
  },
  {
    "edad_del_usuario": 35,
    "viajes_customer": "5565",
    "viajes_suscriber": "85172"
  },
  {
    "edad_del_usuario": 34,
    "viajes_customer": "6287",
    "viajes_suscriber": "91281"
  },
  {
    "edad_del_usuario": 33,
    "viajes_customer": "8055",
    "viajes_suscriber": "92034"
  },
  {
    "edad_del_usuario": 32,
    "viajes_customer": "8883",
    "viajes_suscriber": "113321"
  },
  {
    "edad_del_usuario": 31,
    "viajes_customer": "11100",
    "viajes_suscriber": "113931"
  },
  {
    "edad_del_usuario": 30,
    "viajes_customer": "16058",
    "viajes_suscriber": "144322"
  },
  {
    "edad_del_usuario": 29,
    "viajes_customer": "14740",
    "viajes_suscriber": "138624"
  },
  {
    "edad_del_usuario": 28,
    "viajes_customer": "14561",
    "viajes_suscriber": "134624"
  },
  {
    "edad_del_usuario": 27,
    "viajes_customer": "16413",
    "viajes_suscriber": "151563"
  },
  {
    "edad_del_usuario": 26,
    "viajes_customer": "18194",
    "viajes_suscriber": "135084"
  },
  {
    "edad_del_usuario": 25,
    "viajes_customer": "18911",
    "viajes_suscriber": "114835"
  },
  {
    "edad_del_usuario": 24,
    "viajes_customer": "19306",
    "viajes_suscriber": "92882"
  },
  {
    "edad_del_usuario": 23,
    "viajes_customer": "15664",
    "viajes_suscriber": "58356"
  },
  {
    "edad_del_usuario": 22,
    "viajes_customer": "11262",
    "viajes_suscriber": "24537"
  },
  {
    "edad_del_usuario": 21,
    "viajes_customer": "7890",
    "viajes_suscriber": "16536"
  },
  {
    "edad_del_usuario": 20,
    "viajes_customer": "6774",
    "viajes_suscriber": "11870"
  },
  {
    "edad_del_usuario": 19,
    "viajes_customer": "6110",
    "viajes_suscriber": "9124"
  },
  {
    "edad_del_usuario": 18,
    "viajes_customer": "2492",
    "viajes_suscriber": "4663"
  },
  {
    "edad_del_usuario": 17,
    "viajes_customer": "961",
    "viajes_suscriber": "817"
  },
  {
    "edad_del_usuario": 16,
    "viajes_customer": "267",
    "viajes_suscriber": "402"
  },
  {
    "edad_del_usuario": 5,
    "viajes_customer": "0",
    "viajes_suscriber": "5"
  }
]
*/