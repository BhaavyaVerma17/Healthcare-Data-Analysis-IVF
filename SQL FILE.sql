-- Data Set 0
-- Create and Use Database
CREATE DATABASE ivf_datasets;
USE ivf_datasets;

-- Check table structure
DESC reports_and_dashboards_data;

-- View all data
SELECT * FROM reports_and_dashboards_data;

-- Count total rows
SELECT COUNT(*) AS total_rows
FROM reports_and_dashboards_data;

-- Check Invalid values (0)
SELECT COUNT(*) AS null_count
FROM reports_and_dashboards_data
WHERE `week of birth` = 0;

-- Rename Columns (Cleaning Column Names)
ALTER TABLE reports_and_dashboards_data 
RENAME COLUMN `ï»¿PATIENT NAME AND SURNAME` TO Patient_name_and_Surname;

ALTER TABLE reports_and_dashboards_data 
RENAME COLUMN `Spouse AGE` TO Spouse_age;

ALTER TABLE reports_and_dashboards_data 
RENAME COLUMN `Clinical pregnancy: 0:0, Chemical: 1:1 Positive` TO Pregnancy_type;

ALTER TABLE reports_and_dashboards_data 
RENAME COLUMN `Live Birth` TO Live_birth;

ALTER TABLE reports_and_dashboards_data 
RENAME COLUMN ABORTION TO Abortion;

ALTER TABLE reports_and_dashboards_data 
RENAME COLUMN `week of birth` TO Week_of_birth;

ALTER TABLE reports_and_dashboards_data 
RENAME COLUMN `Neonatal Death` TO Neonatal_death;

ALTER TABLE reports_and_dashboards_data 
RENAME COLUMN PROGESTERONE TO Progesterone;

ALTER TABLE reports_and_dashboards_data 
RENAME COLUMN `NUMBER OF OOCYTES` TO Number_of_oocytes;

ALTER TABLE reports_and_dashboards_data 
RENAME COLUMN `Embryo Tranfer Day` TO Embryo_tranfer_day;

ALTER TABLE reports_and_dashboards_data 
RENAME COLUMN `ENDOMETRIAL THICKNESS ON THE DAY OF TRANSFER` 
TO Endometrial_thickness_on_tranfer_day;

ALTER TABLE reports_and_dashboards_data 
RENAME COLUMN `IND. NUMBER OF DAYS` TO Ind_number_of_days;

ALTER TABLE reports_and_dashboards_data 
RENAME COLUMN `Number of Embryos Transferred` 
TO Number_of_embryos_transferred;

-- Handling Missing Values (Replacing 0 with NULL)

-- Replace 0 with NULL in Week_of_birth
UPDATE reports_and_dashboards_data
SET Week_of_birth = NULL
WHERE Week_of_birth = 0;

-- Replace 0 with NULL in FSH
UPDATE reports_and_dashboards_data
SET fsh = NULL
WHERE fsh = 0;

-- Replace 0 with NULL in E2
UPDATE reports_and_dashboards_data
SET e2 = NULL
WHERE e2 = 0;

-- Replace 0 with NULL in Progesterone
UPDATE reports_and_dashboards_data
SET Progesterone = NULL
WHERE Progesterone = 0;

-- Replace 0 with NULL in Number_of_oocytes
UPDATE reports_and_dashboards_data
SET Number_of_oocytes = NULL
WHERE Number_of_oocytes = 0;

-- Replace 0 with NULL in Ind_number_of_days
UPDATE reports_and_dashboards_data
SET Ind_number_of_days = NULL
WHERE Ind_number_of_days = 0;

-- Replace 0 with NULL in Number_of_embryos_transferred
UPDATE reports_and_dashboards_data
SET Number_of_embryos_transferred = NULL
WHERE Number_of_embryos_transferred = 0;

-- Replace 0 with NULL in AMH
UPDATE reports_and_dashboards_data
SET amh = NULL
WHERE amh = 0;

-- Change Data Types
ALTER TABLE reports_and_dashboards_data 
MODIFY Week_of_birth INT;

