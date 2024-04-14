### Introducción

¡Adéntrate en el mercado laboral de análisis de datos! Centrándose en roles de analista de datos, este proyecto explora los trabajos mejor remunerados, las habilidades más demandadas y dónde se encuentra la alta demanda con los altos salarios en análisis de datos.

¿Consultas SQL? Encuéntralas aquí: [codigo]()sql_project folder

Antecedentes
Interesado en el análisis de datos decidí realizar una búsqueda más efectiva en este mercado laborar, este proyecto nació de un deseo de identificar las habilidades más demandadas y mejor pagadas, optimizando el trabajo de otros para encontrar trabajos óptimos, ya sea como analista de datos o como analista de datos junior. Los datos y las bases el proyecto provienen del Curso de SQL de Luke Barousse SQL Course. Está repleto de información sobre títulos de trabajo, salarios, ubicaciones y habilidades esenciales.

Las preguntas que quería responder a través de mis consultas SQL fueron:
¿Cuáles son los trabajos de analista de datos junior mejor remunerados?
¿Qué habilidades se requieren para estos trabajos mejor remunerados?
¿Qué habilidades son más demandadas para los analistas de datos?
¿Qué habilidades están asociadas con salarios más altos?
¿Cuáles son las habilidades más óptimas para aprender?
Herramientas que utilicé
Para mi inmersión profunda en el mercado laboral de analistas de datos, aproveché el poder de varias herramientas clave:

SQL: La columna vertebral de mi análisis, que me permitió consultar la base de datos y descubrir ideas críticas.
PostgreSQL: El sistema de gestión de bases de datos elegido, ideal para manejar los datos de publicaciones de empleo.
Visual Studio Code: Mi herramienta principal para la gestión de bases de datos y la ejecución de consultas SQL.
Git y GitHub: Esenciales para el control de versiones y compartir mis scripts y análisis SQL, asegurando la colaboración y el seguimiento del proyecto.
El Análisis
Cada consulta para este proyecto tuvo como objetivo investigar aspectos específicos del mercado laboral de analistas de datos. Así es como abordé cada pregunta:

1. Trabajos de Analista de Datos Mejor Remunerados
Para identificar los roles mejor remunerados, filtré las posiciones de analista de datos junior por salario promedio anual y ubicación, centrándome en trabajos remotos. Esta consulta destaca las oportunidades de alto pago en el campo.

SELECT
    job_id,
    company_dim.name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title LIKE '%Junior%Data_Analyst%' AND
    job_location IN ('Anywhere') AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
Aquí tienes el desglose de los principales trabajos de analista de datos en 2023:

Amplio Rango Salarial: Los 10 roles de analista de datos junior mejor pagados van desde $52,500 hasta $80,000 USD anuales, lo que indica un potencial salarial significativo en el campo.
Empleadores Diversos: Empresas como Coders Data, Morion Recruitment y Patterned Learning AI se encuentran entre aquellas que ofrecen salarios altos aun para un analista de datos junior, mostrando un interés amplio en diferentes industrias aún para puestos iniciales.
Top Mejores Trabajos

Gráfico de barras que visualiza el salario de los 10 mejores salarios para analistas de datos junior; el gráfico se generó con Matplotlib a partir de los resultados de mi consulta SQL

2. Habilidades para Trabajos Mejor Remunerados
Para comprender qué habilidades se requieren para los trabajos mejor remunerados, uní las publicaciones de trabajo con los datos de habilidades, proporcionando información sobre lo que los empleadores valoran para roles de alta remuneración.

