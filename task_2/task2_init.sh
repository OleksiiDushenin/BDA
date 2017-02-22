#!/bin/bash


echo "Configure MySQL ..."
# Create initial MySQL database, required tables, populate database with users
mysql -uroot -pcloudera < init_db.sql;
mysql -uroot -pcloudera task2 < rid_bda_users.sql;
echo "MySQL configured."

echo "Configure Hive ..."
# Create table for users in Hive
hive -f init_hive
echo "Hive configured."

echo "Create sqoop jobs ..."

sqoop job --delete import-bda-users
sqoop job --delete export-user-records
sqoop job --delete export-user-without-stats
sqoop job --delete export-no-user-for-stats

sqoop job --create import-bda-users -- import --options-file sqoop-common --options-file sqoop-import
sqoop job --create export-user-records -- export --options-file sqoop-common --options-file sqoop-export-user-records
sqoop job --create export-user-without-stats -- export --options-file sqoop-common --options-file sqoop-export-user-without-stats
sqoop job --create export-no-user-for-stats -- export --options-file sqoop-common --options-file sqoop-export-no-user-for-stats

echo "Sqoop jobs created."

