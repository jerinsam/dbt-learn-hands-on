
      insert into "dbt"."dbo"."facr_reviews" ("review_key", "listing_id", "review_date", "reviewer_name", "review")
    (
        select "review_key", "listing_id", "review_date", "reviewer_name", "review"
        from "dbt"."dbo"."facr_reviews__dbt_tmp"
    )


  