WITH top_paying_job AS (
    SELECT
        job_id,
        company_dim.name AS company_name,
        job_title,
        salary_year_avg
    FROM 
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title LIKE '%Junior%Data_Analyst%' AND
        job_location IN ('Anywhere','Mexico') AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_job.*,
    skills
FROM
    top_paying_job
INNER JOIN skills_job_dim ON top_paying_job.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY  
    salary_year_avg DESC;
Aquí tienes el desglose de las habilidades más demandadas para los 10 mejores trabajos de analista de datos en 2023:

Excel y SQL lideran con un recuento destacado de 7.
Contínuan los programas de visualización como Tableau y PowerB BI con un recuento destacado de 4 y 2.
Python también es solicitado, con un recuento destacado de 3.
Otras habilidades a considerar son R, Visual Basic, Sharepoint, Sheets, Vba, Word, Julia, Phoenix, Powerpoint y Jira sin embargo, su demanda es corta.
Top Habilidades Pagadas

Gráfico de barras que visualiza el recuento de habilidades para los 10 mejores trabajos pagados para analistas de datos; el gráfico se generó con Matplotlib a partir de los resultados de mi consulta SQL.

3. Habilidades Más Demandadas para Analistas de Datos
Esta consulta ayudó a identificar las habilidades más solicitadas con mayor frecuencia en las publicaciones de trabajo, dirigiendo el enfoque hacia áreas con alta demanda en análisis de datos.

SELECT
    skills,
    count(job_postings_fact.job_id) AS demand_skills
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
job_work_from_home = TRUE
GROUP BY skills
ORDER BY demand_skills DESC
LIMIT 5;
Aquí tienes el desglose de las habilidades más demandadas para analistas de datos en 2023:

SQL y Excel siguen siendo fundamentales, enfatizando la necesidad de un conocimiento sólido en procesamiento de datos y manipulación de hojas de cálculo.
La programación y las herramientas de visualización como Python, Tableau y Power BI son esenciales, lo que apunta hacia la creciente importancia de habilidades técnicas en la narración de datos y el soporte para la toma de decisiones.
HABILIDADES	Conteo de demanda
SQL	7291
EXCEL	4611
PYTHON	4330
TABLEAU	3745
POWER BI	2609
Tabla de la demanda de las 5 habilidades principales en las publicaciones de trabajo para analistas de datos.

4. Habilidades Basadas en el Salario
Explorar los salarios promedio asociados con diferentes habilidades reveló cuáles son las habilidades mejor remuneradas.

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25;
Aquí tienes un desglose de los resultados para las habilidades mejor pagadas para los Analistas de Datos:

Alta Demanda de Habilidades en Big Data y ML: Los salarios más altos son comandados por analistas con habilidades en tecnologías de big data (PySpark, Couchbase), herramientas de aprendizaje automático (DataRobot, Jupyter) y bibliotecas de Python (Pandas, NumPy); lo que refleja la alta valoración de la industria por las capacidades de procesamiento de datos y modelado predictivo.
Proficiencia en Desarrollo y Despliegue de Software: El conocimiento en herramientas de desarrollo y despliegue (GitLab, Kubernetes, Airflow) indica una lucrativa intersección entre el análisis de datos y la ingeniería, con un énfasis en habilidades que facilitan la automatización y una gestión eficiente de las canalizaciones de datos.
Expertise en Computación en la Nube: La familiaridad con herramientas de computación en la nube e ingeniería de datos (Elasticsearch, Databricks, GCP) subraya la creciente importancia de los entornos de análisis basados en la nube, lo que sugiere que la competencia en la nube aumenta significativamente el potencial de ingresos en el análisis de datos.
HABILIDADES	SALARIO PROMEDIO
PYSPARK	208172
BITBUCKET	189155
COUCHBASE	160515
WATSON	160515
DATAROBOT	155486
GITLAB	154500
SWIFT	153750
JUPYTER	152777
PANDAS	151821
ELASTICSEARCH	145000
Tabla del salario promedio para las 10 habilidades mejor remuneradas para analistas de datos

5. Habilidades Más Óptimas para Aprender
Combinando ideas de datos de demanda y salario, esta consulta tuvo como objetivo identificar habilidades que tienen alta demanda y salarios altos, ofreciendo un enfoque estratégico para el desarrollo de habilidades.

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    count(job_postings_fact.job_id) AS demand_skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY skills_dim.skill_id
HAVING count(job_postings_fact.job_id) > 10
ORDER BY avg_salary DESC
SKILL_ID	HABILIDADES	HABILIDADES DEMANDADAS	SALARIO PROMEDIO
8	GO	27	115320
234	CONFLUENCE	11	114210
97	HADOOP	22	113193
80	SNOWFLAKE	37	112948
74	AZURE	34	111225
77	BIGQUERY	13	109654
76	AWS	32	108317
4	JAVA	17	106906
194	SSIS	12	106683
233	JIRA	20	104918
Tabla de las habilidades más óptimas para analistas de datos ordenadas por salario.

Aquí tienes un desglose de las habilidades más óptimas para Analistas de Datos en 2023:

Lenguajes de Programación de Alta Demanda: Python y R destacan por su alta demanda, con recuentos de demanda de 236 y 148 respectivamente. A pesar de su alta demanda, sus salarios promedio rondan los $101,397 para Python y $100,499 para R, lo que indica que la competencia en estos idiomas es muy valorada pero también ampliamente disponible.
Herramientas y Tecnologías en la Nube: Habilidades en tecnologías especializadas como Snowflake, Azure, AWS y BigQuery muestran una demanda significativa con salarios promedio relativamente altos, apuntando hacia la creciente importancia de las plataformas en la nube y las tecnologías de big data en el análisis de datos.
Herramientas de Inteligencia de Negocios y Visualización: Tableau y Looker, con recuentos de demanda de 230 y 49 respectivamente, y salarios promedio alrededor de $99,288 y $103,795, resaltan el papel crítico de la visualización de datos y la inteligencia de negocios en la obtención de ideas accionables a partir de los datos.
Tecnologías de Base de Datos: La demanda de habilidades en bases de datos tradicionales y NoSQL (Oracle, SQL Server, NoSQL) con salarios promedio que van desde $97,786 hasta $104,534, refleja la necesidad duradera de experiencia en almacenamiento, recuperación y gestión de datos.
Lo que apredí
A lo largo de esta investigación potencié mi kit de herramientas de SQL con un poderoso arsenal:

🧩 Creación de Consultas Complejas: Dominé el arte de SQL avanzado, fusionando tablas y utilizando cláusulas WITH para maniobras de tabla temporal a nivel de ninja.
📊 Agregación de Datos: Me familiaricé con GROUP BY y convertí funciones de agregación como COUNT() y AVG() en mis aliados para resumir datos.
💡 Magia Analítica: Mejoré mis habilidades de resolución de problemas del mundo real, convirtiendo preguntas en consultas SQL accionables y perspicaces.
Conclusión
Insights
Del análisis, surgieron varios Insights:

Trabajos de Analista de Datos Mejor Remunerados: ¡Los trabajos mejor pagados para analistas de datos que permiten trabajar de forma remota ofrecen una amplia gama de salarios, ¡el más alto es de $650,000!. Incluso como principiante una persona puede obtener un puesto de trabajo como analista de datos junio y un salario de $80,000 USD al año.
Habilidades para Trabajos Mejor Remunerados: Los trabajos de analista de datos mejor remunerados requieren proficiencia avanzada en SQL, lo que sugiere que es una habilidad crítica para ganar un salario alto.
Habilidades Más Demandadas: SQL también es la habilidad más demandada en el mercado laboral de analistas de datos, por lo que es esencial para los buscadores de empleo.
Habilidades con Salarios Más Altos: Habilidades especializadas, como SVN y Solidity, están asociadas con los salarios promedio más altos, lo que indica un valor adicional en la experiencia especializada.
Habilidades Óptimas para el Valor en el Mercado Laboral: SQL lidera en demanda y ofertas de un alto salario promedio, posicionándolo como una de las habilidades más óptimas para que los analistas de datos aprendan y maximicen su valor en el mercado.
Reflexiones Finales
Este proyecto fue desarrollado para mejorar mis habilidades de SQL y proporcionar ideas valiosas sobre el mercado laboral de analistas de datos. Los hallazgos del análisis sirven como guía para priorizar el desarrollo de habilidades y los esfuerzos de búsqueda de empleo. Los aspirantes a analistas de datos ahora conocen las principales habilidades que deben desarrollar como SQL y Excel y de visualización como Tableau y Power BI para posicionarse mejor en un mercado laboral competitivo. Esta exploración destaca la importancia del aprendizaje continuo y la adaptación a las tendencias emergentes en el campo del análisis de datos para obtener mejores oportunidades laborales y un mejor salario.
