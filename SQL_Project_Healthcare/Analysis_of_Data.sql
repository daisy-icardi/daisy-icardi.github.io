-------------------------------------------------- 1. Patients DataFrame --------------------------------------------------------------------------
1.1. Patient Demographics
----------------------------------------------------------------------------------------------------------------------------------------------------
1.1.1. How many patients have registered with the healthcare system based in Massachusetts? 
----------------------------------------------------------------------------------------------------------------------------------------------------
SELECT COUNT(*) AS total_patients
FROM patients_data

Findings:
--> 11,363 patients
-----------------------------------------------------------------------------------------------------------------------------------------------------
1.1.2. What is the average, minimum, and maximum age of patients when they encountered the hospital and presented for immunizations and conditions?
-----------------------------------------------------------------------------------------------------------------------------------------------------
SELECT AVG(encounter_age) AS avg_encounters,
AVG(immunization_age) AS avg_immunizations, 
AVG(conditions_age) AS avg_conditions,
MIN(encounter_age) AS min_encounters,
MIN(immunization_age) AS min_immunizations,
MIN(conditions_age) AS min_conditions,
MAX(encounter_age) AS max_encounters,
MAX(immunization_age) AS max_immunizations,
MAX(conditions_age) AS max_conditions
FROM patients_data

Findings:
# Encounters:
--> Average = 39.54, Minimum = 30, Maximum = 109

# Immunizations:
--> Average = 32.20, Minimum = 0, Maximum = 100

# Conditions:
--> Average = 25.53, Minimum = 0, Maximum = 99
-----------------------------------------------------------------------------------------------------------------------------------------
-- 1.1.2. What number of patients are classified as pre-young adults, young adults, adults, middle-aged adults, or old adults? 
          Specifically, when they encountered the hospital, presented for immunizations and conditions?
-------------------------------------------------------------------------------------------------------------------------------------------
# EXAMPLE CODE (Similar code applied to immunization_age and conditions_age to ascertain findings)
SELECT CASE WHEN encounter_age between 0 AND 18 THEN 'Pre-Young Adults'
WHEN encounter_age between 19 and 26 THEN 'Young Adults'
WHEN encounter_age between 27 AND 39 THEN 'Adults'
WHEN encounter_age between 40 AND 65 THEN 'Middle-Aged Adults'
ELSE 'Old Adults' END age_groups, COUNT(*)
from encounters_data
GROUP BY age_groups
ORDER BY COUNT(*) DESC

Findings:
# Encounters 
--> 258167 Middle-Aged Adults, 158737 Old Adults and 39031 Adults

# Immunizations
--> 67217 Middle-Aged Adults, 46350 Pre-Young Adults, 21370 Adults, 20355 Old Adults and 10201 Young Adults

# Conditions
--> 61965 Middle-Aged Adults, 35723 Adults, 23045 Young Adults, 22133 Pre-Young Adults, and 21119 Old Adults 
-------------------------------------------------------------------------------------------------------------------------------------------
-- 1.1.3 What is the gender of patients?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT gender, COUNT(*) AS NUM
FROM patients_data
GROUP BY gender

Findings:
--> 11,363 females present in the sample
--> No males present in the sample
-------------------------------------------------------------------------------------------------------------------------------------------
-- 1.1.4. What is the distribution of race across the dataset?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT race, COUNT(*) AS NUM
FROM patients_data
GROUP BY race

Findings:
--> 9343 White Individuals 
--> 988 Black Individuals
--> 727 Asian Individuals 
--> 141 Hawaiian Individuals
--> 107 Patients classified themselves as 'Other'
--> 57 Considered themselves Native
-------------------------------------------------------------------------------------------------------------------------------------------
-- 1.1.5. What is the proportion of patients from each ethnic group in the dataset?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT race, COUNT(*) AS NUM
FROM patients_data
GROUP BY race
--> 10,149 Nonhispanic individuals
--> 1214 Hispanic Individuals

