##### To execute dbt models
```
# This command is used to compile the models to create sql queries and execute it
dbt run
```

##### To execute dbt model to bypass incremental load and load the entire data again to the table.
```
dbt run --full-refresh 
```

##### Compile dbt models - Save compiled query to "/target/compiled" 
```
# During model execution process i.e. while executing "dbt run", DBT compiles the model sql files and save it at "/target/compiled" folder of dbt project folder "learn_dbt".
# dbt models can also be compiled and saved to "/target/compiled" folder using below command

dbt compile 
```

##### Seed data to database - Upload static data in CSV format to /seed/ folder
```
# Upload static data in CSV format to /seed/ folder of dbt project folder "learn_dbt".
dbt seed
```


##### Check Source Freshness
```
dbt source freshness
```


##### Create Table Snapshot for SCD 2
```
dbt snapshot
```


##### Run defined tests on the models
```
# Run all tests defined on all the models
dbt test 

# Run tests defined on a perticular model
dbt test --select dim_listing_and_host
```


##### Install dbt packages
```
dbt deps 
```


