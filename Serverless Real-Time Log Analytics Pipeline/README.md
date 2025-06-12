# Serverless Real-Time Log Analytics Pipeline on AWS

This project builds a real-time serverless log analytics pipeline using **AWS S3, Lambda, SNS, Glue, Athena, and CloudWatch**. It processes log files uploaded to S3, detects errors, sends email alerts, catalogs them with Glue, queries them using Athena, and monitors logs using CloudWatch.

---

## Architecture

```
[S3 Bucket] 
     |
     v
[Lambda Function] --(alert)--> [SNS Topic → Email]
     |
     v
[CloudWatch Logs] --(optional filter)--> [Metric/Alarm → SNS]
     |
     v
[Glue Crawler] --> [Athena Table]
```

---

## Step-by-Step Execution

### 1. S3 Setup
- Create a bucket: `app-log-storage-srivatsan`
- Enable versioning (optional)
- Folder structure: `logs/`
- **Repo Folder Used:** _none (just UI/console setup)_

### 2. SNS Setup (for Alerts)
- Create a topic: `log-error-alerts`
- Add subscription: Email → Confirm it
- **Repo Folder Used:** `sns/` (optional reference for alert content or message format)

### 3. Lambda Function (Error Detection)
- Create a function: `process-log-error-function`
- Runtime: Python 3.9
- Upload code from `lambda/process_logs.py`
- Set environment variable:
  - `SNS_TOPIC_ARN = <Your SNS Topic ARN>`
- Add trigger:
  - Source: S3 → Your bucket
  - Event type: PUT
  - Prefix: `logs/`
- Attach policies:
  - `AmazonSNSFullAccess`
  - `AmazonS3ReadOnlyAccess`
  - `CloudWatchLogsFullAccess`

### 4. Upload Sample Log
- Save the following as `sample-log.txt`:
```plaintext
2025-06-13 12:01:23 INFO App started
2025-06-13 12:01:24 ERROR Unable to connect to database
2025-06-13 12:01:25 INFO Retrying...
```
- Upload to: `s3://app-log-storage-srivatsan/logs/sample-log.txt`
- Lambda runs, error is detected, email alert is received

---

## Data Cataloging and Querying

### 5. Glue Crawler
- Create database: `log_database`
- Create crawler:
  - Source: `s3://app-log-storage-srivatsan/logs/`
  - Target: `log_database`
  - IAM Role: Use `AWSGlueServiceRole-log-crawler`
  - Run on-demand
- If schema fails, skip to Step 6
- **Repo Folder Used:** `glue/`

### 6. Athena Table (Manual if Glue fails)
```sql
CREATE EXTERNAL TABLE IF NOT EXISTS log_database.app_logs (
  log_entry STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = '\n'
)
LOCATION 's3://app-log-storage-srivatsan/logs/'
TBLPROPERTIES ('has_encrypted_data'='false');
```
- Then run:
```sql
SELECT * FROM app_logs
WHERE log_entry LIKE '%ERROR%';
```
- **Repo Folder Used:** `athena/`

---

## CloudWatch Monitoring
- Go to CloudWatch → Log groups → Lambda function
- Add metric filter:
  - Pattern: `ERROR`
  - Metric: `ErrorLogCount`
  - Namespace: `LogMonitoring`
- Set alarm if count ≥ 1 → trigger SNS
- **Repo Folder Used:** `cloudwatch/`

---

## Folder Structure Overview

```
Serverless Real-Time Log Analytics Pipeline/
├── athena/                  # Contains Athena SQL scripts (manual table creation)
├── cloudwatch/              # Optional CloudWatch metric filter/alarm setup
├── glue/                    # Glue crawler config or documentation
├── lambda/
│   └── process_logs.py      # Lambda function for error detection
├── sns/                     # SNS topic or alert format samples
```

---

## Sample Output Screenshots to Include
- S3: `sample-log.txt` uploaded
- Lambda: Triggered log in CloudWatch
- Email: SNS alert received
- Athena: Query result showing error

---

## Tech Stack
- **AWS Lambda** (Python 3.9)
- **AWS S3** (Log ingestion)
- **AWS SNS** (Error alerts)
- **AWS Glue** (Schema inference)
- **AWS Athena** (SQL log analysis)
- **AWS CloudWatch** (Log monitoring & metrics)

---

## Author
**Srivatsan G**  
Project Repository: [Cloud-DevOps-Projects](https://github.com/vatsan01/Cloud-DevOps-Projects/tree/main/Serverless%20Real-Time%20Log%20Analytics%20Pipeline)

---