-------------------------------------------------------------------------------------------------------------------------------------------
-- 1.1.6. What is the distribution of individuals across states, cities, counties, and zip codes in the dataset?
-------------------------------------------------------------------------------------------------------------------------------------------
# States
SELECT state, COUNT(*) AS NUM
FROM patients_data
GROUP BY state
--> Individuals are predominantly from the state of Massachusettes

# Cities
SELECT city, COUNT(*)
FROM patients_data
GROUP BY city
ORDER BY COUNT DESC
--> Top 3: Boston (1016), Worcester (295), Springfield (244)

# Counties
SELECT county, COUNT(*)
FROM patients_data
GROUP BY county
ORDER BY COUNT DESC
--> 14 diverse counties
--> Top 3: Middlesex County (2571), Worcester County (1332), Essex County (1290)

# ZIP codes
SELECT zip, COUNT(*) 
FROM patients_data
GROUP BY zip
ORDER BY COUNT DESC
--> 327 diverse ZIP codes
--> Top 3 ZIP codes: 2151 (136), 2472 (135) and 2360 (116)

-------------------------------------------------------------------------------------------------------------------------------------------
-- 1.1.7. What is the distribution (average, minimum, and maximum) of income, healthcare coverage, and healthcare expenses for patients?
-------------------------------------------------------------------------------------------------------------------------------------------
# Income
SELECT AVG(income), MIN(income), MAX(income)
FROM patients_data
--> Average = 119,085.47
--> Minimum = 23
--> Maximum = 998,537

# Healthcare Expenses
SELECT AVG(healthcare_expenses), MIN(healthcare_expenses), MAX(healthcare_expenses)
FROM patients_data
--> Average = 272,690.21 
--> Minimum = 100 
--> Maximum = 6,569,036.62

# Healthcare Coverage
SELECT AVG(healthcare_coverage), MIN(healthcare_coverage), MAX(healthcare_coverage)
FROM patients_data
--> Average = 552,194.41
--> Minimum = 0 
--> Maximum = 7,456,354.98

-------------------------------------------------------------------------------------------------------------------------------------------
-- 1.1.8. What is the distribution (average, minimum, and maximum) of the net patient cost after accounting for coverage?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT AVG(net_patient_cost), MIN(net_patient_cost), MAX(net_patient_cost)
FROM patients_data
--> Average = -279504.20
--> Minimum = -7424522.69
--> Maximum = 5881634.07
-------------------------------------------------------------------------------------------------------------------------------------------
-- 1.1.9. How many individuals fall into each financial burden category based on income and healthcare costs?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
financial_burden_class,
COUNT(*) AS num_individuals
FROM (
    SELECT 
        CASE
            WHEN income < 1000 THEN 'Very Low Income'
            WHEN net_patient_cost < 0 THEN 'Overcoverage'
            WHEN (net_patient_cost / income) * 100 < 10 THEN 'Low Burden'
            WHEN (net_patient_cost / income) * 100 BETWEEN 10 AND 50 THEN 'Moderate Burden'
            WHEN (net_patient_cost / income) * 100 > 50 THEN 'High Burden'
            ELSE 'Unclassified'
        END AS financial_burden_class
    FROM patients_data
) AS classified_patients
GROUP BY financial_burden_class
ORDER BY COUNT(*) DESC

Findings:
--> 6989 individuals are overcovered.
--> 2619 have a high financial burden.
--> 980 have a moderate financial burden.
--> 720 have a low financial burden. 
--> 55 individuals are classed as having a very low income.

-------------------------------------------------------------------------------------------------------------------------------------------
-- 1.2.0. How many patients have been registered as dead in the hospital?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT COUNT(*)
FROM patients_data
WHERE death date IS NOT NULL
--> 1364 individuals.
-------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------- 2. Encounters DataFrame --------------------------------------------------------------
-- 2.1. Temporal Analysis of Encounters
-------------------------------------------------------------------------------------------------------------------------------------------
-- 2.1.1. What are the earliest and latest dates recorded in the dataset for encounters?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    MIN(start_date) AS earliest_date,
    MAX(stop_date) AS latest_date
