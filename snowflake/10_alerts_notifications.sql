-- ============================================================================
-- 10_ALERTS_NOTIFICATIONS.SQL — Alerts for Marketplace Seller Intelligence & Risk Scoring
-- ============================================================================
USE DATABASE MARKETPLACE_INTEL;
USE SCHEMA APP;

-- Notification integration (email)
CREATE OR REPLACE NOTIFICATION INTEGRATION aws_philippines_retail_marketplace_EMAIL_INT
  TYPE = EMAIL
  ENABLED = TRUE
  ALLOWED_RECIPIENTS = ('jonathan.asvestis@snowflake.com');

-- Alert: SELLER_RISK_ALERT
CREATE OR REPLACE ALERT APP.SELLER_RISK_ALERT
  WAREHOUSE = MKTPLACE_WH
  SCHEDULE = '5 MINUTE'
  COMMENT = 'High-volume seller flagged as high risk'
IF (EXISTS (
  SELECT 1 FROM CURATED.SELLER_HEALTH_SCORE
  WHERE 1=1 -- Condition: RISK_CATEGORY = 'HIGH' AND ORDER_VOLUME > 100/week
))
THEN
  CALL SYSTEM$SEND_EMAIL(
    'aws_philippines_retail_marketplace_EMAIL_INT',
    'jonathan.asvestis@snowflake.com',
    '[ALERT] Marketplace Seller Intelligence & Risk Scoring: High-volume seller flagged as high risk',
    'High-volume seller flagged as high risk'
  );

ALTER ALERT APP.SELLER_RISK_ALERT RESUME;

-- Alert: FAKE_REVIEW_ALERT
CREATE OR REPLACE ALERT APP.FAKE_REVIEW_ALERT
  WAREHOUSE = MKTPLACE_WH
  SCHEDULE = '5 MINUTE'
  COMMENT = 'Potential fake review activity detected'
IF (EXISTS (
  SELECT 1 FROM CURATED.SELLER_HEALTH_SCORE
  WHERE 1=1 -- Condition: FAKE_REVIEW_PCT > 20% for any seller
))
THEN
  CALL SYSTEM$SEND_EMAIL(
    'aws_philippines_retail_marketplace_EMAIL_INT',
    'jonathan.asvestis@snowflake.com',
    '[ALERT] Marketplace Seller Intelligence & Risk Scoring: Potential fake review activity detected',
    'Potential fake review activity detected'
  );

ALTER ALERT APP.FAKE_REVIEW_ALERT RESUME;

