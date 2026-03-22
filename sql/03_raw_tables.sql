-- Product
CREATE OR REPLACE TABLE product_raw
USING TEMPLATE (
  SELECT ARRAY_AGG(OBJECT_CONSTRUCT(*))
  FROM TABLE(
      INFER_SCHEMA(
        LOCATION=>'@aw_s3_stage/Product.csv',
        FILE_FORMAT=>'csv_format'
      )
  )
);

COPY INTO product_raw
FROM @aw_s3_stage/Product.csv
FILE_FORMAT = csv_format;

-- Customer
CREATE OR REPLACE TABLE customer_raw
USING TEMPLATE (
  SELECT ARRAY_AGG(OBJECT_CONSTRUCT(*))
  FROM TABLE(
      INFER_SCHEMA(
        LOCATION=>'@aw_s3_stage/Customer.csv',
        FILE_FORMAT=>'csv_format'
      )
  )
);

COPY INTO customer_raw
FROM @aw_s3_stage/Customer.csv
FILE_FORMAT = csv_format;

-- SalesOrderHeader
CREATE OR REPLACE TABLE salesorderheader_raw
USING TEMPLATE (
  SELECT ARRAY_AGG(OBJECT_CONSTRUCT(*))
  FROM TABLE(
      INFER_SCHEMA(
        LOCATION=>'@aw_s3_stage/SalesOrderHeader.csv',
        FILE_FORMAT=>'csv_format'
      )
  )
);

COPY INTO salesorderheader_raw
FROM @aw_s3_stage/SalesOrderHeader.csv
FILE_FORMAT = csv_format;

-- SalesOrderDetail
CREATE OR REPLACE TABLE salesorderdetail_raw
USING TEMPLATE (
  SELECT ARRAY_AGG(OBJECT_CONSTRUCT(*))
  FROM TABLE(
      INFER_SCHEMA(
        LOCATION=>'@aw_s3_stage/SalesOrderDetail.csv',
        FILE_FORMAT=>'csv_format'
      )
  )
);

COPY INTO salesorderdetail_raw
FROM @aw_s3_stage/SalesOrderDetail.csv
FILE_FORMAT = csv_format;

-- Employee
CREATE OR REPLACE TABLE employee_raw
USING TEMPLATE (
  SELECT ARRAY_AGG(OBJECT_CONSTRUCT(*))
  FROM TABLE(
      INFER_SCHEMA(
        LOCATION=>'@aw_s3_stage/Employee.csv',
        FILE_FORMAT=>'csv_format'
      )
  )
);

COPY INTO employee_raw
FROM @aw_s3_stage/Employee.csv
FILE_FORMAT = csv_format;