
###### Install SQL Server ODBC driver in the container - OS of the image is Debian 12
```
# Open docker container's shell
docker exec -it <container_name_or_id> /bin/bash

# Install curl and gpg
apt-get install -y curl
apt-get install -y gpg

curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg
curl https://packages.microsoft.com/config/debian/12/prod.list | tee /etc/apt/sources.list.d/mssql-release.list


apt-get update
ACCEPT_EULA=Y apt-get install -y msodbcsql18

# optional: for bcp and sqlcmd
ACCEPT_EULA=Y apt-get install -y mssql-tools18
echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
source ~/.bashrc


# optional: for unixODBC development headers
apt-get install -y unixodbc-dev

# optional: kerberos library for debian-slim distributions
apt-get install -y libgssapi-krb5-2

```
