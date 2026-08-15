-- ============================================================================
-- 04_DYNAMIC_TABLES.SQL — Curated layer for Marketplace Seller Intelligence & Risk Scoring
-- ============================================================================
USE DATABASE MARKETPLACE_INTEL;
USE SCHEMA CURATED;

-- SELLER_HEALTH_SCORE: Composite seller score (delivery, quality, service, compliance)
-- Source: SELLERS, ORDERS, REVIEWS, RETURNS
CREATE OR REPLACE DYNAMIC TABLE CURATED.SELLER_HEALTH_SCORE
  TARGET_LAG = '5 minutes'
  WAREHOUSE = MKTPLACE_WH
AS
SELECT * FROM RAW.SELLERS;
-- TODO: Replace with actual join/aggregation logic per demo

-- CATEGORY_RISK_PROFILE: Risk metrics aggregated by product category
-- Source: LISTINGS, ORDERS, RETURNS
CREATE OR REPLACE DYNAMIC TABLE CURATED.CATEGORY_RISK_PROFILE
  TARGET_LAG = '5 minutes'
  WAREHOUSE = MKTPLACE_WH
AS
SELECT * FROM RAW.LISTINGS;
-- TODO: Replace with actual join/aggregation logic per demo

-- SELLER_TIMESERIES: Daily seller metrics for anomaly detection
-- Source: SELLER_METRICS
CREATE OR REPLACE DYNAMIC TABLE CURATED.SELLER_TIMESERIES
  TARGET_LAG = '5 minutes'
  WAREHOUSE = MKTPLACE_WH
AS
SELECT * FROM RAW.SELLER_METRICS;
-- TODO: Replace with actual join/aggregation logic per demo

-- MARKETPLACE_GMV: Real-time GMV by category, region, and channel
-- Source: ORDERS, SELLERS
CREATE OR REPLACE DYNAMIC TABLE CURATED.MARKETPLACE_GMV
  TARGET_LAG = '5 minutes'
  WAREHOUSE = MKTPLACE_WH
AS
SELECT * FROM RAW.ORDERS;
-- TODO: Replace with actual join/aggregation logic per demo

