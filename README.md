Hospital Management Analytics
Project Overview
This project analyzes hospital operational data to understand patient flow, appointment performance, waiting time, patient experience, department workload, doctor workload, and revenue patterns.

The project follows a practical data analytics workflow:

Excel → MySQL → Power BI

The objective is to turn raw hospital data into a structured analytical solution that can help management identify operational patterns and areas that may require further investigation.

Business Problem
Hospitals generate large amounts of data across appointments, patients, doctors, visits, billing, and patient feedback.

Without a consolidated analysis, it can be difficult to understand:

When patient demand is highest
Where waiting times are higher
How many appointments are cancelled or missed
How workload varies across departments and doctors
How patients are distributed by city, gender, and insurance type
How waiting time relates to patient satisfaction
How revenue is distributed across departments and treatments
This project brings these areas together into one analytical view.

Business Questions
The analysis focuses on:

What is the overall appointment volume and completion rate?
How many appointments are cancelled or marked as no-shows?
When is patient demand highest?
Which departments have higher average waiting times?
How is appointment workload distributed across departments?
How is workload distributed across doctors?
How does patient demand vary by city, gender, and insurance type?
What is the relationship between waiting time and patient satisfaction?
How is revenue distributed across departments and treatments?
What operational patterns should management investigate further?
Dataset
The project contains six main datasets:

Patients
Appointments
Doctors
Visits
Billing
Feedback
The data was cleaned and validated before analysis.

Key data-quality checks included:

Missing-value checks
Duplicate checks
Invalid category checks
Date validation
Waiting-time validation
ID consistency checks
Data-type validation
Tools & Technologies
Tool	Purpose
Microsoft Excel	Data cleaning, validation, Power Query transformation and exploratory analysis
MySQL	Database storage and SQL-based analysis
Power BI	Data modelling, DAX measures, dashboard development and visualization
Project Workflow
1. Excel
The raw datasets were cleaned and standardized in Excel.

Power Query was used to combine relevant datasets and create a consolidated appointment-level analytical table.

The Excel stage also included KPI calculations and PivotTable-based exploratory analysis.

2. MySQL
The cleaned datasets were imported into a MySQL database named healthcare_analytics.

SQL was used to analyze:

Appointment status
Department workload
Waiting time
Patient demographics
Insurance patterns
Appointment trends
No-show and cancellation rates
Doctor workload
Revenue
Patient satisfaction
Operational patterns
3. Power BI
The final analytical model was developed in Power BI.

DAX measures were created for important KPIs such as:

Total Appointments
Completed Appointments
No Show Appointments
No Show Rate
Cancellation Rate
Completion Rate
Average Waiting Time
Average Satisfaction
Total Revenue
Power BI Dashboard
The dashboard is organized into four analytical areas.

Page 1 — Overall Hospital Operations
Focuses on:

Appointment KPIs
Monthly appointment demand
Waiting-time distribution
Department waiting time
Appointment status
Day-wise demand
Department workload
Department completion
Doctor workload
Page 2 — Patient Experience & Demand
Focuses on:

Average satisfaction
Feedback categories
Waiting time vs satisfaction
City-wise demand
Gender-wise demand
Insurance-wise demand
Page 3 — Department & Doctor Performance
Focuses on:

Department workload
Completed workload
Completion rates
Doctor workload
Doctor completed appointments
Page 4 — Revenue & Financial Performance
Focuses on:

Total revenue
Revenue by department
Revenue by treatment
Insurance coverage
Insurance coverage by insurance type
Final amount by insurance type
Key Project Metrics
Metric	Result
Total Appointments	60,000
Completed Appointments	46,840
No-Show Appointments	6,066
No-Show Rate	10.11%
Cancelled Appointments	7,094
Average Waiting Time	23.14 minutes
Doctors	120
Unique Patients in Appointment Data	9,966
Business Insights
The analysis provides evidence about several operational areas:

Appointment demand varies across time periods and days.
Waiting time differs across departments.
A measurable share of scheduled appointments do not result in completed visits because of cancellations and no-shows.
Doctor and department workloads are not evenly distributed.
Patient demand varies across cities, genders, and insurance categories.
Waiting time and patient satisfaction can be analyzed together to identify potential patient-experience patterns.
Revenue varies across departments and treatments.
These findings provide areas for management to investigate further rather than assuming a single cause from the data alone.

Business Value
The dashboard provides management with a consolidated operational view that can support:

Demand and resource planning
Waiting-time monitoring
Appointment utilization analysis
Department workload investigation
Doctor workload analysis
Patient-experience monitoring
Revenue analysis
Data-driven operational discussions
The dashboard is designed to support investigation and decision-making rather than replace operational judgement.

Project Structure
hospital-management-analytics
│
├── 01_Raw Data
│   ├── Patients.csv
│   ├── Appointments.csv
│   ├── Doctors.csv
│   ├── Visits.csv
│   ├── Billing.csv
│   └── Feedback.csv
│
├── 02_Excel
│   ├── Patients_Cleaned.xlsx
│   ├── Appointments_Cleaned.xlsx
│   ├── Doctors_Cleaned.xlsx
│   ├── Visits_Cleaned.xlsx
│   ├── Billing_Cleaned.xlsx
│   ├── Feedback_Cleaned.xlsx
│   └── Healthcare_Analytics_Master.xlsx
│
├── 03_SQL
│   └── healthcare_analysis.sql
│
└── 04_PowerBI
    └── Healthcare_Analytics_Dashboard.pbix
Outcome
This project demonstrates an end-to-end data analytics workflow covering:

Data Cleaning → Data Transformation → SQL Analysis → Data Modelling → DAX → Dashboard Development → Business Insights

The project focuses on converting operational healthcare data into meaningful information that can support data-driven hospital management.

Disclaimer
The dataset does not contain personal or sensitive patient information.

