##### Get Airbnb Data
- Download following datasets from https://insideairbnb.com/get-the-data/  
    - Listing
    - Reviews
    - Calendar

- Push above datasets to SQL Server database under raw schema
    ```
        # Navigate to dbt database
        use dbt;

        # Create raw schema
        create schema raw;

        # Use Import/Export wizard to push data to SQL Server database under raw schema
            [raw].[reviews]
            [raw].[listings]
            [raw].[calendar]

        # Add date columns in listings table
        
        ALTER TABLE [raw].[listings]
        ADD created_at DATETIME2, updated_at DATETIME2

        UPDATE [raw].[listings]
        SET created_at = GETDATE(), updated_at = GETDATE()

         # Add date columns in reviews table
        
        ALTER TABLE [raw].[reviews]
        ADD created_at DATETIME2, updated_at DATETIME2

        UPDATE [raw].[reviews]
        SET created_at = GETDATE(), updated_at = GETDATE()

         

    ```
