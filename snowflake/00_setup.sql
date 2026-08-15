-- ============================================================================
-- Marketplace Seller Intelligence & Risk Scoring
-- Philippine e-commerce grew 25% to $18B — Snowflake builds real-time seller health scores with Dynamic Tables, classifies risk with ML, detects anomalous behavior, and protects marketplace integrity at scale.
-- ============================================================================
USE ROLE ACCOUNTADMIN;
CREATE DATABASE IF NOT EXISTS MARKETPLACE_INTEL;
CREATE WAREHOUSE IF NOT EXISTS MKTPLACE_WH WAREHOUSE_SIZE = 'MEDIUM' AUTO_SUSPEND = 120 AUTO_RESUME = TRUE;
USE DATABASE MARKETPLACE_INTEL;
CREATE SCHEMA IF NOT EXISTS RAW;
CREATE SCHEMA IF NOT EXISTS CURATED;
CREATE SCHEMA IF NOT EXISTS ML;
CREATE SCHEMA IF NOT EXISTS AI;
CREATE SCHEMA IF NOT EXISTS SEARCH;
CREATE SCHEMA IF NOT EXISTS APP;

USE WAREHOUSE MKTPLACE_WH;
