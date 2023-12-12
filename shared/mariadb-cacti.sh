#!/bin/bash

# Allow root login from the web machines with the password 'password123' (test purposes ofc)
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.91.121' IDENTIFIED BY PASSWORD '*A0F874BC7F54EE086FCE60A37CE7887D8B31086B' WITH GRANT OPTION; FLUSH PRIVILEGES;"	
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.91.122' IDENTIFIED BY PASSWORD '*A0F874BC7F54EE086FCE60A37CE7887D8B31086B' WITH GRANT OPTION; FLUSH PRIVILEGES;"	

# Create the cacti database and import the cacti.sql file
sudo mysqladmin --user=root create cacti
sudo mysql -u root cacti < /vagrant/cacti.sql

# Import the timezone data into the mysql database
mysql_tzinfo_to_sql /usr/share/zoneinfo | sudo mysql -u root mysql
