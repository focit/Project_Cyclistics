/*
4. Segmento demográfico
Pregunta: ¿Cuál es la distribución de edad para cada cliente?
- Analizar la cantidad de viajes realizador.
- Restar su año de nacimiento con el año de análisis para conocer su edad.
- Agrupar los usuarios por edad.
*/

SELECT
    2019-birthyear AS edad_del_usuario,
    SUM(CASE WHEN usertype = 'Ocasional' THEN 1 ELSE 0 END) AS viajes_ocasionales,
    SUM(CASE WHEN usertype = 'Miembro' THEN 1 ELSE 0 END) AS viajes_miembros
FROM
    viajes_2019
WHERE
    birthyear IS NOT NULL AND
    birthyear > 1943
GROUP BY
    birthyear
ORDER BY 1 ASc;

/*
Insights:
- Concentración en jóvenes: La mayoría de los viajes son realizados por personas entre 18 y 35 años, tanto para clientes 
ocasionales como para miembros.
-Declinación gradual: A medida que aumenta la edad, el número de viajes tiende a disminuir.
-Diferencias entre tipos de usuarios: Aunque ambos grupos muestran una tendencia similar, los miembros tienden a tener 
un rango de edad ligeramente mayor en comparación con los clientes ocasionales.

[
  {
    "edad_del_usuario": 5,
    "viajes_ocasionales": "0",
    "viajes_miembros": "5"
  },
  {
    "edad_del_usuario": 16,
    "viajes_ocasionales": "267",
    "viajes_miembros": "402"
  },
  {
    "edad_del_usuario": 17,
    "viajes_ocasionales": "961",
    "viajes_miembros": "817"
  },
  {
    "edad_del_usuario": 18,
    "viajes_ocasionales": "2492",
    "viajes_miembros": "4663"
  },
  {
    "edad_del_usuario": 19,
    "viajes_ocasionales": "6110",
    "viajes_miembros": "9124"
  },
  {
    "edad_del_usuario": 20,
    "viajes_ocasionales": "6774",
    "viajes_miembros": "11870"
  },
  {
    "edad_del_usuario": 21,
    "viajes_ocasionales": "7890",
    "viajes_miembros": "16536"
  },
  {
    "edad_del_usuario": 22,
    "viajes_ocasionales": "11262",
    "viajes_miembros": "24537"
  },
  {
    "edad_del_usuario": 23,
    "viajes_ocasionales": "15664",
    "viajes_miembros": "58356"
  },
  {
    "edad_del_usuario": 24,
    "viajes_ocasionales": "19306",
    "viajes_miembros": "92882"
  },
  {
    "edad_del_usuario": 25,
    "viajes_ocasionales": "18911",
    "viajes_miembros": "114835"
  },
  {
    "edad_del_usuario": 26,
    "viajes_ocasionales": "18194",
    "viajes_miembros": "135084"
  },
  {
    "edad_del_usuario": 27,
    "viajes_ocasionales": "16413",
    "viajes_miembros": "151563"
  },
  {
    "edad_del_usuario": 28,
    "viajes_ocasionales": "14561",
    "viajes_miembros": "134624"
  },
  {
    "edad_del_usuario": 29,
    "viajes_ocasionales": "14740",
    "viajes_miembros": "138624"
  },
  {
    "edad_del_usuario": 30,
    "viajes_ocasionales": "16058",
    "viajes_miembros": "144322"
  },
  {
    "edad_del_usuario": 31,
    "viajes_ocasionales": "11100",
    "viajes_miembros": "113931"
  },
  {
    "edad_del_usuario": 32,
    "viajes_ocasionales": "8883",
    "viajes_miembros": "113321"
  },
  {
    "edad_del_usuario": 33,
    "viajes_ocasionales": "8055",
    "viajes_miembros": "92034"
  },
  {
    "edad_del_usuario": 34,
    "viajes_ocasionales": "6287",
    "viajes_miembros": "91281"
  },
  {
    "edad_del_usuario": 35,
    "viajes_ocasionales": "5565",
    "viajes_miembros": "85172"
  },
  {
    "edad_del_usuario": 36,
    "viajes_ocasionales": "6385",
    "viajes_miembros": "69021"
  },
  {
    "edad_del_usuario": 37,
    "viajes_ocasionales": "4200",
    "viajes_miembros": "68820"
  },
  {
    "edad_del_usuario": 38,
    "viajes_ocasionales": "3931",
    "viajes_miembros": "58541"
  },
  {
    "edad_del_usuario": 39,
    "viajes_ocasionales": "3762",
    "viajes_miembros": "54894"
  },
  {
    "edad_del_usuario": 40,
    "viajes_ocasionales": "3239",
    "viajes_miembros": "44410"
  },
  {
    "edad_del_usuario": 41,
    "viajes_ocasionales": "2581",
    "viajes_miembros": "36372"
  },
  {
    "edad_del_usuario": 42,
    "viajes_ocasionales": "2845",
    "viajes_miembros": "44762"
  },
  {
    "edad_del_usuario": 43,
    "viajes_ocasionales": "2411",
    "viajes_miembros": "36154"
  },
  {
    "edad_del_usuario": 44,
    "viajes_ocasionales": "2743",
    "viajes_miembros": "29354"
  },
  {
    "edad_del_usuario": 45,
    "viajes_ocasionales": "2174",
    "viajes_miembros": "33462"
  },
  {
    "edad_del_usuario": 46,
    "viajes_ocasionales": "2286",
    "viajes_miembros": "24918"
  },
  {
    "edad_del_usuario": 47,
    "viajes_ocasionales": "2039",
    "viajes_miembros": "28978"
  },
  {
    "edad_del_usuario": 48,
    "viajes_ocasionales": "2300",
    "viajes_miembros": "25025"
  },
  {
    "edad_del_usuario": 49,
    "viajes_ocasionales": "2316",
    "viajes_miembros": "31381"
  },
  {
    "edad_del_usuario": 50,
    "viajes_ocasionales": "2068",
    "viajes_miembros": "30701"
  },
  {
    "edad_del_usuario": 51,
    "viajes_ocasionales": "2121",
    "viajes_miembros": "23799"
  },
  {
    "edad_del_usuario": 52,
    "viajes_ocasionales": "1693",
    "viajes_miembros": "24543"
  },
  {
    "edad_del_usuario": 53,
    "viajes_ocasionales": "1705",
    "viajes_miembros": "27379"
  },
  {
    "edad_del_usuario": 54,
    "viajes_ocasionales": "1417",
    "viajes_miembros": "24184"
  },
  {
    "edad_del_usuario": 55,
    "viajes_ocasionales": "1659",
    "viajes_miembros": "25059"
  },
  {
    "edad_del_usuario": 56,
    "viajes_ocasionales": "1291",
    "viajes_miembros": "22060"
  },
  {
    "edad_del_usuario": 57,
    "viajes_ocasionales": "1320",
    "viajes_miembros": "24664"
  },
  {
    "edad_del_usuario": 58,
    "viajes_ocasionales": "1064",
    "viajes_miembros": "21009"
  },
  {
    "edad_del_usuario": 59,
    "viajes_ocasionales": "968",
    "viajes_miembros": "20579"
  },
  {
    "edad_del_usuario": 60,
    "viajes_ocasionales": "687",
    "viajes_miembros": "14705"
  },
  {
    "edad_del_usuario": 61,
    "viajes_ocasionales": "587",
    "viajes_miembros": "12409"
  },
  {
    "edad_del_usuario": 62,
    "viajes_ocasionales": "469",
    "viajes_miembros": "11706"
  },
  {
    "edad_del_usuario": 63,
    "viajes_ocasionales": "422",
    "viajes_miembros": "11739"
  },
  {
    "edad_del_usuario": 64,
    "viajes_ocasionales": "317",
    "viajes_miembros": "10192"
  },
  {
    "edad_del_usuario": 65,
    "viajes_ocasionales": "212",
    "viajes_miembros": "7334"
  },
  {
    "edad_del_usuario": 66,
    "viajes_ocasionales": "210",
    "viajes_miembros": "5985"
  },
  {
    "edad_del_usuario": 67,
    "viajes_ocasionales": "172",
    "viajes_miembros": "6234"
  },
  {
    "edad_del_usuario": 68,
    "viajes_ocasionales": "143",
    "viajes_miembros": "4978"
  },
  {
    "edad_del_usuario": 69,
    "viajes_ocasionales": "98",
    "viajes_miembros": "2924"
  },
  {
    "edad_del_usuario": 70,
    "viajes_ocasionales": "76",
    "viajes_miembros": "1832"
  },
  {
    "edad_del_usuario": 71,
    "viajes_ocasionales": "33",
    "viajes_miembros": "1861"
  },
  {
    "edad_del_usuario": 72,
    "viajes_ocasionales": "48",
    "viajes_miembros": "492"
  },
  {
    "edad_del_usuario": 73,
    "viajes_ocasionales": "14",
    "viajes_miembros": "1642"
  },
  {
    "edad_del_usuario": 74,
    "viajes_ocasionales": "6",
    "viajes_miembros": "629"
  },
  {
    "edad_del_usuario": 75,
    "viajes_ocasionales": "17",
    "viajes_miembros": "315"
  }
]
*/