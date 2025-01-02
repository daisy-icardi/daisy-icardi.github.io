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

### **2. Project Findings

Recommendations and Strategies for Bellabeat**  

#### **6.2.1 Drive feature adoption**  

##### **Weight Tracking**  
Maximize awareness of the consistent engagement potential of Bellabeat’s weight tracking by emphasizing the benefits of its existing smart scales and advanced insights (e.g., body fat and muscle mass).

- **Marketing Strategy:** Highlight the holistic functionality of Bellabeat’s app, showcasing personalized progress reports, BMI insights, and goal-setting tools in campaigns aimed at health-conscious audiences.

##### **Heart Rate Tracking**  
Encourage increased usage of Bellabeat’s guided stress-relief exercises tied to heart rate variability, particularly during high-stress periods (e.g., Saturday evenings).

- **Marketing Strategy:** Emphasize the mental wellness support offered by the Bellabeat app, showcasing its stress management tools through digital ads, email campaigns, and timely app notifications.

#### **6.2.2 Boosting Engagement**  

##### **Activity Tracking**  
Leverage Bellabeat’s user data to identify personalized low-engagement days and address unmet step and activity goals through gamification. Introduce features like daily challenges, milestone rewards, and social competitions to encourage consistent activity.

- **Marketing Strategy:** Use app insights to target low-activity days for each user with tailored campaigns like “Move More Today” or themed challenges. Emphasize community participation with in-app rewards and social media campaigns to foster accountability and engagement.

##### **Sleep Tracking**  
Improve wearability for night use by promoting lightweight and comfortable devices. Pair with actionable insights to boost sleep quality.  
- **Marketing Strategy:** Create campaigns around *“Better Sleep Starts Here”*, emphasizing the impact of Bellabeat devices on sleep efficiency and health.  

#### **6.2.3 Personalized Engagement**  

##### **Notifications and Reminders**  
Use user behavior trends (e.g., weight tracking on Mondays, stress relief on weekends) to deliver timely, customized app notifications.  
- **Marketing Strategy:** Highlight Bellabeat’s smart notifications as a key feature in ads, showcasing how the app adapts to individual routines.  

##### **Tracking Optimization**  
Enhance syncing capabilities for weight and activity tracking during peak times (e.g., evenings for weight and mornings for activity).  
- **Marketing Strategy:** Promote Bellabeat’s seamless syncing and automation features for a hassle-free health tracking experience.  

#### **6.2.4 Usability and Integration**  

##### **Streamlined User Experience**  
Automate more data inputs and integrate Bellabeat with popular health apps like Google Fit or Apple Health.  
- **Marketing Strategy:** Position Bellabeat as the ultimate health hub through partnerships and integration-focused campaigns targeting tech-savvy users.  

#### **6.2.5 Consistency Incentives**  

##### **Subscription Model**  
Offer premium insights into sleep, stress, and activity trends through a subscription plan. Features include personalized coaching and advanced analytics.  
- **Marketing Strategy:** Provide a free trial of premium features to showcase value, paired with targeted campaigns promoting Bellabeat as a holistic health solution.  

##### **Community Engagement**  
Introduce weekly challenges and rewards, encouraging users to share progress on social media.  
- **Marketing Strategy:** Run referral programs and social media campaigns to foster a sense of community and amplify word-of-mouth marketing.  

#### **6.2.6 Targeting Key Health Concerns**  

##### **Weight and BMI Solutions**  
Address overweight concerns (50% of users) with weight management tools and nutrition partnerships.  
- **Marketing Strategy:** Focus on Bellabeat’s ability to support weight loss goals with precise tracking, personalized tips, and progress visualization.  

## **Conclusion**  
By driving feature adoption, improving usability, and leveraging behavior-based insights, Bellabeat can drive higher user engagement and device sales. Marketing campaigns focused on personalization, health outcomes, and user-friendly tools will solidify Bellabeat’s position as a leader in the wearable health market.  
