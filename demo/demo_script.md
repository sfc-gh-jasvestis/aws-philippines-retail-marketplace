# Demo Script: Marketplace Seller Intelligence & Risk Scoring
## ~4-Minute Recorded Walkthrough
**Format**: Screen recording with voiceover
**Target**: Customer meeting / booth loop / social share
**Narrative**: "Snowflake ingests seller activity from Kinesis, builds health scores with Dynamic Tables, classifies seller risk with ML.CLASSIFICATION, and detects anomalous patterns — protecting marketplace integrity and buyer trust"
**Demo Mode**: Open app with `?demo=true` for presenter notes

---

## Two Personas

| Persona | Role | Tool | What they care about |
|---|---|---|---|
| **Bianca Gabrielle Co** | VP Marketplace Operations | React App (SPCS) | Seller quality, buyer satisfaction, marketplace GMV, counterfeit detection, refund rates |
| **Miguel Eduardo Razon** | Seller Analytics Lead | Amazon QuickSight | Seller onboarding quality, performance tiers, listing compliance, return patterns |

---

## What's Built

| Layer | Component | Detail |
|---|---|---|
| **RAW** | 6 tables | SELLERS (42000), LISTINGS (2800000), ORDERS (4500000), REVIEWS (1800000), RETURNS (340000), SELLER_METRICS (850000) |
| **CURATED** | 4 Dynamic Tables | SELLER_HEALTH_SCORE, CATEGORY_RISK_PROFILE, SELLER_TIMESERIES, MARKETPLACE_GMV |
| **ML** | ML.CLASSIFICATION + ML.ANOMALY_DETECTION | Forecasting + anomaly detection |
| **AI** | AI_CLASSIFY, AI_SENTIMENT, COMPLETE | Classification + extraction |
| **Search** | Cortex Search | 1800000 documents indexed |
| **Agent** | MARKETPLACE_INTELLIGENCE_AGENT | Semantic View + Search tools |


---

## The Story

Philippine e-commerce hit $18 billion in 2023, growing 25% annually. But rapid growth brings risk: counterfeit products, fake reviews, and policy-violating sellers erode buyer trust. A leading Philippine marketplace with 42,000 sellers needs real-time seller intelligence — not weekly spreadsheet reports that catch problems after buyers have already been burned.

---

## Script

### [0:00–0:45] EXECUTIVE COCKPIT

**Show**: Executive Cockpit tab

> "₱18.7 billion GMV this month — 42,000 active sellers across 28 categories."

**Action**: Point at ₱18.7B GMV KPI

### [0:45–1:30] SELLER RISK

**Show**: Seller Risk tab

> "ML.CLASSIFICATION identifies 4 risk factors: late delivery (32%), product mismatch (28%), fake reviews (22%), refund rate (18%)."

**Action**: Show risk factor breakdown chart

### [1:30–2:15] GMV & GROWTH

**Show**: GMV & Growth tab

> "GMV grew 25% YoY — driven by grocery (42% growth) and beauty (38% growth)."

**Action**: Show GMV trend with YoY comparison

### [2:15–3:00] ASK AI

**Show**: Ask AI tab

> "Bianca asks: 'Which category has the most counterfeit complaints?'"

**Action**: Type: 'Category with most counterfeit complaints?'

### [3:00–3:45] ARCHITECTURE & DATA

**Show**: Architecture & Data tab

> "Kinesis → Snowpipe → Dynamic Tables → ML scoring → real-time seller dashboards."

**Action**: Walk through architecture diagram


---

## Key Demo Differentiators

1. **ML.CLASSIFICATION for seller risk scoring** — Only demo using native Snowflake ML for marketplace seller risk
2. **AI_CLASSIFY + AI_SENTIMENT on reviews** — Dual AI function for fake review detection and sentiment at 1.8M scale
3. **Dynamic Tables for seller health** — Composite health score refreshing hourly without ETL orchestration
4. **ML.ANOMALY_DETECTION on seller behavior** — Detects sudden behavior changes indicating policy violations
5. **Philippine e-commerce context** — $18B market with provincial growth, mobile-first commerce, and local sellers


---

## Demo Prep Checklist

### Data Verification
- [ ] `SELECT COUNT(*) FROM MARKETPLACE_INTEL.RAW.ORDERS` → 4500000
- [ ] `SELECT COUNT(*) FROM MARKETPLACE_INTEL.RAW.REVIEWS` → 1800000
- [ ] `SELECT COUNT(*) FROM MARKETPLACE_INTEL.CURATED.SELLER_HEALTH_SCORE WHERE RISK_CATEGORY = 'HIGH'` → ~1240

### ML Model Verification
- [ ] `SELECT COUNT(*) FROM MARKETPLACE_INTEL.ML.SELLER_RISK_CLASSIFICATION_RESULTS` → 42000
- [ ] `SELECT COUNT(*) FROM MARKETPLACE_INTEL.ML.SELLER_ANOMALY_RESULTS WHERE IS_ANOMALY = TRUE` → ~67

### AI/Agent Verification
- [ ] `SELECT COUNT(*) FROM MARKETPLACE_INTEL.AI.REVIEW_SENTIMENT_SCORES` → 1800000