FROM encounters_data
Findings: 
--> Earliest: 2015-01-01, Latest: 2023-06-19
-------------------------------------------------------------------------------------------------------------------------------------------
-- 2.1.2. What year had the most encounters versus the least encounters?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    EXTRACT(YEAR FROM start_date) AS encounter_year,
    COUNT(*) AS total_encounters
FROM 
    encounters_data
GROUP BY 
    EXTRACT(YEAR FROM start_date)
ORDER BY 
    total_encounters DESC
Findings: 
--> Year 2021 with 67612 encounters had the most encounters. Year 2023 had the least amount of encounters with 23840 encounters
-------------------------------------------------------------------------------------------------------------------------------------------
-- 2.1.3. Which hour of the day sees the peak volume of patient encounters in the analyzed records?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    EXTRACT(HOUR FROM start_time) AS encounter_hour,
    COUNT(*) AS total_encounters
FROM 
    encounters_data
GROUP BY 
    EXTRACT(HOUR FROM start_time)
ORDER BY 
    total_encounters DESC
Findings: 
--> 10 pm (21286) sees the most patient encounters, followed by 7 am (20254) and 8 pm (20157). 
--> 2 am sees the least patient encounters (16945 encounters).
-------------------------------------------------------------------------------------------------------------------------------------------
-- 2.1.4. What is the average, maximum, and minimum length of encounters?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT AVG(encounter_length) AS avg_length,
MIN(encounter_length) AS min_length,
MAX(encounter_length) AS max_length
FROM encounters_data
Findings: 
--> Average = 1h 31 mins 21 seconds, Min = 0, Max = 23 hours, 59 mins, 38 seconds
-------------------------------------------------------------------------------------------------------------------------------------------
-- 2.1.5. What are the net patient cost trends after accounting for coverage over the years?
-------------------------------------------------------------------------------------------------------------------------------------------
WITH yearly_costs AS (
    SELECT 
        EXTRACT(YEAR FROM start_date) AS year,  
        AVG(patient_pay_responsibility) AS avg_out_of_pocket_cost, 
        MIN(patient_pay_responsibility) AS min_out_of_pocket_cost, 
        MAX(patient_pay_responsibility) AS max_out_of_pocket_cost  
    FROM encounters_data
    WHERE start_date BETWEEN '2015-01-01' AND '2023-12-31'  
    GROUP BY EXTRACT(YEAR FROM start_date) 
)
SELECT 
    year,
    avg_out_of_pocket_cost,
    min_out_of_pocket_cost,
    max_out_of_pocket_cost,
    LAG(avg_out_of_pocket_cost) OVER (ORDER BY year) AS previous_year_avg,
    CASE
        WHEN avg_out_of_pocket_cost > LAG(avg_out_of_pocket_cost) OVER (ORDER BY year) THEN 'Increased'
        WHEN avg_out_of_pocket_cost < LAG(avg_out_of_pocket_cost) OVER (ORDER BY year) THEN 'Decreased'
        ELSE 'No Change'
    END AS cost_trend  
FROM yearly_costs
ORDER BY year;
Findings: 
--> 2015 to 2016 = decreased, 2016-2017 = increased, 2017-2018 = decreased, 2018-2019 = increased, 2019-2020 = decreased, 2020-2021 = decreased, 2021-2022 = increased, 2022-2023 = decreased
-------------------------------------------------------------------------------------------------------------------------------------------
-- 2.2. Categorical Data Analysis
-------------------------------------------------------------------------------------------------------------------------------------------
-- 2.2.1. What are the encounter classes and descriptions correspond to the longest and shortest patient encounter lengths?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    encounterclass,
    description,
    MAX(encounter_length) AS max_encounter_length,
    MIN(encounter_length) AS min_encounter_length,
    AVG(encounter_length) AS avg_encounter_length
FROM 
    encounters_data
