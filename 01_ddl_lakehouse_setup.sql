CREATE OR REPLACE TABLE ev_telemetry_staging (
    VIN VARCHAR(20),
    Age_Months INT,
    Odometer_km FLOAT,
    efficiency_kwh_per_100km FLOAT,
    Charge_Cycles FLOAT,
    Avg_Temp_C FLOAT,
    Avg_DoD_Percent FLOAT,
    Primary_Charge_Type VARCHAR(50),
    Rash_Driver BOOLEAN,
    Target_SoH_Percent FLOAT
);