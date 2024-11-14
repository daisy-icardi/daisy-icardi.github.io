-- 1. Removed irrelevant data for analysis by creating a new table for each dataset

CREATE TABLE encounters_data AS
SELECT id, start, stop, patient, encounterclass, description, base_encounter_cost, total_claim_cost, payer_coverage
FROM public.encounters 
--> Organization, provider, payer, code and reasoncode columns were removed as they did not elucidate any information viable for analysis.

CREATE TABLE patients_data AS
SELECT id, birthdate, deathdate, prefix, first, last, race, ethnicity, gender, city, state, county, zip, healthcare_expenses, healthcare_coverage, income
FROM public.patients
--> Lat, lon, mrn, fips, ssn, suffix, drivers, passport, address, birthplace, columns were removed as they did not elucidate any information viable for analysis.

CREATE TABLE immunizations_data AS
SELECT date, patient, description
FROM public.immunizations
--> Encounter and code columns were removed as they did not elucidate any information viable for analysis.

CREATE TABLE conditions_data AS
SELECT start, stop, patient, description
FROM public.conditions
--> Encounter and code columns were removed as they did not elucidate any information viable for analysis.

-- 2. Checked the internal structure (i.e., data types) of new data frames

# Encounters
SELECT * 
FROM encounters_data
--> All data types were correct and did not require converting.
--> Timestamp data type columns ('Start' and 'Stop') will be designated as 'date' and 'time' data types for further analysis of date/time.

# Patients
SELECT * 
FROM patients_data
--> No data types required cleansing.

# Immunizations
SELECT * 
FROM immunizations_data
--> The Timestamp data type column ('date') requires converting to 'date' and 'time' data types for further analysis of date/time.

# Conditions
SELECT * 
FROM conditions_data
--> No data types required cleansing. 

-- 3. Added columns (including calculated columns) to each data frame for analyzing questions of interest

-------------------------------------------------- 3.1. Patients DataFrame ----------------------------------------------------------------
-- 3.1.1. 
  
-------------------------------------------------- 3.2. Encounters DataFrame --------------------------------------------------------------
-- 3.2.1. Added four columns separating start/stop date and start/stop time 
ALTER TABLE encounters_data
ADD start_date DATE,
ADD start_time TIME,
ADD stop_date DATE,
ADD stop_time TIME

UPDATE encounters_data
SET start_date = CAST(start AS DATE)
UPDATE encounters_data
SET start_time = CAST(start AS TIME)
UPDATE encounters_data
SET stop_date = CAST(stop AS DATE)
UPDATE encounters_data
SET stop_time = CAST(stop AS TIME)

-- 3.2.2. Added a column calculating the encounter length in time 
ALTER TABLE encounters_data
ADD encounter_length time without time zone
UPDATE encounters_data
SET encounter_length = stop_time - start_time

-- 3.2.3. Added a column calculating the cost of encounter illness, after accounting for base encounter cost
ALTER TABLE encounters_data
ADD cost_of_encounter_problem DOUBLE PRECISION
UPDATE encounters_data
SET cost_of_encounter_problem = total_claim_cost - base_encounter_cost
  
-- 3.2.4. Added a column calculating the amount patients would be responsible for paying, after accounting for payer coverage of encounter
ALTER TABLE encounters_data
ADD patient_pay_responsibility DOUBLE PRECISION
UPDATE encounters_data
SET patient_pay_responsibility = total_claim_cost - payer_coverage

-------------------------------------------------- 3.3. Immunizations DataFrame ----------------------------------------------------------
-- 3.3.1. Added two columns separating date and time
ALTER TABLE immunizations_data
RENAME date to date_time
--> The date column was initially renamed date_time to prevent addition errors with existing column names.

ALTER TABLE immunizations_data
ADD date DATE,
ADD time TIME
UPDATE immunizations_data
SET time = CAST(date_time AS TIME)
UPDATE immunizations_data
SET date = CAST(date_time AS DATE)

-------------------------------------------------- 3.4. Conditions DataFrame -------------------------------------------------------------

-- 3.4.1. Added a column calculating the length of the treatment condition
ALTER TABLE conditions_data
ADD condition_length_days INT
UPDATE conditions_data
SET condition_length_days = stop_date - start_date

-- 4. Created 

-- 5. Added newly created columns to existing data frames

-- 6. Checked for duplicates within datasets

# Encounters
SELECT id, COUNT(*)
FROM encounters_data
GROUP BY id
HAVING COUNT(*) > 1

# Patients
SELECT id, COUNT(*)
FROM patients_data
GROUP BY id
HAVING COUNT(*) > 1

# Immunizations
SELECT patient, COUNT(*)
FROM immunizations_data
GROUP BY patient
HAVING COUNT(*) > 1

# Conditions
SELECT patient, COUNT(*)
FROM conditions_data
GROUP BY patient
HAVING COUNT(*) > 1

--> No duplicates were present in the 'patient' or 'encounters' data frames.
--> Both the 'immunizations' and 'conditions' data frames had a range of patients who had encountered the hospital many times. 
--> However, no duplicates were removed, as each 'patient' had encountered the hospital for diverse immunizations and conditions on different dates/times. 
--> This was cross-checked with the DISTINCT function:

SELECT DISTINCT *
FROM conditions_data

SELECT DISTINCT *
FROM immunizations_data

-- 5. Checked null or blank values within data frames

# Encounters example:
SELECT COUNT(*)
FROM encounters_data
WHERE description IS NULL
--> 1,221 values were recognized null within the encounters data frame across column 'description'. 
--> All other columns had 0 null values. 

# Patients example: 
SELECT COUNT(*)
FROM patients_data
WHERE deathdate IS NULL
--> Only the death date and prefix column had null values (9999 and 2165 respectively). 
--> All other columns had 0 null values.

# Immunizations example: 
SELECT COUNT(*)
FROM immunizations_data
WHERE patient IS NULL
--> No null values are present in all columns. 

# Conditions example: 
SELECT COUNT(*)
FROM conditions_data
WHERE stop IS NULL
--> 60,563 null values were only present in the stop column. 
--> No other null values were present in other columns. 

-- 5. Dealt with null values present in the three datasets (Encounters, Patients, Conditions)

# Encounters
UPDATE encounters_data
SET description = 'Not Described'
WHERE description IS NULL
--> It was important to highlight no description so that efforts can be made to fill this type of information in by health providers. 

# Patients
ALTER TABLE patients_data
DROP COLUMN prefix
--> Null values for the deathdate were not considered problematic as it is unclear if there is a deathdate and therefore did not requiring dealing with. 
--> Only the prefix column was dropped. 

# Conditions 
--> Null values for conditions data was not dealt with as it is unclear when treatment ended and if it ended at all. 

-- 6. Renamed columns within the conditions table to better illustrate data within columns

# Conditions
ALTER TABLE conditions_data
RENAME start to start_date

ALTER TABLE conditions_data
RENAME stop to stop_date
