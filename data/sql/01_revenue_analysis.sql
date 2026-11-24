
-- ==================================================
-- PROJECT: ICBP vs MYOR FINANCIAL ANALYSIS
-- MODULE 01: REVENUE ANALYSIS
-- DATABASE: GOOGLE BIGQUERY
-- PERIOD: 2020-2025
-- ==================================================


-- QUERY 1: TOTAL REVENUE COMPARISON

SELECT
    company,
    SUM(net_sales) AS total_revenue
FROM
    `financial-analyst-515705.financial_analytics.raw_financials_clean`
GROUP BY
    company
ORDER BY
    total_revenue DESC;


-- QUERY 2: ANNUAL REVENUE TREND

SELECT
    company,
    fiscal_year,
    net_sales
FROM
    `financial-analyst-515705.financial_analytics.raw_financials_clean`
ORDER BY
    company,
    fiscal_year;


-- QUERY 3: REVENUE GROWTH ANALYSIS

WITH revenue_data AS (
    SELECT
        company,
        fiscal_year,
        net_sales,

        LAG(net_sales) OVER (
            PARTITION BY company
            ORDER BY fiscal_year
        ) AS previous_sales

    FROM
        `financial-analyst-515705.financial_analytics.raw_financials_clean`
)

SELECT
    company,
    fiscal_year,
    net_sales,
    previous_sales,

    ROUND(
        SAFE_DIVIDE(
            net_sales - previous_sales,
            previous_sales
        ) * 100,
        2
    ) AS revenue_growth_pct

FROM revenue_data
ORDER BY
    company,
    fiscal_year;

