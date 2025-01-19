CREATE EXTERNAL TABLE gold.ext_sales
WITH
(
    LOCATION = 'sales',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS SELECT * FROM gold.sales

CREATE EXTERNAL TABLE gold.ext_calendar
WITH
(
    LOCATION = 'calendar',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS SELECT * FROM gold.calendar

CREATE EXTERNAL TABLE gold.ext_territories
WITH
(
    LOCATION = 'territories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS SELECT * FROM gold.territories



