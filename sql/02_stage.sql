CREATE OR REPLACE STAGE aw_s3_stage
URL='s3://bucket-name/'
FILE_FORMAT = csv_format;