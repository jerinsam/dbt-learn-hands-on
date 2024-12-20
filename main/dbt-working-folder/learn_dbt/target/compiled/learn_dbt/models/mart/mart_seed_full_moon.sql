


WITH fct_reviews AS (
SELECT * FROM "dbt"."dbo"."facr_reviews"
),

full_moon_dates AS (
SELECT * FROM "dbt"."dbo"."seed_full_moon_dates"
)

SELECT
r.*,
CASE
WHEN fm.full_moon_date IS NULL THEN 'not full moon'
ELSE 'full moon'
END AS is_full_moon
FROM
fct_reviews r
LEFT JOIN full_moon_dates fm
ON CAST(r.review_date as DATE) = CAST(DATEADD(DAY, 1, fm.full_moon_date) as DATE)