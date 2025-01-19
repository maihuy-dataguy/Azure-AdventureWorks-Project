CREATE MASTER KEY  ENCRYPTION BY PASSWORD ='password' ;
CREATE DATABASE SCOPED CREDENTIAL huym_cred
WITH IDENTITY = 'Managed Identity'

CREATE EXTERNAL DATA SOURCE source_silver
WITH
(
    LOCATION = 'https://awstoragehuym.dfs.core.windows.net/silver/',
    CREDENTIAL = huym_cred
)

CREATE EXTERNAL DATA SOURCE source_gold
WITH
(
    LOCATION = 'https://awstoragehuym.dfs.core.windows.net/gold/',
    CREDENTIAL = huym_cred
)

CREATE EXTERNAL FILE FORMAT format_parquet
WITH
(
    FORMAT_TYPE=PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)
CREATE EXTERNAL FILE FORMAT format_delta
WITH
(
    FORMAT_TYPE=DELTA,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)

