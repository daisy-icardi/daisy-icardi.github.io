## <p style="text-align:center"> How can Bellabeat play it _smart_? </p>
![bellabeat](https://github.com/user-attachments/assets/cad5c22d-40d3-49a2-b860-32968deb1c6c)

## **1. Project Overview**
This project aimed to analyse how individuals use non-Bellabeat smart devices to develop high-level marketing recommendations for Bellabeat. Urška Sršen, the co-founder of Bellabeat believes analyzing non-Bellabeat smart device usage data trends could provide meaningful insights into the potential marketing strategy of their health-focused smart products and thereby growth opportunities. 

### **1.1. Business Understanding: All about Bellabeat**
Bellabeat, co-founded in 2014 by Urška Sršen and Sando Muris is a high-tech manufacturer of health-focused products for women that has the potential to become a leading player in the global device market. Bellabeat offers personalized wellness solutions in-sync with womens' menstrual cycles to allow them to reach their fullest potential. 

The primary stakeholders designed a line of smart wellness products that utilise smart technology to track and collect biometric (e.g., heart-rate) plus lifestyle data (e.g., activity). This includes:
* **Leaf tracker**: Can be worn as a bracelet, necklace or clip. Tracks activity, sleep and stress.
* **Time watch**: Classic timepiece that tracks activity, sleep and stress.
* **Spring bottle**: Water bottle that tracks hydration levels.

For more information regarding their products, click this [link](https://bellabeat.com/shop/). This health information is collected and evaluated against menstrual cycle data, and mindfulness habits within the Bellabeat app designed. Technology-driven solutions are then delivered via the app to women based on the information collected to ensure healthy choices are made. As these devices are specifically engineered to be correlated with women's menstrual cycles, Urška Sršen and Sando Muris are largely considered pioneers in providing a movement towards designing products that offer a holistic, comprehensive and accurate approach to women's health experiences.

### **1.2. How the Project will be Addressed**
While there are many smart health-focused products offered by Bellabeat, the Bellabeat app was chosen for review as it is at the heart of the Bellabeat company, connected to the various smart wellness products. 

The business task will be addressed by answering the following questions:
1. What are some trends in smart device usage? 
2. How could these trends apply to Bellabeat customers? 
3. How could these trends help influence Bellabeat marketing strategy?

### **1.3. Data Understanding: All about the Data Sources**
The Fitbit Fitness Tracker dataset, made public and available through Mobius, was utilised for the current investigation. It encompasses 18 CSV files with data from thirty eligible Fitbit users between the period of 2016-04-12 and 2016-05-12. Users consented to the collection of personal tracker data information including daily, hourly and minute-level data for physical activity, heart-rate as well as sleep and weight monitoring. 

Out of the 18 CSV files, 4 files were deemed to be relevant for the current analysis. Daily (4 files total) and hourly activity files (3 files) were deemed more relevant to investigating how users use devices than minute-level data as minute-level data may be more appropriate when exploring performance of users. However, upon closer investigation into the hourly data files, it was evident that the hourly time was inconsistent across the month and there were only two days out of the month that were investigated hourly. As such, these were not included. Additionally, the Daily Activity CSV file had already merged information from the Daily intensities, calories, steps files, meaning only the one file of daily activity required importing into 'R'. Files with information tracking sleep and weight (2 files total) were also deemed relevant to explore whether individuals use certain features over others when using non-Bellabeat devices. Heartrate files (1 total) was also relevant as heartrate is a reliable indicator of stress, to which could be correlated against other variables to provide valuable insights for Bellabeat (especially as they often provide solutions for an individuals' stress-level).

### **1.4. Credibility of Data**
To check and determine credibility of the data source, the Reliable, Original, Comprehensive, Current and Cited (ROCCC) approach was employed. 
* **Reliability of data:** Reliability limited, with only 30 Fitbit Users included in the dataset. This sampling bias may lead to non-representative or non-meaningful conclusions for the population. Plus, there are some limitations with the datasets to which undermines the reliability of the data (examined further below, see 'Explored Key Tables' summary). 
* **Originallity:** Data was gathered by a third party (Amazon Mechanical Turk). As primary research was not gathered, it is of low originality. 
* **Comprehensive:** Data was reasonably comprehensive. Datasets included daily, hourly and minute-level data, to which is comprehensive for understanding the level of activity individuals were engaged in across days, hours and minutes. However, stress and mindfulness habits were not tracked and the datasets are limited in these respects especially as Bellabeat offers mindfulness and stress tracking. In addition, there was no demographic information collected regarding the participants. Nevertheless, it provides enough data to be within the parameters required for the task at hand. 
* **Current:** Data was sourced in 2016 (7 years ago). While it would be ideal to utlise the most current and dated datasets to elucidate current trends (data sourced within the past three years), the data was still gathered within the range of 10 years and may elucidate some potential trends. 
* **Cited:** The datasets were made available by Mobius on Kaggle and to the author's knowledge, have not been cited. 

Collectively, it is clear the data source would be considered of low quality. Therefore, the following analysis may only be able to highlight some preliminary directions that Bellabeat can take, to which should be verified through an analysis of a larger and much more reliable dataset.

## **2. Project Findings and Recommendations for Bellabeat**

### 1. Drive Feature Adoption

#### Weight Tracking:
Although 88% of users engage with activity tracking, only a small portion use the weight tracking feature, even though it is used more consistently than heart rate tracking. Most users report weight manually (62.5%), with more reports in the evening. To increase adoption, Bellabeat should highlight the advanced insights of the smart scales, such as body fat and muscle mass, and emphasize the convenience of personalized progress reports and goal-setting tools. Campaigns should target health-conscious individuals with messages about holistic weight management.

#### Heart Rate Tracking:
Heart rate tracking had high interest but lower consistent usage. Stress was found to be highest on Saturdays, particularly in the afternoon. Bellabeat can leverage this by promoting its heart rate variability and stress-relief exercises, particularly on weekends. Digital ads, app notifications, and targeted campaigns can encourage engagement during these peak stress periods.

### 2. Boosting Engagement

#### Activity Tracking:
Many users did not meet their step and activity goals, with Thursdays being a particularly low-engagement day. Bellabeat can target low-activity days with personalized content like “Move More Today” and introduce gamification features such as daily challenges, milestone rewards, and social competitions. Social media campaigns can foster accountability, emphasizing community participation and progress.

#### Sleep Tracking:
With 58% of users classified as poor sleepers, most wore the device less than half the night. To increase engagement, Bellabeat should emphasize the benefits of longer wear time and the impact of sleep efficiency. Campaigns could focus on “Better Sleep Starts Here” and highlight the role of the device in improving sleep quality, alongside promoting the lightweight design for more comfortable night-time wear.

### 3. Personalized Engagement

#### Notifications and Reminders:
Users track specific health data on set days (e.g., weight on Mondays, activity on Tuesdays). Customizing notifications based on user behavior will encourage consistent tracking. For instance, sending reminders for weight tracking on Mondays and offering motivational prompts on Tuesdays for activity can drive engagement. Ads should showcase how Bellabeat adapts to individual routines for a personalized experience.

#### Tracking Optimization:
Weight is typically tracked in the evening, and activity in the morning. Optimizing syncing during these times ensures a smooth experience. Bellabeat can promote the app's seamless syncing features to reduce friction and encourage more consistent tracking.

### 4. Usability and Integration

#### Streamlined User Experience:
Users engage with their devices mostly for activity tracking but less so for sleep tracking, particularly during the night. Bellabeat can improve wearability and automate data entry for sleep tracking to encourage more consistent use. Integration with popular apps like Google Fit or Apple Health can be promoted to tech-savvy users, positioning Bellabeat as a central hub for health data.

### 5. Consistency Incentives
   
#### Subscription Model:
With 50% of users classified as overweight, offering premium features like advanced sleep, stress, and activity insights through a subscription plan would provide added value. A free trial can be offered to showcase the benefits, and campaigns should highlight how these insights can aid in weight management and overall wellness.

#### Community Engagement:
Weekly challenges and sharing milestones on social media will help create a sense of community. Referral programs and social media campaigns can amplify word-of-mouth marketing, encouraging users to share their progress and feel part of a larger health-focused community.

### 6. Targeting Key Health Concerns

#### Weight and BMI Solutions:
With 50% of users having an overweight BMI, Bellabeat should focus on weight management tools, personalized tips, and potential nutrition partnerships to help users reach their health goals. Marketing campaigns should emphasize how the app supports users in achieving sustainable weight loss and fitness goals through precise tracking and actionable insights.

### Conclusion
By strategically driving feature adoption, boosting engagement, and offering personalized solutions, Bellabeat can enhance user experience, optimize health outcomes, and strengthen its position as a leader in the wearable health market. Tailored campaigns focused on convenience, community, and personalized health insights will help Bellabeat continue to build a loyal and engaged user base.
