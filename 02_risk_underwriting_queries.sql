WITH UnderwritingTiers AS (
    SELECT 
        VIN,
        Age_Months,
        Odometer_km,
        Target_SoH_Percent,
        ROUND(((100.0 - Target_SoH_Percent) / (Age_Months / 12.0)), 2) AS annual_degradation_rate,
        CASE 
            WHEN Target_SoH_Percent >= 88.0 
                THEN 'Tier 1: Prime Certified Pre-Owned'
            WHEN Target_SoH_Percent >= 80.0 
                THEN 'Tier 2: Standard Resale'
            WHEN Target_SoH_Percent >= 70.0 
                THEN 'Tier 3: Near-Subprime (High Risk)'
            ELSE 'Tier 4: Fleet Ineligible (Battery Death Imminent)'
        END AS underwriting_status
    FROM ev_telemetry_staging
)
SELECT 
    underwriting_status,
    COUNT(*) AS total_vehicles,
    CAST(AVG(Odometer_km) AS INT) AS avg_mileage_km,
    CAST(AVG(Target_SoH_Percent) AS DECIMAL(5,2)) AS avg_soh_percent,
    CAST(AVG(annual_degradation_rate) AS DECIMAL(5,2)) AS avg_annual_degradation
FROM UnderwritingTiers
GROUP BY underwriting_status
ORDER BY avg_soh_percent DESC;