-- ============================================================================
-- 08_AGENT.SQL — Cortex Agent for Marketplace Seller Intelligence & Risk Scoring
-- ============================================================================
USE DATABASE MARKETPLACE_INTEL;
USE SCHEMA APP;

CREATE OR REPLACE CORTEX AGENT APP.MARKETPLACE_INTELLIGENCE_AGENT
  COMMENT = 'Marketplace Seller Intelligence & Risk Scoring AI Assistant'
  MODEL = 'claude-opus-4-8'
  TOOLS = (
    SEMANTIC_VIEW_TOOL(SEMANTIC_VIEW => 'MARKETPLACE_INTEL.APP.MARKETPLACE_ANALYTICS'),    CORTEX_SEARCH_TOOL(CORTEX_SEARCH_SERVICE => 'MARKETPLACE_INTEL.SEARCH.REVIEW_SEARCH', TOOL_DESCRIPTION => 'Search documents for Retail & E-Commerce information')
  )
  SYSTEM_PROMPT = 'You are the Marketplace Intelligence Agent for a Philippine e-commerce platform with 42K sellers, 2.8M listings, and 4.5M monthly orders.';
