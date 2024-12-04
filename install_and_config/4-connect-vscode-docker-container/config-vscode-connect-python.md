
##### Connect VS Code to Docker Container's Python
- **Dev Containers** - Install this extension, this allows you to connect to a Docker container from VS Code
- Go to command pallte and type **"Dev Containers: Attach to Running Containers"** to attach running container to VS Code
  - It may ask to install docker in WSL, even though its installed but press install.
- Select the docker container and a new VS code window will open.
- Click on Open Folder and select the folder of the python project you want to work on.
  - Since Host Folder is mounted with docker (details in 2-dbt-install folder) , select that folder so that python files created in docker can be copied to host machine