ALTER TABLE reports_and_dashboards_data 
MODIFY fsh FLOAT;

ALTER TABLE reports_and_dashboards_data 
MODIFY e2 FLOAT;

ALTER TABLE reports_and_dashboards_data 
MODIFY Progesterone INT;

ALTER TABLE reports_and_dashboards_data 
MODIFY Number_of_oocytes INT;

ALTER TABLE reports_and_dashboards_data 
MODIFY Ind_number_of_days INT;

ALTER TABLE reports_and_dashboards_data 
MODIFY Number_of_embryos_transferred INT;

ALTER TABLE reports_and_dashboards_data 
MODIFY amh FLOAT;

--  Data Distribution (Basic Statistics)
-- Age statistics
SELECT MIN(age) AS min_age,
       MAX(age) AS max_age,
       AVG(age) AS avg_age
FROM reports_and_dashboards_data;

-- Week of Birth statistics
SELECT MIN(Week_of_birth) AS min_week,
       MAX(Week_of_birth) AS max_week,
       AVG(Week_of_birth) AS avg_week
FROM reports_and_dashboards_data;

-- FSH statistics
SELECT MIN(fsh) AS min_fsh,
       MAX(fsh) AS max_fsh,
       AVG(fsh) AS avg_fsh
FROM reports_and_dashboards_data;

-- E2 statistics
SELECT MIN(e2) AS min_e2,
       MAX(e2) AS max_e2,
       AVG(e2) AS avg_e2
FROM reports_and_dashboards_data;

-- Number of oocytes statistics
SELECT MIN(Number_of_oocytes) AS min_oocytes,
       MAX(Number_of_oocytes) AS max_oocytes,
       AVG(Number_of_oocytes) AS avg_oocytes
FROM reports_and_dashboards_data;

-- Categorical Data Analysis
-- Pregnancy type distribution
SELECT Pregnancy_type,
       COUNT(*) AS total_count
FROM reports_and_dashboards_data
GROUP BY Pregnancy_type
ORDER BY total_count DESC;

-- Abortion distribution
SELECT Abortion,
       COUNT(*) AS total_count
FROM reports_and_dashboards_data
GROUP BY Abortion
ORDER BY total_count DESC;

-- Twin cases distribution
SELECT Twin,
       COUNT(*) AS total_count
FROM reports_and_dashboards_data
GROUP BY Twin
ORDER BY total_count DESC;

-- Indication distribution
SELECT Indication,
       COUNT(*) AS total_count
FROM reports_and_dashboards_data
GROUP BY Indication
ORDER BY total_count DESC;

-- EU distribution
SELECT EU,
       COUNT(*) AS total_count
FROM reports_and_dashboards_data
GROUP BY EU
ORDER BY total_count DESC;

-- Data Set 1

CREATE TABLE reports_ivf_data (
    grp INT,
    age INT,
    bmi FLOAT,
    duration_of_fertility INT,
    infertility_type INT,
    lh_fsh FLOAT,
    tt FLOAT,
    e2 FLOAT,
    dose_gn FLOAT,
    duration_gn INT,
    e2_hcg_day FLOAT,
    retrieved_oocytes INT,
    fertilization_rate FLOAT,
    good_quality_embryo_rate FLOAT,
    clinical_pregnancy INT,
    miscarriage INT,
    live_birth INT,
    ga_weeks INT,
    delivery_type INT
);

Select * From reports_ivf_data;
-- Total rows
SELECT COUNT(*) AS total_records
FROM reports_ivf_data;

-- Check NULL values column-wise
SELECT 
    SUM(age IS NULL) AS null_age,
    SUM(bmi IS NULL) AS null_bmi,
    SUM(e2 IS NULL) AS null_e2,
    SUM(retrieved_oocytes IS NULL) AS null_oocytes
FROM reports_ivf_data;

-- Data Cleaning Replace 0 with Null
UPDATE reports_ivf_data
SET fertilization_rate = NULL
WHERE fertilization_rate = 0;

UPDATE reports_ivf_data
SET good_quality_embryo_rate = NULL
WHERE good_quality_embryo_rate = 0;

