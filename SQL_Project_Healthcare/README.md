## _How Can Healthcare Data Reveal Key Trends to Optimize Patient Care and System Efficiency?_

![Emergency Room](https://github.com/user-attachments/assets/c1fda9f5-4b26-4ff7-a9d6-d19f9c5975d7)

### 1. Project Overview
This project analyzed a century’s worth of healthcare data to explore trends across patients' registered as well as patient conditions, encounters, and immunizations. By leveraging temporal and categorical analyses, the study aimed to understand healthcare utilization patterns and behaviors across diverse demographic and clinical factors. The analysis focused on encounter classes, hospital stay durations, outpatient visits, and immunization timing, with an emphasis on uncovering how these factors varied over time and across different population groups.

The project also sought to provide insights into how healthcare delivery could be optimized by identifying key patterns in patient interactions, condition prevalence, and immunization trends, offering a foundation for data-driven decision-making in healthcare systems.

### 1.1. Data Understanding: All about the Data Source
The dataset used in this analysis originates from Synthea, an open-source synthetic healthcare data generator, which provides extensive records of healthcare encounters, conditions, and patient demographics. However, the version of the dataset analyzed here was sourced from "Data Wizardry," where the SNOMED codes have been removed to ensure compliance with potential legal and ethical considerations regarding the representation of specific procedural codes. The dataset includes millions of unique patient records and spans over a century of data. Notable features include patient demographics, encounter details, conditions reported, and immunization history. The link to the datasets used can be found [here](https://datawizardry.academy/sql-basics-healthcare/) if one provides their email. 

### 2. Key Insights 
#### 2.1. Patients Registered Data Insights
Analysis of the patient data reveals that the average age of registered patients is 39.2 years, with middle-aged adults (aged 40–65) comprising the largest demographic. Hospital encounters are most frequent among middle-aged and older adults (over 65), while pre-young adults (<18 years) and adults (aged 27–39) account for a significant proportion of reported conditions. Immunizations are most commonly sought by middle-aged adults and pre-young adults. 

The dataset further indicates that 100% of registered patients are female, 82.2% identify as White, and 89.32% are non-Hispanic. Of the 11,363 patients registered, 12% are deceased.

Regardless of registration status, most patients—based on the combined totals across datasets—are from Boston and Middlesex County in Massachusetts. 

#### 2.2. Encounter Data Insights
An analysis of patient encounters revealed that 2021 recorded the highest number of encounters, while 2023 reported the lowest. The majority of these encounters were from patients residing in Middlesex County, followed by Worcester County. Middle-aged adults (aged 40–65) accounted for a significant proportion of these encounters, representing 56.6% of the total.

The majority of patient encounters were ambulatory or outpatient in nature. The most frequently documented type of encounter was "hospital encounter with problem," followed by "overall assessment of patients". 

In terms of encounter duration, November recorded the longest average and maximum encounter lengths. Conversely, March had the shortest average encounter length, while January recorded the shortest maximum encounter duration.

#### 2.3. Conditions Data Insights
The year 2020 recorded the highest number of reported conditions (10,448), likely driven by the COVID-19 pandemic, while 1914 and 1915 recorded the lowest, with only two conditions each. Chronic sinusitis was associated with the longest cumulative hospital stays (up to 26,841 days), whereas conditions such as bacteremia had no recorded hospital stays, suggesting they were managed primarily in outpatient settings.

Psychological stress was the most prevalent condition across all age groups, followed closely by pregnancy-related conditions. Middle-aged adults were disproportionately affected by psychological stress, while pregnancy-related conditions were consistently observed across all demographic groups.

Encounters with problems were most frequently linked to nonspecific radiological findings and anemia. Pregnancy-related conditions and acute bronchitis, however, were more commonly observed in ambulatory visits. Additionally, overall assessment encounters were most commonly associated with psychological or physical stress. These findings underscore significant trends in healthcare utilization based on condition type and encounter class.

#### 2.4. Immunization Data Insights
Immunization trends revealed distinct patterns that differed from hospital encounters. Patients from Norfolk County accounted for the highest number of immunizations, with middle-aged adults and pre-young adults comprising a significant portion of these patients, irrespective of registration status. Among the administered immunizations, the Seasonal Flu Vaccine was the most common, followed closely by COVID-19 vaccines.

The volume of immunizations peaked in 2021, likely driven by the demand for COVID-19 vaccines, while 1946 recorded the lowest number of immunizations. Seasonal trends were particularly evident in flu vaccinations, which peaked during the spring months of March and April. This delayed pattern in Massachusetts aligns with the state’s winter flu season, spanning January to March. 

Further analysis of hourly trends reveals that immunization patterns varied significantly by the day of the week. Saturdays exhibited the widest range of immunization activity, with longer working hours likely accommodating more patients, while Tuesday and Wednesday showed higher consistency with concentrated immunization activity during regular hours. This highlights how scheduling flexibility may influence immunization rates across different days.

### 3. Conclusion
The analysis highlights critical patterns in patient demographics, healthcare utilization, and immunization trends, offering valuable insights for optimizing healthcare delivery and resource allocation. Middle-aged adults consistently emerged as the most engaged demographic across encounters, conditions, and immunizations, underscoring their central role in healthcare utilization. Pre-young adults also represented a significant segment, particularly in conditions and immunizations, emphasizing the importance of targeted healthcare initiatives for younger populations.

The stark rise in conditions and immunizations during 2020 and 2021 reflects the profound impact of the COVID-19 pandemic on healthcare systems, with the demand for vaccines driving immunization peaks. Seasonal trends in flu vaccinations and extended immunization hours on weekends further demonstrate the potential for leveraging scheduling flexibility to meet patient needs effectively.

Geographically, Middlesex and Norfolk Counties dominated in healthcare engagement, with the former leading in hospital encounters and the latter in immunizations. This regional variation underscores the need for tailored approaches to healthcare delivery based on community-specific needs. The high prevalence of psychological stress and pregnancy-related conditions across all age groups further calls for enhanced mental health resources and comprehensive care for women.

In conclusion, these findings underscore the dynamic nature of healthcare demand and the critical importance of aligning services to demographic, temporal, and geographic trends. By addressing these insights, healthcare providers can enhance efficiency, improve patient outcomes, and better allocate resources to meet the evolving needs of diverse patient populations.

### 4. Interactive Dashboard Links
For an interactive experience with the data, findings, and conclusions, please access the following [link](https://public.tableau.com/app/profile/daisy.icardi/viz/HealthcareInsightsSyntheaData/PatientsDashboard#1). 

For a visual preview, see the photo below.

<img width="1207" alt="Screenshot 2025-01-08 at 13 02 17" src="https://github.com/user-attachments/assets/be1306ca-f151-4e05-8bdf-5ca97fa4b021" />
