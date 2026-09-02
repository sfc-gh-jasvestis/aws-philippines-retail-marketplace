# Marketplace Seller Intelligence & Risk Scoring

**Philippines - Retail & E-Commerce**
Use case: Marketplace Seller Intelligence

> Philippine e-commerce grew 25% to $18B — Snowflake builds real-time seller health scores with Dynamic Tables, classifies risk with ML, detects anomalous behavior, and protects marketplace integrity at scale.

## Why Snowflake

Snowflake ingests seller activity from Kinesis, builds health scores with Dynamic Tables, classifies seller risk with ML.CLASSIFICATION, and detects anomalous patterns — protecting marketplace integrity and buyer trust

- **ML.CLASSIFICATION for seller risk scoring** - Only demo using native Snowflake ML for marketplace seller risk
- **AI_CLASSIFY + AI_SENTIMENT on reviews** - Dual AI function for fake review detection and sentiment at 1.8M scale
- **Dynamic Tables for seller health** - Composite health score refreshing hourly without ETL orchestration
- **ML.ANOMALY_DETECTION on seller behavior** - Detects sudden behavior changes indicating policy violations
- **Philippine e-commerce context** - $18B market with provincial growth, mobile-first commerce, and local sellers

## What is deployed

| | |
|---|---|
| Database | `PH_RETAIL_MARKETPLACE` |
| Service | `PH_RETAIL_MARKETPLACE_APP` |
| Compute pool | `SEA_DEMOS_PHILIPPINES_POOL` |
| Dimension table | `RAW.SELLERS` (20 rows) |
| Fact table | `RAW.ORDERS` (250,000 rows, 90 days) |
| Curated layer | `CURATED.PERFORMANCE_SUMMARY`, `CURATED.TREND_ANALYSIS`, `CURATED.KPI_SUMMARY` |
| Currency | PHP (₱) |

Regions in play: Metro Manila, Cebu, Davao, Pampanga, Iloilo
Segments: Power Seller, Growing Seller, New Seller, At-Risk Seller

Dynamic tables are created suspended and refreshed on demand:

```bash
./refresh_demo_data.sh PH_RETAIL_MARKETPLACE
```

## KPI cards

Every card below is served live from `CURATED.KPI_SUMMARY`. The app keeps the
original literal as a fallback, so it still renders if Snowflake is unreachable.

| Card | Value | Backed by |
|---|---|---|
| GMV (MTD) | `₱8.4B` | total across Sellers |
| Active Sellers | `84K` | total across Sellers |
| Buyer Conversion | `3.2%` | average per event |
| Orders (MTD) | `12.4M` | total across Sellers |
| Avg Order Value | `₱680` | average per event |
| Repeat Purchase | `34%` | average per event |
| Cart Abandonment | `72%` | average per event |


## Demo flow

1. Executive Cockpit
2. Seller Risk
3. GMV & Growth
4. Ask AI
5. Architecture & Data

## Talking points

- **₱18.7B** - monthly GMV across 42,000 sellers
- **1,240 sellers** - classified as HIGH risk
- **67 sellers** - flagged for anomalous behavior this week
- **14.8%** - electronics return rate (2x platform average)
- **1.8M reviews** - analyzed by AI_SENTIMENT + AI_CLASSIFY
- **25% YoY** - GMV growth rate

## Business impact

- Philippine e-commerce market reached $18B in 2023 with 25% YoY growth (Google-Temasek SEA Report)
- Marketplace fraud costs sellers and platforms $48B globally in 2023 (Juniper Research)
- AI-powered seller monitoring improves buyer satisfaction 20-30% (McKinsey Retail)
- Real-time risk scoring reduces counterfeit listings by 40-60% (Forrester)

---
Generated from `generator/demo_specs/aws-philippines-retail-marketplace.json`. Do not hand-edit: run
`python3 generator/gen_repo_docs.py aws-philippines-retail-marketplace` instead.