UPDATE reports_ivf_data
SET e2 = NULL
WHERE e2 = 0;

-- Descriptive Statistics (Numerical EDA)
SELECT 
    MIN(age) AS min_age,
    MAX(age) AS max_age,
    AVG(age) AS avg_age
FROM reports_ivf_data;

-- BMI 
SELECT 
    MIN(bmi) AS min_bmi,
    MAX(bmi) AS max_bmi,
    AVG(bmi) AS avg_bmi
FROM reports_ivf_data;

SELECT 
    MIN(e2) AS min_e2,
    MAX(e2) AS max_e2,
    AVG(e2) AS avg_e2
FROM reports_ivf_data;

-- Oocyte Statistics
SELECT 
    MIN(retrieved_oocytes) AS min_oocytes,
    MAX(retrieved_oocytes) AS max_oocytes,
    AVG(retrieved_oocytes) AS avg_oocytes
FROM reports_ivf_data;

-- Categorical Analysis
-- Group Distribution
SELECT 
    grp,
    COUNT(*) AS total_count
FROM reports_ivf_data
GROUP BY grp;

-- Infertility Type
SELECT 
    infertility_type,
    COUNT(*) AS total_count
FROM reports_ivf_data
GROUP BY infertility_type;

-- Clinical Pregnancy Rate
SELECT 
    clinical_pregnancy,
    COUNT(*) AS total_cases
FROM reports_ivf_data
GROUP BY clinical_pregnancy;

-- Live Birth Rate
SELECT 
    live_birth,
    COUNT(*) AS total_cases
FROM reports_ivf_data
GROUP BY live_birth;

-- Pregnancy Rate by Group
SELECT 
    grp,
    AVG(clinical_pregnancy) * 100 AS pregnancy_rate_percentage
FROM reports_ivf_data
GROUP BY grp;

-- Live Birth Rate by Group
SELECT 
    grp,
    AVG(live_birth) * 100 AS live_birth_rate_percentage
FROM reports_ivf_data
GROUP BY grp;

-- Average Oocytes by Pregnancy Outcome
SELECT 
    clinical_pregnancy,
    AVG(retrieved_oocytes) AS avg_oocytes
FROM reports_ivf_data
GROUP BY clinical_pregnancy;

-- Miscarriage Rate
SELECT 
    SUM(miscarriage) * 100.0 / COUNT(*) AS miscarriage_rate_percentage
FROM reports_ivf_data;

-- Outlier Detection
SELECT *
FROM reports_ivf_data
WHERE age > 40
   OR bmi > 30
   OR retrieved_oocytes > 30;

-- Correlation
-- Does higher BMI reduce pregnancy rate?
SELECT 
    CASE
        WHEN bmi < 20 THEN 'Low BMI'
        WHEN bmi BETWEEN 20 AND 25 THEN 'Normal BMI'
        ELSE 'High BMI'
    END AS bmi_category,
    AVG(clinical_pregnancy) * 100 AS pregnancy_rate
FROM
    reports_ivf_data
GROUP BY bmi_category;

-- Data Set 2

CREATE TABLE ivf_cycles (
    fc_no VARCHAR(20),
    cycle_no INT,
    age INT,
    duration_of_infertility INT,
    bmi FLOAT,
    primary_infertility INT,
    infertility_type VARCHAR(30),
    cause VARCHAR(100),
    afc INT,
    amh_ng_ml FLOAT,
    protocol VARCHAR(20),
    stimulation VARCHAR(20),
    lh_from_start FLOAT,
    days_of_stimulation INT,
    e2_trigger FLOAT,
    p4_trigger FLOAT,
    trigger_type VARCHAR(20),
    large_follicles INT,
    total_oocytes INT,
    m2_oocytes INT,
    sperm VARCHAR(100),
    ssr INT,
    donor INT,
    pn2_no INT,
    ser INT,
    embryos_formed INT,
    embryos_frozen INT,
    sets INT,
    all_freeze INT,
    time_from_ivf_months INT,
    endo_prep VARCHAR(20),
    et FLOAT,
    zone VARCHAR(20),
    morphology VARCHAR(100),
    embryo_transfer_day VARCHAR(10),
    transferred_embryos INT,
    embryos VARCHAR(100),
    blast VARCHAR(10),
    good_blast INT,
    emb_gp VARCHAR(10),
    remain_set INT,
    difficult_transfer INT,
    fundus_distance_mm FLOAT,
    result VARCHAR(50),
    biochemical INT,
    ectopic INT,
    clinical_preg INT,
    twin INT,
    triplet INT,
    miscarriage INT,
    ongoing INT,
    remark TEXT
);

