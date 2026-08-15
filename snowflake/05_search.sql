-- ============================================================================
-- 05_SEARCH.SQL — Cortex Search for Marketplace Seller Intelligence & Risk Scoring
-- ============================================================================
USE DATABASE MARKETPLACE_INTEL;
USE SCHEMA SEARCH;

CREATE OR REPLACE CORTEX SEARCH SERVICE SEARCH.REVIEW_SEARCH
  ON REVIEW_TEXT
  ATTRIBUTES SELLER_ID, CATEGORY, RATING, VERIFIED_PURCHASE
  WAREHOUSE = MKTPLACE_WH
  TARGET_LAG = '1 hour'
AS (
  SELECT * FROM RAW.REVIEWS
);
