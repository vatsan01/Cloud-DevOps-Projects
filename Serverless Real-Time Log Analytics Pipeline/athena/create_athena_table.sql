CREATE EXTERNAL TABLE IF NOT EXISTS log_database.app_logs (
  log_entry STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = '\n'
)
LOCATION 's3://app-log-storage-<your-id>/logs/'
TBLPROPERTIES ('has_encrypted_data'='false');