-- Check Total Records
SELECT COUNT(*) AS total_records FROM ivf_cycles;

SELECT * FROM ivf_cycles LIMIT 10;

-- Missing Value
SELECT 
COUNT(*) - COUNT(age) AS missing_age,
COUNT(*) - COUNT(bmi) AS missing_bmi,
COUNT(*) - COUNT(amh_ng_ml) AS missing_amh
FROM ivf_cycles;

-- Avg, Min, Max
SELECT 
ROUND(AVG(age),2) AS avg_age,
MIN(age) AS min_age,
MAX(age) AS max_age
FROM ivf_cycles;

-- Age group
SELECT 
CASE 
    WHEN age < 30 THEN '<30'
    WHEN age BETWEEN 30 AND 35 THEN '30-35'
    WHEN age BETWEEN 36 AND 40 THEN '36-40'
    ELSE '40+'
END AS age_group,
COUNT(*) AS total_cases
FROM ivf_cycles
GROUP BY age_group
ORDER BY total_cases DESC;

-- Cause Distribution
SELECT cause, COUNT(*) AS total_cases
FROM ivf_cycles
GROUP BY cause
ORDER BY total_cases DESC;

-- IVF Success Rate
SELECT 
COUNT(*) AS total_cycles,
SUM(clinical_preg) AS total_pregnancy,
ROUND(SUM(clinical_preg)*100.0/COUNT(*),2) AS success_rate_percent
FROM ivf_cycles;

-- Success by Age Group
SELECT 
CASE 
    WHEN age < 30 THEN '<30'
    WHEN age BETWEEN 30 AND 35 THEN '30-35'
    WHEN age BETWEEN 36 AND 40 THEN '36-40'
    ELSE '40+'
END AS age_group,
COUNT(*) AS total_cases,
SUM(clinical_preg) AS pregnancies,
ROUND(SUM(clinical_preg)*100.0/COUNT(*),2) AS success_rate
FROM ivf_cycles
GROUP BY age_group;

-- Oocyte Analysis
SELECT 
ROUND(AVG(total_oocytes),2) AS avg_total_oocytes,
ROUND(AVG(m2_oocytes),2) AS avg_m2_oocytes
FROM ivf_cycles;

-- AMH Category Analysis
SELECT 
CASE 
    WHEN amh_ng_ml < 1 THEN 'Low'
    WHEN amh_ng_ml BETWEEN 1 AND 4 THEN 'Normal'
    ELSE 'High'
END AS amh_category,
COUNT(*) AS total_cases,
SUM(clinical_preg) AS pregnancies
FROM ivf_cycles
GROUP BY amh_category;

-- Miscarriage Rate
SELECT 
SUM(miscarriage) AS total_miscarriage,
ROUND(SUM(miscarriage)*100.0/COUNT(*),2) AS miscarriage_rate
FROM ivf_cycles;

-- Twin Rate
SELECT 
SUM(twin) AS total_twins,
ROUND(SUM(twin)*100.0/COUNT(*),2) AS twin_rate
FROM ivf_cycles;

-- Correlation
SELECT 
CASE 
    WHEN e2_trigger < 2000 THEN 'Low'
    WHEN e2_trigger BETWEEN 2000 AND 4000 THEN 'Medium'
    ELSE 'High'
END AS e2_category,
COUNT(*) AS total_cases,
SUM(clinical_preg) AS pregnancies,
ROUND(SUM(clinical_preg)*100.0/COUNT(*),2) AS success_rate
FROM ivf_cycles
GROUP BY e2_category;

