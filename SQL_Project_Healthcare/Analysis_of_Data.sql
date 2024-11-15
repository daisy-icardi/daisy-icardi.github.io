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
--> Average = 39.54, Minimum = 0, Maximum = 109

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
-- 2.1.1. 
