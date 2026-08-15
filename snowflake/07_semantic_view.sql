-- ============================================================================
-- 07_SEMANTIC_VIEW.SQL — Semantic View for Marketplace Seller Intelligence & Risk Scoring
-- ============================================================================
USE DATABASE MARKETPLACE_INTEL;
USE SCHEMA APP;

CREATE OR REPLACE SEMANTIC VIEW APP.MARKETPLACE_ANALYTICS
  COMMENT = 'Seller health, marketplace GMV, risk scoring, and buyer satisfaction analytics'
AS
  TABLES (
    CURATED.SELLER_HEALTH_SCORE AS seller_health_score,CURATED.CATEGORY_RISK_PROFILE AS category_risk_profile,CURATED.SELLER_TIMESERIES AS seller_timeseries,CURATED.MARKETPLACE_GMV AS marketplace_gmv
  );
