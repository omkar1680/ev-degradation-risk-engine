# EV Battery Residual Risk Underwriting Engine

## 📌 Executive Summary
The automotive secondary market is currently facing a massive financial blind spot: **pricing used Electric Vehicles (EVs).** Unlike internal combustion engine (ICE) vehicles where age and mileage dictate residual value, an EV's value is driven almost entirely by its battery's State of Health (SoH). 

This project is an end-to-end Analytics Engineering pipeline designed for automotive lenders, fleet managers, and residential community charging administrators. It ingests vehicle telemetry, predicts battery degradation using a physics-inspired LightGBM model, and pipelines the data into a Microsoft Fabric Lakehouse to segment fleets into financial risk tiers.

## 🏗️ Architecture & Tech Stack
* **Data Engineering & Simulation:** Python, NumPy, Pandas (Engineered 10,000-row synthetic dataset based on lithium-ion degradation physics, Depth of Discharge (DoD), and charging behavior).
* **Machine Learning:** Scikit-Learn, LightGBM (Trained a regressor to isolate primary degradation drivers via Information Gain).
* **Cloud Data Warehouse:** Microsoft Fabric (OneLake, Delta Tables).
* **Analytics Engineering:** T-SQL (Common Table Expressions, Window Functions for cohort benchmarking and risk tiering).
* **Business Intelligence:** Power BI (Live DirectLake connection for executive risk matrix visualization).

## 📊 Key Insights & ML Results
The predictive model successfully captured the non-linear degradation of EV batteries, achieving a **0.984 R²** and a **Mean Absolute Error (MAE) of just 0.47% SoH**. 

**Primary Business Findings:**
1. **Odometer is a Secondary Metric:** Total charge cycles and extreme ambient temperatures (>30°C) are significantly stronger predictors of battery death than raw mileage. 
2. **The DC Fast Charging Penalty:** Vehicles relying heavily on DC Fast Chargers (>30kW) showed a steeply accelerated degradation curve compared to vehicles using AC Home Level 2 chargers, plunging into "Subprime" underwriting tiers up to 30% faster.
3. **Behavioral Risk:** "Rash" drivers (characterized by high energy consumption and deep discharging down to 5% SoC) compound thermal stress on the battery, requiring higher insurance premiums or steeper loan collateral.

## 🚀 How to Run Locally
1. Clone the repository.
2. Run the Jupyter Notebook to generate a fresh localized dataset. 
3. Upload the resulting CSV to a Microsoft Fabric Lakehouse (or any standard SQL warehouse like Snowflake/PostgreSQL).
4. Execute the queries in `/sql/` to generate the underwriting matrix.

---
*Architected and developed by Omkar Vaidya.*
