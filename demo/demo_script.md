# Philippines Marketplace Seller Health

**Philippines - Online Marketplace**
Use case: seller health, order integrity, cancellations and seller document controls

> Seller health monitoring for 48 fictional sellers on a fictional Philippine online marketplace, shipping from Quezon City, Cebu City, Davao City, Iloilo City and Cagayan de Oro. The demo covers dynamic tables, an order-cancellation classifier evaluated on a time-based holdout, an order-issue forecast, return rate anomaly detection, a Cortex Agent that cites SOPs, a live order feed with an alert, and an SPCS app.

## Why Snowflake

- **Dynamic tables** turn seller-day rows into orders, order issues, cancelled orders, late deliveries and stock sync compliance; `run_core.py` reconciles them against RAW on every build
- **Order-cancellation classification** gives each seller a next-7-day probability, evaluated on a time-based holdout
- **Order-issue forecast** projects 14 days of marketplace-wide order issues with prediction intervals, to plan buyer support cover
- **Grounded AI**: the Cortex Agent (Analyst over a semantic view, Search over SOPs) shows the SQL it ran and the SOPs it cited
- **Live orders**: a native simulator (Snowflake only) or Firehose, S3 and Snowpipe (AWS build), feeding an alert and email

## What is built

| | |
|---|---|
| Dimension table | `RAW.SELLERS` (48 rows) |
| Fact table | `RAW.SELLER_DAILY` (4,320 seller-days, 90 days) |
| Curated layer | `CURATED.KPI_SUMMARY`, `PERFORMANCE_SUMMARY`, `ISSUE_SUMMARY`, `TREND_ANALYSIS` |
| ML | `ML.CANCEL_RISK_SCORES`, `ML.CANCEL_RISK_HOLDOUT_METRICS`, `ML.ISSUE_FORECAST`, `ML.RETURN_RATE_ANOMALIES` |

Currency: PHP. Cities: Quezon City, Cebu City, Davao City, Iloilo City, Cagayan de Oro.
Categories: Fashion, Electronics, Home and living, Health and beauty, Groceries.

## KPI cards (live from `CURATED.KPI_SUMMARY`; no fallback values)

| Card | Value from the seeded data |
|---|---|
| Clean Order Rate | 99.90% |
| Order Issues Raised | 819 |
| Cancelled Orders | 279 |
| Issue Cancellation Rate | 34.1% |
| Late Deliveries | 122 |
| GMV (PHP M) | 1,782 |
| Orders Processed | 807,700 |
| Stock Sync Compliance | 73.6% |
| Sellers Monitored | 48 |
| Compliance Document Coverage | 50.4% |
| Compliance Documents Pending | 27 |

Values are synthetic. The data is HASH-seeded, so a rebuild reproduces them; dates are relative to the build day.

## Demo flow

1. Executive Cockpit: KPI cards, daily order issues against cancelled orders, issues and cancellations by issue type, and the seller table
2. Predictive: holdout metrics, risk bands, the 14-day order-issue forecast and return rate anomalies
3. Controls: stock sync compliance, seller document coverage and pending documents, stock sync compliance against cancelled orders, then the action memo
4. Live Orders: run `CALL APP.SIMULATE_ORDERS(20)` (Snowflake only) or `python aws/publish_orders.py --count 20` (AWS build), then `EXECUTE ALERT APP.LIVE_ORDER_ALERT`, and show the alert log and email
5. Ask AI: the Cortex Agent answers metric questions through the semantic view, cites SOPs from Cortex Search and shows its SQL
6. QuickSight (AWS build): the same Snowflake tables through DIRECT_QUERY
7. Architecture: both builds side by side

## Talking points

- 99.90% of orders reach buyers without an issue. The 819 order issues are where the trust team spends its time, and a third of them (34.1%) end as cancelled orders.
- Item not as described is the biggest source of cancelled orders (78 of 213 issues). The weather-related courier disruptions in Cebu City and Davao City hit every seller in the city on one day and were all resolved.
- Iloilo City sellers have the most cancelled orders (69); Cagayan de Oro has the fewest (41).
- On a time-based holdout the risk model reaches precision 0.56 and recall 0.61 at 0.5, against a 0.28 base rate. Use it to decide who gets a seller health review first, not as a verdict on a seller.
- Weather-related courier disruptions are left out of model training because the seller did not cause them.

## Business impact

Use only the sourced references in `README.md` (Business Impact).
