CREATE DATABASE healthcare_analytics;
SHOW DATABASES;
USE healthcare_analytics;
SHOW TABLES;
SELECT COUNT(*) AS total_patients
FROM patients_cleaned; 
SELECT COUNT(*) AS total_appointments
FROM appointments_cleaned; 
SELECT COUNT(*) AS total_doctors
FROM doctors_cleaned; 
SELECT COUNT(*) AS total_billing
FROM billing_cleaned; 
SELECT COUNT(*) AS total_visits
FROM visits_cleaned; 
SELECT COUNT(*) AS total_feedback
FROM feedback_cleaned; 
SELECT status, COUNT(*) AS appointment_count
FROM appointments_cleaned
GROUP BY status
ORDER BY appointment_count DESC;
SELECT department, COUNT(*) AS appointment_count
FROM appointments_cleaned
GROUP BY department
ORDER BY appointment_count DESC;
SELECT department, 
       ROUND(AVG(waiting_time_minutes), 2) AS avg_waiting_minutes
FROM appointments_cleaned
GROUP BY department
ORDER BY avg_waiting_minutes DESC;
SELECT p.gender, COUNT(*) AS appointment_count
FROM appointments_cleaned a
JOIN patients_cleaned p
    ON a.patient_id = p.patient_id
GROUP BY p.gender
ORDER BY appointment_count DESC;
SELECT p.insurance_type, COUNT(*) AS appointment_count
FROM appointments_cleaned a
JOIN patients_cleaned p
    ON a.patient_id = p.patient_id
GROUP BY p.insurance_type
ORDER BY appointment_count DESC;
SELECT MONTH (Appointment_date) AS month,
COUNT(*) AS appointment_count
FROM appointments_cleaned
GROUP BY MONTH (Appointment_date)
ORDER BY month;
SELECT ROUND (AVG(Waiting_time_minutes),2)
AS average_waiting_time
FROM appointments_cleaned;
SELECT Waiting_time_minutes
FROM appointments_cleaned
ORDER BY Waiting_time_minutes DESC
LIMIT 1;
SELECT SUM(Waiting_time_minutes) AS 
total_waiting_time
FROM appointments_cleaned;
SHOW TABLES;
SELECT p.city, COUNT(*) AS
appointment_count
FROM appointments_cleaned a
JOIN patients_cleaned p
ON a.patient_ID = p.patient_ID
GROUP BY p.city
ORDER BY appointment_count DESC;
SELECT Department, status, COUNT(*)
AS appointment_count
FROM appointments_cleaned
GROUP BY Department, status
ORDER BY Department,
appointment_count DESC;
SELECT Department, COUNT(*) AS
completed_appointments
FROM appointments_cleaned
WHERE Status = 'completed'
GROUP BY Department
ORDER BY completed_appointments DESC;
SELECT COUNT(*) AS no_show_count
FROM appointments_cleaned
WHERE status = 'no show';
SELECT COUNT(*) AS cancelled_count
FROM appointments_cleaned
WHERE status = 'cancelled';
DROP DATABASE healthcare_analytics;
UPDATE patients_cleaned
SET registration_date =
STR_TO_DATE(TRIM(registration_date),
'%d %M %Y');
ALTER TABLE patients_cleaned
MODIFY registration_date DATE;
UPDATE appointments_cleaned
SET appointment_date =
STR_TO_DATE(TRIM(appointment_date),
'%d-%m-%Y')
WHERE appointment_date LIKE '%-%';
UPDATE appointments_cleaned
SET appointment_date =
STR_TO_DATE(TRIM(appointment_date),
'%d %M %Y')
WHERE appointment_date LIKE '% %';
ALTER TABLE appointments_cleaned
MODIFY appointment_date DATE;
UPDATE visits_cleaned
SET visit_date =
STR_TO_DATE(TRIM(visit_date),
'%d %M %Y');
ALTER TABLE visits_cleaned
MODIFY visit_date DATE;
UPDATE visits_cleaned
SET discharge_date =
STR_TO_DATE(TRIM(discharge_date),
'%d %M %Y');
ALTER TABLE visits_cleaned
MODIFY discharge_date DATE;
UPDATE appointments_cleaned
SET appointment_time =
STR_TO_DATE(TRIM(appointment_time),
'%H:%i')
WHERE appointment_time LIKE '%:%:%' =
FALSE;
ALTER TABLE appointments_cleaned
MODIFY appointment_time TIME;
UPDATE appointments_cleaned
SET appointment_date =
STR_TO_DATE(TRIM(appointment_date),
'%d %M %Y')

ALTER TABLE appointments_cleaned
MODIFY appointment_time TIME;

