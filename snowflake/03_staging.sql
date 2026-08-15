-- ============================================================================
-- 03_STAGING.SQL — Generate synthetic data for Marketplace Seller Intelligence & Risk Scoring
-- Country: PHILIPPINES | Currency: PHP
-- ============================================================================
USE DATABASE MARKETPLACE_INTEL;
USE SCHEMA RAW;

-- Data generation scripts are demo-specific.
-- See the handcrafted SQL in the aws-malaysia-semiconductor-yield demo for
-- the full pattern: GENERATOR + UNIFORM + LATERAL for distribution,
-- Cortex Complete for text generation, engineered key demo numbers.

-- Target row counts:
-- SELLERS: 42,000 rows — Active marketplace sellers with onboarding data
-- LISTINGS: 2,800,000 rows — Product listings across all categories
-- ORDERS: 4,500,000 rows — 60 days of order transactions
-- REVIEWS: 1,800,000 rows — Buyer reviews and ratings
-- RETURNS: 340,000 rows — Return and refund records with reasons
-- SELLER_METRICS: 850,000 rows — Daily seller performance metrics from Kinesis
