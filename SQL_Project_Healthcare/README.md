### Project Overview
This project analyzed healthcare data across patient conditions, encounters, and immunizations to uncover key trends and insights. The dataset spans a century of healthcare records, allowing for both temporal and categorical analyses. Key insights were derived from investigations into which types of encounter classes were most common and how hospital stays and ambulatory care visits varied over time. Additionally, we examined what the most frequent medical conditions were, particularly which ones were associated with the longest and shortest hospital stays. How did psychological stress-related conditions and pregnancy-related conditions vary across different age groups? We also explored the timing of seasonal flu vaccinations, particularly whether there were any delays in immunization trends related to the flu season, especially in regions like Massachusetts. These questions provided insights into healthcare behaviors and trends across various demographic and clinical factors.

### Data Understanding: All about the Data Source
The dataset used in this analysis originates from Synthea, an open-source synthetic healthcare data generator, which provides extensive records of healthcare encounters, conditions, and patient demographics. However, the version of the dataset analyzed here was sourced from "Data Wizardry," where the SNOMED codes have been removed to ensure compliance with potential legal and ethical considerations regarding the representation of specific procedural codes. The dataset includes millions of unique patient records and spans over a century of data. Notable features include patient demographics, encounter details, conditions reported, and immunization history. The link to the datasets used can be found [here](https://datawizardry.academy/sql-basics-healthcare/) if one provides their email. 

### Key Insights 
#### Patients Registered Data Insights
Analysis of the patient data reveals that the average age of registered patients is 39.2 years, with middle-aged adults (aged 40–65) comprising the largest demographic. Hospital encounters are most frequent among middle-aged and older adults (over 65), while pre-young adults (<18 years) and adults (aged 27–39) account for a significant proportion of reported conditions. Immunizations are most commonly sought by middle-aged adults and pre-young adults. 

The dataset further indicates that 100% of registered patients are female, 82.2% identify as White, and 89.32% are non-Hispanic. Of the 11,363 patients registered, 12% are deceased.

Regardless of registration status, most patients—based on the combined totals across datasets—are from Boston and Middlesex County in Massachusetts. 

#### Encounter Data Insights
An analysis of patient encounters revealed that 2021 recorded the highest number of encounters, while 2023 reported the lowest. The majority of these encounters were from patients residing in Middlesex County, followed by Worcester County. Middle-aged adults (aged 40–65) accounted for a significant proportion of these encounters, representing 56.6% of the total.

The majority of patient encounters were ambulatory or outpatient in nature. The most frequently documented type of encounter was "hospital encounter with problem," followed by "overall assessment of patients". 

In terms of encounter duration, November recorded the longest average and maximum encounter lengths. Conversely, March had the shortest average encounter length, while January recorded the shortest maximum encounter duration.

#### Conditions Data Insights
The year 2020 recorded the highest number of reported conditions (10,448), likely driven by the pandemic, while 1914 and 1915 had the lowest (2). Chronic sinusitis was associated with the longest hospital stays (up to 26,841 days), while conditions like bacteremia showed no recorded hospital stay, indicating outpatient management.

Psychological stress was the most common condition across all age groups, with pregnancy-related conditions following closely. Middle-aged adults were particularly affected by psychological stress, while pregnancy-related conditions were common across all groups.

Encounters with problems were most often associated with nonspecific radiological findings and anemia, while pregnancy-related conditions and acute bronchitis were more common in ambulatory visits. This data highlighted significant patterns in healthcare interactions based on condition type and encounter class.

### Immunization Data Insights
Immunization trends showed a peak in 2021, with COVID-19 vaccines driving the highest volume, while 1946 had the lowest number of immunizations. There was a clear seasonal pattern in flu vaccinations, peaking in March and April, and showing a delayed trend in Massachusetts, likely due to the state's winter flu season (January to March). The Seasonal Flu Vaccine was the most frequently administered, followed by COVID-19 vaccines.

### Key Findings
* **Conditions:** Long stays were observed for conditions like Chronic Sinusitis, while bacteremia had no hospital stay.
* **Psychological stress** was most prevalent across all age groups, with pregnancy-related conditions second most common.
* **Vaccination:** A delayed flu vaccine trend was noted, with peaks in March and April.
* **Encounters:** Anemia and pregnancy-related conditions were commonly linked to hospital encounters and ambulatory visits.

### Conclusion
This analysis provides valuable insights into healthcare trends, particularly the impact of COVID-19, seasonal vaccination patterns, and the healthcare burden of psychological stress. The findings emphasize the need for targeted vaccination strategies and optimized resource planning in response to fluctuating health conditions.
