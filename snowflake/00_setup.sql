-- Generated from generator/demo_specs/aws-philippines-retail-marketplace.json
-- Regenerate with: python3 generator/gen_repo_docs.py aws-philippines-retail-marketplace
-- This is the schema that is actually deployed for PH_RETAIL_MARKETPLACE.

-- PH_RETAIL_MARKETPLACE  (Marketplace Seller Intelligence & Risk Scoring)
-- generated from generator/demo_specs/aws-philippines-retail-marketplace.json - do not hand-edit
CREATE DATABASE IF NOT EXISTS PH_RETAIL_MARKETPLACE;
CREATE SCHEMA IF NOT EXISTS PH_RETAIL_MARKETPLACE.RAW;
CREATE SCHEMA IF NOT EXISTS PH_RETAIL_MARKETPLACE.CURATED;
CREATE SCHEMA IF NOT EXISTS PH_RETAIL_MARKETPLACE.APP;
USE DATABASE PH_RETAIL_MARKETPLACE;

-- 5 real regions; entity names carry their region so the two always agree
