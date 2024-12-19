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

##### Generate Documentation
```
#Documentation details compiled by command dbt docs generate is stored in /target/ folder of dbt project “learn_dbt”
dbt docs generate 
```
##### Start Documentation Server at localhost:8080
```
# Below command will work only if docker container is exposed to port 8080 with “-p 8080:8080” flag while stating the container, refer /install_and_config/2-dbt-install/script-dockerfile-execute.md 

# 0.0.0.0 is used to bind the server to all available network interfaces.

dbt docs serve --host 0.0.0.0 --port 8080 
```