UPDATE feedback_cleaned
SET waiting_time_minutes =
STR_TO_DATE(TRIM(waiting_time_minutes),
'%h:%i:%s %p')
WHERE waiting_time_minutes LIKE '%AM'
OR waiting_time_minutes LIKE '%PM';
ALTER TABLE feedback_cleaned
MODIFY waiting_time_minutes TIME;
SELECT visit_ID,
Final_amount
FROM billing_cleaned;
SELECT SUM(final_amount) AS total_revenue
FROM billing_cleaned;
SELECT ROUND(AVG(Final_amount),2)AS
average_revenue
FROM billing_cleaned;
SELECT 
v.diagnosis,
SUM(b.final_amount) AS 
total_revenue
FROM billing_cleaned b
JOIN visits_cleaned v
ON b. visit_ID = v.visit_ID
GROUP BY v.diagnosis
ORDER BY total_revenue DESC;
SELECT 
v.treatment,
SUM(b.final_amount) AS 
total_revenue
FROM billing_cleaned b
JOIN visits_cleaned v
ON b. visit_ID = v.visit_ID
GROUP BY v.treatment
ORDER BY total_revenue DESC;
SELECT 
SUM(insurance_cover) AS 
total_insurance_cover
FROM billing_cleaned;
SELECT 
SUM(final_amount) AS 
total_patient_payment
FROM billing_cleaned;
SELECT ROUND(
COUNT(CASE WHEN STATUS = 'No show' THEN 1 END) * 100.0/ 
COUNT(*),2
) AS no_show_rate
FROM appointments_cleaned;
SELECT ROUND(
COUNT(CASE WHEN STATUS = 'cancalled' THEN 1 END) * 100.0/ 
COUNT(*),2
) AS cancellation_rate
FROM appointments_cleaned;
SELECT ROUND(
COUNT(CASE WHEN STATUS = 'completed' THEN 1 END) * 100.0/ 
COUNT(*),2
) AS completion_rate
FROM appointments_cleaned;
SELECT DAYNAME(appointment_date) AS day_name,
COUNT(*) AS appointment_count
FROM appointments_cleaned
GROUP BY DAYNAME(appointment_date)
ORDER BY appointment_count DESC;
SELECT HOUR(appointment_time) AS appointment_hour,
COUNT(*) AS appointment_count
FROM appointments_cleaned
GROUP BY HOUR(appointment_time)
ORDER BY appointment_count DESC;
SELECT 
CASE
WHEN waiting_time_minutes <=
15 THEN '0-15 min'
WHEN waiting_time_minutes <=
30 THEN '16-30 min'
WHEN waiting_time_minutes <=
60 THEN '31-60 min'
ELSE '60+ MIN'
END AS waiting_group,
COUNT(*) AS appointment_count
FROM appointments_cleaned
GROUP BY waiting_group
ORDER BY appointment_count DESC;
SELECT ROUND(AVG(satisfaction_score), 2)
AS average_satisfaction
FROM feedback_cleaned;
SELECT 
CASE
WHEN waiting_time_minutes <=
15 THEN '0-15 min'
WHEN waiting_time_minutes <=
30 THEN '16-30 min'
WHEN waiting_time_minutes <=
60 THEN '31-60 min'
ELSE '60+ MIN'
END AS waiting_group,
ROUND(AVG(satisfaction_score), 2)
AS average_satisfaction
FROM feedback_cleaned
GROUP BY waiting_group
ORDER BY average_satisfaction DESC;
SELECT doctor_ID,
COUNT(*) AS appointment_count
FROM appointments_cleaned
GROUP BY doctor_ID
ORDER BY appointment_count DESC;
SELECT doctor_ID,
COUNT(*) AS completed_appointments
FROM appointments_cleaned
WHERE status = 'completed'
GROUP BY doctor_ID
ORDER BY completed_appointments DESC;
SELECT department,
COUNT(*) AS
completed_appointments
FROM appointments_cleaned
WHERE status = 'completed'
GROUP BY department
ORDER BY completed_appointments DESC;
SELECT 
p.insurance_type,
a.status,
COUNT(*) AS appointment_count
FROM appointments_cleaned a
JOIN patients_cleaned p
ON a.patient_ID = p.patient_ID
GROUP BY p.insurance_type, a.status
ORDER BY p.insurance_type,
appointment_count DESC; 
SELECT
a.department,
SUM(b.final_amount) AS 
total_revenue
FROM billing_cleaned b
JOIN visits_cleaned v
ON b.visit_ID = v.visit_ID
JOIN appointments_cleaned a
ON v.appointment_ID = a.appointment_ID
GROUP BY a.department
ORDER BY total_revenue DESC;