GROUP BY 
    encounterclass, description
ORDER BY 
    max_encounter_length DESC
Findings: 
--> In the first top 10 longest patient encounters, inpatient encounters seem to be the most common encounterclass.
--> Treatment for substance use disorder and withdrawal was the lengthiest inpatient encounter. 
--> In the top 10 shorted patient encounters, inpatient encounters also seem to be the most common encounterclass. 
--> Follow-up appointments, Hospitalization for Observations, Move to lower-level care units, and Ward Admissions were the descriptions of encounters taking the shortest amount of time.

-------------------------------------------------------------------------------------------------------------------------------------------
-- 2.2.2. Which encounter class is most/least frequent across the dataset?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT encounterclass, COUNT(*) AS encounter_count
FROM encounters_data
GROUP BY encounterclass
ORDER BY encounter_count DESC
Findings: 
--> Ambulatory encounters were the most frequent with 244148 encounters, followed by outpatient encounters (85849) and wellness (77849).
--> Virtual encounters were the least frequent with 709 encounters. 
-------------------------------------------------------------------------------------------------------------------------------------------
-- 2.2.3. What are the most common encounter classes for patients of different age groups?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
CASE WHEN encounter_age between 0 AND 18 THEN 'Pre-Young Adults'
WHEN encounter_age between 19 and 26 THEN 'Young Adults'
WHEN encounter_age between 27 AND 39 THEN 'Adults'
WHEN encounter_age between 40 AND 65 THEN 'Middle-Aged Adults'
ELSE 'Old Adults' 
END AS age_group,encounterclass,
    COUNT(*) AS encounter_count
FROM encounters_data
GROUP BY age_group, encounterclass
ORDER BY age_group, encounter_count DESC
Findings:
--> Adults = Ambulatory (19969), followed by outpatient and wellness. 
--> Middle-aged adults = ambulatory (139756), followed by outpatient and wellness. 
--> Old Adults = ambulatory (84423), followed by outpatient and wellness. 
-------------------------------------------------------------------------------------------------------------------------------------------
-- 2.2.4. Which encounter description is most frequent across the dataset?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT  
    description, 
    COUNT(*) AS encounter_count
FROM encounters_data
GROUP BY description
ORDER BY encounter_count DESC
Findings: 
--> Hospital encounter with a problem was the most common description encounter: 125693
--> Overall assessment of patient followed with 51840 encounters
--> Psychiatric Assessment with Mental Health Assessment was the least common description encounter (1)
--> Surgery was equally the least common description encounter (1)
-------------------------------------------------------------------------------------------------------------------------------------------
-- 2.2.5. Which encounter class and description is associated with the highest and lowest costs?
-------------------------------------------------------------------------------------------------------------------------------------------
# Highest
SELECT 
    encounterclass, 
    description, 
    cost_of_encounter_problem
FROM encounters_data
GROUP BY encounterclass, description, cost_of_encounter_problem
ORDER BY cost_of_encounter_problem DESC
Findings: 
--> Hospital Encounter with Problem was the highest costing encounter description with emergency as encounterclass (1470203.92)

# Lowest
SELECT 
    encounterclass, 
    description, 
    cost_of_encounter_problem
FROM encounters_data
GROUP BY encounterclass, description, cost_of_encounter_problem
ORDER BY cost_of_encounter_problem ASC
Findings: 
--> In the top 35 results costing patients 0, the ambulatory encounter class was the most common (13 encounter results as 0) with no common descriptions.

