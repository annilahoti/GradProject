{{ config(materialized='table')}}

WITH billing AS (
    SELECT
        Hospital,
        COUNT(*) AS num_patients,
        SUM(Billing_Amount) AS total_billing,
        AVG(Billing_Amount) AS avg_billing
    FROM {{source('default','healthcare_patients')}}
    GROUP BY Hospital
)

SELECT * FROM billing