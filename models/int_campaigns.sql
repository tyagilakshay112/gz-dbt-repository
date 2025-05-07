with all_ads as (
    SELECT 
        date_date,
        ads_cost,
        impression,
        click
    FROM {{ ref('stg_raw__adwords') }}
    UNION ALL
    SELECT
        date_date,
        ads_cost,
        impression,
        click
    FROM {{ ref('stg_raw__bing') }}
    UNION ALL
    select
        date_date,
        ads_cost,
        impression,
        click
    FROM {{ ref('stg_raw__criteo') }}
    UNION ALL
    SELECT 
        date_date,
        ads_cost,
        impression,
        click
    FROM {{ ref('stg_raw__facebook') }}
),

aggregated_ads as (
    SELECT
        date_date,
        SUM(ads_cost) AS ads_cost,
        SUM(impression) AS ads_impression,
        SUM(click) AS ads_click
    FROM all_ads
    GROUP BY date_date
)

SELECT *
FROM aggregated_ads