-------------------------------------------------------------------------------------------------------------------------------------------
-- 2.2.6. Which descriptions are associated with follow-up appointments?
-------------------------------------------------------------------------------------------------------------------------------------------
WITH initial_and_followup_encounters AS (
    SELECT 
        p1.patient AS initial_patient_id,
        p1.description AS initial_description,
        p2.description AS followup_description,
        p1.start_date AS initial_date,
        p2.start_date AS followup_date
    FROM encounters_data p1
    JOIN encounters_data p2 
        ON p1.patient = p2.patient 
        AND p2.start_date > p1.start_date  
    WHERE 
        (
            p2.description = 'Follow-up appointment' 
            OR p2.description = 'Follow-up appointment after childbirth' 
            OR p2.description = 'Follow-up appointment after surgery (observation)' 
            OR p2.description = 'Follow-up Assessment of Allergic Conditions'
        )
        AND (
            p1.description != 'Follow-up appointment' 
            AND p1.description != 'Follow-up appointment after childbirth' 
            AND p1.description != 'Follow-up appointment after surgery (observation)' 
            AND p1.description != 'Follow-up Assessment of Allergic Conditions'
        )
)
SELECT 
    initial_description,
    COUNT(*) AS followup_count
FROM initial_and_followup_encounters
GROUP BY initial_description
ORDER BY followup_count DESC;
Findings: 
--> Hospital encounters with a problem were most associated with follow-up appointments with 118611 encounters.
--> Prenatal Care followed with 62843 encounters, Overall assessment of patient (50923), Check-up (31788) and Urgent Care (22334)
--> Psychiatric Assessment with Mental Health Assessment was the least associated description for follow-up appointments (2 encounters)

-------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------- 3. Conditions DataFrame --------------------------------------------------------------
-- 3.1. Temporal Analysis of Conditions
-------------------------------------------------------------------------------------------------------------------------------------------
-- 3.1.1. What are the earliest and latest dates recorded in the dataset for conditions?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    MIN(start_date) AS earliest_date,
    MAX(stop_date) AS latest_date
FROM conditions_data
Findings: 
--> Earliest: 1914-01-08, Latest: 2023-06-07
-------------------------------------------------------------------------------------------------------------------------------------------
-- 3.1.2. Which year recorded the highest/lowest number of reported conditions?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    EXTRACT(YEAR FROM start_date) AS condition_year,
    COUNT(*) AS total_conditions
FROM 
   conditions_data
GROUP BY 
    EXTRACT(YEAR FROM start_date)
ORDER BY 
    total_conditions DESC
Findings: 
1. Year 2020 was the highest recorded year for conditions (10448)
2. 2014 followed with 9649 reported conditions 
3. 2021 had 9495 conditions 
4. 2016 had 7722 conditions
5. 2017 had 7713 conditions
--> Years 1914 and 1915 had the lowest number of reported conditions (2)
-------------------------------------------------------------------------------------------------------------------------------------------
-- 3.1.3. What is the average, maximum, and minimum length of stay within the hospital for conditions? 
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT AVG(condition_length_days) AS avg_length,
MIN(condition_length_days) AS min_length,
MAX(condition_length_days) AS max_length
FROM conditions_data
Findings: 
--> Average = 522.68 days, Min = 0, Max = 26,841 days
-------------------------------------------------------------------------------------------------------------------------------------------
3.2. Categorical Analysis 
-------------------------------------------------------------------------------------------------------------------------------------------
-- 3.2.1. Which conditions are associated with the shortest and longest stay within the hospital?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    description,
    MAX(condition_length_days) AS max_condition_length,
    MIN(condition_length_days) AS min_condition_length,
    AVG(condition_length_days) AS avg_condition_length
FROM 
    conditions_data
GROUP BY 
    description
ORDER BY 
    max_condition_length DESC
Findings: 
--> Chronic sinusitis (disorder) was the condition that was associated with the longest stay (26,841 days)
--> Chronic kidney disease, Stage I followed by a maximum of 19,110 days spent in the hospital 
--> Bacteremia was the condition associated with no days spent within the hospital (0)
-------------------------------------------------------------------------------------------------------------------------------------------
-- 3.2.2. Which conditions are most associated with the year 2020?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    description, 
    COUNT(*) AS frequency  
FROM 
    conditions_data
WHERE 
    EXTRACT(YEAR FROM start_date) = 2020 
GROUP BY 
    description  
ORDER BY 
    frequency DESC
