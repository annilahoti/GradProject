WITH base AS (
    SELECT
        patient_gender,
        Medical_condition,
        AVG(Age) AS avg_Age,
        COUNT(*) AS num_patients
    FROM {{ source('default','healthcare_patients')}}
    GROUP BY patient_gender, Medical_condition

)

SELECT * FROM base