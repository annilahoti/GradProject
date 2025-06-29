{{ config(materialized='table')}}

WITH base AS (
    SELECT *,
        CASE
            WHEN Age >= 65 OR Medical_Condition IN ('Heart Disease','Stroke') THEN 'High'
            WHEN Age BETWEEN 45 AND 64 THEN 'Medium'
            ELSE 'Low'
        END AS risk_level
    FROM {{ source('default','healthcare_patients')}}
)



SELECT 
    Name,
    Age,
    patient_gender,
    Medical_Condition,
    risk_level
FROM base