##Snowflake + AWS S3 Data Pipeline

## What this project does

This project builds a simple but realistic **data pipeline** where raw CSV files from the AdventureWorks dataset are:

- stored in **AWS S3**
- ingested into **Snowflake**
- cleaned and structured
- transformed into an analytics table (`product_sales`)
- automatically updated using Snowflake tasks

The goal was to understand how a **data lake → data warehouse pipeline** actually works end-to-end.

---

## Pipeline Flow


S3 (CSV files)
-->
Snowflake Stage
-->
RAW tables (schema inferred)
-->
CLEAN tables (column mapping from c1, c2 → actual fields)
-->
Analytics table (product_sales)
-->
Snowflake Task (runs every 5 minutes)


---

## Key things I implemented

### 1. Ingestion from S3 → Snowflake

- Created external stage pointing to S3 bucket  
- Loaded multiple AdventureWorks CSV files using `COPY INTO`  
- Used `INFER_SCHEMA` to dynamically create raw tables  

---

### 2. Handling messy schema (real issue)

One major issue was:

- Snowflake created columns as `c1, c2, c3...`

Instead of reloading everything, I:

- created a **clean layer**
- mapped columns manually (e.g. `c5 → ProductID`, `c4 → OrderQty`)

This step reflects a real-world problem when dealing with raw data.

---

### 3. Transformation logic

Created an analytics table:


product_sales


which calculates:

- total sales per product  
- total quantity sold  

using join between:

- `salesorderdetail_clean`  
- `product_clean`  

---

### 4. Automation

- Created a Snowflake **Task** to refresh the analytics table every 5 minutes  
- Set up **Snowpipe (manual trigger)** for ingestion  

So the pipeline does not require manual updates after setup.

---

## Tech used

- Snowflake (warehouse + compute)  
- AWS S3 (storage)  
- SQL  

---

## What I’d improve next

- proper column naming at ingestion stage (avoid c1, c2 issue)  
- automate Snowpipe using S3 event notifications  
- add a dashboard layer (Power BI / Tableau)  
- handle incremental loads instead of full refresh  
