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
from patients_data
GROUP BY age_groups
ORDER BY COUNT(*) DESC

Findings:
# Encounters 
--> 3957 Middle-Aged Adults, 2698 Pre-Young Adults, 1724 Old Adults, 1694 Adults and 1290 Young Adults

# Immunizations
--> 3923 Middle-Aged Adults, 3750 Pre-Young Adults, 1847 Adults, 1071 Adults and 772 Old Adults

# Conditions
--> 4310 Pre-Young Adults, 2279 Adults, 2238 Middle-Aged Adults, 2127 Young Adults and 409 Old Adults
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
--> Hospital encounters with a problem were associated with follow-up appointments the most with 118611 encounters.
--> Prenatal Care followed with 62843 encounters, Overall assessment of patient (50923), Check-up (31788) and Urgent Care (22334)
--> Psychiatric Assessment with Mental Health Assessment was the least associated description for follow-up appointments (2 encounters)










