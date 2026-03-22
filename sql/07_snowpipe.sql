CREATE OR REPLACE PIPE salesorderdetail_pipe
AUTO_INGEST = FALSE
AS
COPY INTO salesorderdetail_raw
FROM @aw_s3_stage/SalesOrderDetail.csv
FILE_FORMAT = csv_format;

ALTER PIPE salesorderdetail_pipe REFRESH;