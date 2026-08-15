-- ============================================================================
-- 11_TASK_PIPELINE.SQL — Task DAG for Marketplace Seller Intelligence & Risk Scoring
-- ============================================================================
USE DATABASE MARKETPLACE_INTEL;
USE SCHEMA APP;

CREATE OR REPLACE TASK APP.TASK_INGEST_METRICS
  WAREHOUSE = MKTPLACE_WH
  SCHEDULE = 'USING CRON 0 */1 * * * UTC'
  COMMENT = 'Ingest latest seller metrics from Kinesis'
AS
  SELECT 1; -- Replace with actual refresh logic

CREATE OR REPLACE TASK APP.TASK_SCORE_SELLERS
  WAREHOUSE = MKTPLACE_WH
  AFTER APP.TASK_INGEST_METRICS
  COMMENT = 'Refresh seller health scores and risk classification'
AS
  SELECT 1; -- Replace with actual refresh logic

CREATE OR REPLACE TASK APP.TASK_DETECT_ANOMALIES
  WAREHOUSE = MKTPLACE_WH
  AFTER APP.TASK_SCORE_SELLERS
  COMMENT = 'Run anomaly detection on seller behavior patterns'
AS
  SELECT 1; -- Replace with actual refresh logic

ALTER TASK APP.TASK_DETECT_ANOMALIES RESUME;
ALTER TASK APP.TASK_SCORE_SELLERS RESUME;
ALTER TASK APP.TASK_INGEST_METRICS RESUME;