Findings: 
--> Other psychological or physical stress, not elsewhere classified was the most associated (2630)
--> Pregnant state, incidental followed (803)
--> Esophageal reflux was among the other 15 conditions that were only present once within the year 2020.
-------------------------------------------------------------------------------------------------------------------------------------------
-- 3.2.3. What are the top 10 most frequent medical conditions patients present with, in the dataset across all the years?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    description,  
    COUNT(*) AS frequency  
FROM 
    conditions_data  
GROUP BY 
    description  
ORDER BY 
    frequency DESC 
LIMIT 10   
Findings:
1. Other psychological or physical stress, not elsewhere classified was the most frequent (58962 patients)
2. Pregnant state, incidental (9872)
3. Acute bronchitis (5684)
4. Body Mass Index 30.0-30.9 adult (5461) 
5. Unemployment (4717)
6. Other specified anemias (3704)
7. Anemia, unspecified (3704)
8. Unspecified essential hypertension (3682)
9. Other chronic pain (2727)
10. Tubal ligation status (2537)
-------------------------------------------------------------------------------------------------------------------------------------------
-- 3.2.4. Which conditions are most associated with encounter descriptions of Hospital Encounters with Problems?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    c.description,  
    COUNT(*) AS condition_count 
FROM encounters_data e
JOIN conditions_data c
    ON e.patient = c.patient  
    AND e.start_date = c.start_date 
WHERE e.description = 'Hospital Encounter with Problem'  
GROUP BY c.description 
ORDER BY condition_count DESC
Findings:
--> Nonspecific (abnormal) findings on radiological and other examinations of other intrathoracic organs were the most common condition associated (439)
--> Anemia followed whether unspecified or specified (327 and 327 respectively).
--> Pregnant state (incidental) was the fourth most commonly associated condition associated with hospital encounters with problems (261)
-------------------------------------------------------------------------------------------------------------------------------------------
-- 3.2.5. Which conditions are most associated with ambulatory encounter classes?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    c.description,  
    COUNT(*) AS condition_count 
FROM encounters_data e
JOIN conditions_data c
    ON e.patient = c.patient  
    AND e.start_date = c.start_date 
WHERE e.encounterclass = 'ambulatory'  
GROUP BY c.description
ORDER BY condition_count DESC
Findings: 
1. Pregnant state, incidental was the most associated with ambulatory encounterclasses (5241)
2. Acute bronchitis followed (3069)
3. Streptococcal sore throat (860)
4. Fever, unspecified (609)
5. Anemia, unspecified and specified (575 and 575)
-------------------------------------------------------------------------------------------------------------------------------------------
-- 3.2.6. How does the prevalence of specific conditions change across age groups?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    age_groups, 
    description,  
    COUNT(*) AS num_individuals 
FROM (
    SELECT 
        description,  
        CASE 
            WHEN conditions_age BETWEEN 0 AND 18 THEN 'Pre-Young Adults'
            WHEN conditions_age BETWEEN 19 AND 26 THEN 'Young Adults'
            WHEN conditions_age BETWEEN 27 AND 39 THEN 'Adults'
            WHEN conditions_age BETWEEN 40 AND 65 THEN 'Middle-Aged Adults'
            ELSE 'Old Adults' 
        END AS age_groups  
    FROM 
        conditions_data
) subquery  
GROUP BY 
    age_groups, description  
ORDER BY 
    num_individuals DESC
Findings: 
--> All age groups were most associated with the condition 'other psychological or physical stress, not elsewhere classified'. 
--> The condition was most associated with middle-aged adults, followed by adults and young adults, and least associated with pre-young adults.
--> Pregnant state incidental was the second most associated condition among all age groups. 

-------------------------------------------------- 4. Immunizations DataFrame --------------------------------------------------------------
-- 4.1. Temporal Analysis of Immunizations
--------------------------------------------------------------------------------------------------------------------------------------------
-- 4.1.1. What are the earliest and latest dates recorded in the dataset for immunizations?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    MIN(date) AS earliest_date,
    MAX(date) AS latest_date
