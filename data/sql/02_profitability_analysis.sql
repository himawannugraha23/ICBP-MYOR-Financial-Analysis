
-- =====================================================
-- PROJECT: ICBP VS MYOR FINANCIAL ANALYSIS
-- MODULE 02: PROFITABILITY ANALYSIS
-- PERIOD: 2020-2025
-- DATABASE: GOOGLE BIGQUERY
-- =====================================================


-- QUERY 1: PROFITABILITY OVERVIEW

SELECT
    company,
    SUM(net_sales) AS total_revenue,
    SUM(gross_profit) AS total_gross_profit,
    SUM(operating_profit) AS total_operating_profit,
    SUM(profit_for_year) AS total_net_income

FROM
    `financial-analyst-515705.financial_analytics.raw_financials_clean`

GROUP BY company
ORDER BY total_net_income DESC;


-- QUERY 2: GROSS PROFIT MARGIN

SELECT
    company,
    fiscal_year,
    ROUND(
        SAFE_DIVIDE(gross_profit, net_sales) * 100,
        2
    ) AS gross_profit_margin_pct

FROM
    `financial-analyst-515705.financial_analytics.raw_financials_clean`

ORDER BY company, fiscal_year;


-- QUERY 3: OPERATING PROFIT MARGIN

SELECT
    company,
    fiscal_year,
    ROUND(
        SAFE_DIVIDE(operating_profit, net_sales) * 100,
        2
    ) AS operating_profit_margin_pct

FROM
    `financial-analyst-515705.financial_analytics.raw_financials_clean`

ORDER BY company, fiscal_year;


-- QUERY 4: NET PROFIT MARGIN

SELECT
    company,
    fiscal_year,
    ROUND(
        SAFE_DIVIDE(profit_for_year, net_sales) * 100,
        2
    ) AS net_profit_margin_pct

FROM
    `financial-analyst-515705.financial_analytics.raw_financials_clean`

ORDER BY company, fiscal_year;


-- QUERY 5: ANNUAL PROFITABILITY BENCHMARKING

SELECT
    company,
    fiscal_year,

    ROUND(
        SAFE_DIVIDE(gross_profit, net_sales) * 100,
        2
    ) AS gross_profit_margin_pct,

    ROUND(
        SAFE_DIVIDE(operating_profit, net_sales) * 100,
        2
    ) AS operating_profit_margin_pct,

    ROUND(
        SAFE_DIVIDE(profit_for_year, net_sales) * 100,
        2
    ) AS net_profit_margin_pct

FROM
    `financial-analyst-515705.financial_analytics.raw_financials_clean`

ORDER BY fiscal_year, company;
