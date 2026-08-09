CREATE TABLE ocd_patient_dataset (
    "Patient ID" INT PRIMARY KEY,
    Age INT,
    Gender VARCHAR(20),
    Ethnicity VARCHAR(50),
    "Marital Status" VARCHAR(30),
    Occupation VARCHAR(100),
    "OCD Diagnosis Date" DATE,
    "Obsession Type" VARCHAR(100),
    "Compulsion Type" VARCHAR(100),
    "Y-BOCS Score (Obsessions)" INT,
    "Y-BOCS Score (Compulsions)" INT,
    "Y-BOCS Total Score" INT
);

1.What is the Gender-wise Distribution of OCD Patients along with their Average Obsession and Compulsion Scores?

SELECT
    Gender,
    COUNT(*) AS Total_Patients,
    ROUND(COUNT(*)*100.0/(SELECT COUNT(*) FROM ocd_patient_dataset),2) AS Patient_Percentage,
    ROUND(AVG("Y-BOCS Score (Obsessions)"),2) AS Avg_Obsession_Score,
    ROUND(AVG("Y-BOCS Score (Compulsions)"),2) AS Avg_Compulsion_Score
FROM ocd_patient_dataset
GROUP BY Gender
ORDER BY Total_Patients DESC;

2.Which Age Groups have the Highest Number of OCD Patients?

SELECT
CASE
WHEN Age <20 THEN 'Below 20'
WHEN Age BETWEEN 20 AND 29 THEN '20-29'
WHEN Age BETWEEN 30 AND 39 THEN '30-39'
WHEN Age BETWEEN 40 AND 49 THEN '40-49'
WHEN Age BETWEEN 50 AND 59 THEN '50-59'
ELSE '60+'
END AS Age_Group,
COUNT(*) AS Total_Patients
FROM ocd_patient_dataset
GROUP BY Age_Group
ORDER BY Total_Patients DESC;

3.Which Obsession Types are Most Common among OCD Patients?

SELECT
    "Obsession Type",
    COUNT(*) AS Total_Patients,
    ROUND(AVG("Y-BOCS Total Score"),2) AS Avg_YBOCS_Total
FROM ocd_patient_dataset
GROUP BY "Obsession Type"
ORDER BY Total_Patients DESC;

4.Which Compulsion Types are Most Common among OCD Patients?

SELECT
    "Compulsion Type",
    COUNT(*) AS Total_Patients,
    ROUND(AVG("Y-BOCS Total Score"),2) AS Avg_YBOCS_Total
FROM ocd_patient_dataset
GROUP BY "Compulsion Type"
ORDER BY Total_Patients DESC;

5.How does OCD Severity (Y-BOCS Total Score) vary across Marital Status?

SELECT
    "Marital Status",
    COUNT(*) AS Total_Patients,
    ROUND(AVG("Y-BOCS Total Score"),2) AS Avg_YBOCS_Total
FROM ocd_patient_dataset
GROUP BY "Marital Status"
ORDER BY Avg_YBOCS_Total DESC;

6.Which Occupations have Patients with the Highest Average OCD Severity?

SELECT
    Occupation,
    COUNT(*) AS Total_Patients,
    ROUND(AVG("Y-BOCS Total Score"),2) AS Avg_YBOCS_Total
FROM ocd_patient_dataset
GROUP BY Occupation
ORDER BY Avg_YBOCS_Total DESC;

7.How is OCD Severity Distributed across Different Ethnicities?

SELECT
    Ethnicity,
    COUNT(*) AS Total_Patients,
    ROUND(AVG("Y-BOCS Total Score"),2) AS Avg_YBOCS_Total
FROM ocd_patient_dataset
GROUP BY Ethnicity
ORDER BY Avg_YBOCS_Total DESC;

8.How has the Number of OCD Diagnoses Changed Month by Month?

SELECT
DATE_TRUNC('month',"OCD Diagnosis Date") AS Diagnosis_Month,
COUNT(*) AS Total_Diagnoses
FROM ocd_patient_dataset
GROUP BY Diagnosis_Month
ORDER BY Diagnosis_Month;


9.Which Combination of Obsession Type and Compulsion Type is Most Frequently Observed?
SELECT
    "Obsession Type",
    "Compulsion Type",
    COUNT(*) AS Total_Patients
FROM ocd_patient_dataset
GROUP BY
    "Obsession Type",
    "Compulsion Type"
ORDER BY Total_Patients DESC
LIMIT 10;

10.Who are the Top 10 Patients with the Highest OCD Severity Scores?

SELECT
    "Patient ID",
    Age,
    Gender,
    Occupation,
    "Y-BOCS Total Score"
FROM ocd_patient_dataset
ORDER BY "Y-BOCS Total Score" DESC
LIMIT 10;