FROM immunizations_data
Findings: 
--> Earliest: 1945-03-23, Latest: 2023-06-08
-------------------------------------------------------------------------------------------------------------------------------------------
-- 4.1.2. Which year recorded the highest/lowest number of reported immunizations?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    EXTRACT(YEAR FROM date) AS immunization_year,
    COUNT(*) AS total_immunizations
FROM 
   immunizations_data
GROUP BY 
    EXTRACT(YEAR FROM date)
ORDER BY 
    total_immunizations DESC
Findings: 
--> 2021 had the highest number of reported immunizations (28,009)
--> This was followed by 2020 (14,327), 2014 (14,209), 2015 (14,098) and 2022 (14,074)
--> 1946 had the lowest number of reported immunizations (6)
-------------------------------------------------------------------------------------------------------------------------------------------
-- 4.1.3. Which hour of the day sees the peak volume of patient immunizations in the analyzed records?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    EXTRACT(HOUR FROM time) AS immunization_hour,
    COUNT(*) AS total_immunizations
FROM 
    immunizations_data
GROUP BY 
    EXTRACT(HOUR FROM time)
ORDER BY 
    total_immunizations DESC
Findings: 
--> 8 pm was the time in which peak volume of immunizations occurred (7594)
--> 10 pm (7480), 7 am (7330), 2 pm (7188) and 5 am (7173) followed
--> Noon was the time in which the least immunizations occurred (6280)
-------------------------------------------------------------------------------------------------------------------------------------------
-- 4.1.4. Are there seasonal trends in vaccination (e.g., flu vaccines in fall/winter)?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    TO_CHAR(date, 'Month') AS vaccination_month,  -- Extract the month name
    COUNT(*) AS vaccination_count  -- Count the number of vaccinations in each month
FROM 
    immunizations_data
WHERE 
    description = 'Seasonal Flu Vaccine'  -- Focus on flu vaccines (optional, adjust for specific vaccine)
GROUP BY 
    TO_CHAR(date, 'Month'), 
    EXTRACT(MONTH FROM date)  -- Group by month and its numeric value for sorting
ORDER BY 
    EXTRACT(MONTH FROM date)
Findings: 
--> March and April had the highest influx of vaccinations (9375 and 8100)
--> May (7891) February (7858) and August (7703) followed 
--> November had the lowest influx of seasonal flu vaccinations (7286)
-------------------------------------------------------------------------------------------------------------------------------------------
-- 4.2. Categorical Analysis of Immunizations
--------------------------------------------------------------------------------------------------------------------------------------------
-- 4.2.1. Which immunizations are most associated with the year 2021? 
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    description, 
    COUNT(*) AS frequency  
FROM 
    immunizations_data
WHERE 
    EXTRACT(YEAR FROM date) = 2020 
GROUP BY 
    description  
ORDER BY 
    frequency DESC
Findings: 
--> Seasonal flu vaccine (8498)
--> Five doses of tetanus toxoid, preservative-free and adsorbed, for adults (844) and Diphtheria, Tetanus, and Pertussis Vaccine followed (675)
-------------------------------------------------------------------------------------------------------------------------------------------
-- 4.2.2. What are the top 5 most frequent immunizations in the dataset across all the years?
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    description,  
    COUNT(*) AS frequency  
FROM 
    immunizations_data  
GROUP BY 
    description  
ORDER BY 
    frequency DESC 
LIMIT 5  
Findings:
1. Seasonal Flu Vaccine (93219)
2. Five doses of tetanus toxoid, preservative-free and adsorbed, for adults (8434)
3. Novel Coronavirus (COVID-19) mRNA Vaccine 30 mcg/0.3mL Dose (7563)
4. Diphtheria, Tetanus, and Pertussis Vaccine (6693)
5. Novel Coronavirus (COVID-19) mRNA Vaccine 100 mcg/0.5mL Dose (5993)



