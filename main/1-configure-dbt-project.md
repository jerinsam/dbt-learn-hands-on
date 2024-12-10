##### Installation 
- Installation steps of dbt in a docker container, connecting VS Code to the container and installing SQL Server ODBC driver in the container can be found in the folder **./install_and_config/**

##### (Optional) Create a python virtual environment in the docker container and activate it
- ###### Open container's shell
    ```
    docker exec -it <container_name_or_id> /bin/bash
    ```
- ###### Install python virtual environment package
    ```
    pip install virtualenv
    ```
- ###### Create a new virtual environment
    ```
    # Navigate to the working directory 
    cd /usr/local/app/dbt-working-folder

    # Create virtual environment
    virtualenv venv

    # Activate newly created virtual environment
    . venv/bin/activate

    ```

###### Create dbt folder structure

- ###### Create dbt config/ profile folder
    ```
    mkdir ~/.dbt
    ```

- ###### Initilize dbt project and configure the DB (SQL Server) configuration, This DB is used for all the dbt transformations
    ```
    # Execute command syntax - dbt init <project-name> and select the processing database and configure

    dbt init learn_dbt

    # After successful execution of the script - 
    # - Connection profile will be cerated at "/root/.dbt/profiles.yml" 
    # - Project folder will be created at the working directory, name of the project folder will be the name mentioned in the dbt init command, In this case it is "learn_dbt" and full path is "/usr/local/app/dbt-working-folder/learn_dbt"
   
    ```

    - Since host machine folder "/main/dbt-working-folder/" is mounted with container at working directory location "/usr/local/app/dbt-working-folder/", therefore dbt project folder "learn_dbt", created in previous step, which is present in the working directory, can be accessed from Host Machine as well and any modification done in file present in Host Machine will be replicated to container as well and vice versa. 


- ###### Test dbt DB (SQL Server) Connection
    ```
    # Following command is used to test the DB connection, which is configured in the previous step.
    # Navigate to the dbt project folder and execute dbt debug command

    cd ./learn_dbt/

    dbt debug

    ```
- ###### dbt debug ODBC ERROR - Update DB connection profile at /root/.dbt/profiles.yml 
    - If Test connection fails due to invalid configuration then update the DB connection configuration in the profiles.yml file located at **/root/.dbt/profiles.yml**
    - Refer sample connection configuration yaml file at host machine **/main/dbt-working-folder/dbt-sql-server-profile.yml** 
    - Since folder **/main/dbt-working-folder/** is mounted with container at location **/usr/local/app/dbt-working-folder/**, therefore sample configuration file can be accessed in container at **/usr/local/app/dbt-working-folder/dbt-sql-server-profile.yml**
    - Copy contant of **/usr/local/app/dbt-working-folder/dbt-sql-server-profile.yml** to **/root/.dbt/profiles.yml** using below script

        ```
        cat /usr/local/app/dbt-working-folder/dbt-sql-server-profile.yml > /root/.dbt/profiles.yml
        ```
    
    - After updating DB connection profile **/root/.dbt/profiles.yml** then navigate to the dbt project folder and execute dbt debug command
        ```
        cd ./learn_dbt/

        dbt debug
        ```

- ###### Clean dbt project folder
    - Delete Example folder
        - Navigate to dbt project folder in the container.
            ```
            cd /usr/local/app/dbt-working-folder/learn_dbt
            ```
        - Under models folder, delete example folder. This can also be deleted from host machine as well since both host machine and container are mounted so deleting folder and files will be reflected in both locations.

    - Update dbt project yaml file
        - Access project configuration file "dbt_project.yml" in dbt project folder in the container and delete **"example: +materialized: view"** section under models tree of the yaml file.

        - **Note** - **dbt_project.yml** is the dbt project config file, it contains all the project configuration settings, including the models, sources, and macros.