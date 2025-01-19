# Azure Adventure-Works Project

## Introduction
This project serves as a comprehensive implementation to building an end-to-end data engineering pipeline. The goal is to extract customer and sales data from an API Github Source, transform it in the cloud, and generate actionable insights through a Power BI dashboard.

## System Architecture
![System Architecture](https://github.com/maihuy-dataguy/Azure-NYC-Taxi-project/blob/main/pics/flow.png)

The project is designed with the following components:

- **Data Source**: We use 10 files csv from `https://github.com/maihuy-dataguy/Azure-AdventureWorks-Project/tree/main/Data` for our pipeline.
- **Azure Data Factory (ADF)**: Responsible for ingesting data and storing fetched data in azure data lakehouse at bronze layer, implenmenting parameterized pipeline to fully fetch 10 csv files from github, using 3 key-value from ADF.json as inputs into Forech Activity  
- **Databricks Lakehouse**: Using medallion architecture, we transfer our data between these layers including bronze, silver, gold layers
    - Bronze layer: Used for storing raw data ingested from ADF.
    - Silver layer: Used for storing transformed data (parquet format) through spark using databrick notebook.
    - Gold layer: Set up a Synapse SQL Serverless pool and load the transformed data into Azure Synapse Analytics. Create view to query from gold container, create external table using CETAS
- **Power BI**: For creating dashboards to support related reports. 
- **Securiy**: Using secret key, grant access service princle application as storage data contributor.
- **Automation and Monitoring**:Use ADF to schedule the data pipelines to run daily. Use the monitoring tools in ADF and Synapse to ensure successful pipeline execution.

