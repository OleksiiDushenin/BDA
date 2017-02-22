echo "Perform sqoop import from MySQL ..."
# Incremental import of users from MySQL to Hive
sqoop job --exec import-bda-users
echo "Sqoop import from SQL performed."

echo "Configure MySQL temporary tables ..."
# sqoop doesn't support delete operation,
# so records for users without stats and unknown users in stats will be put in temp table with target table rotation
mysql -uroot -pcloudera task2 < clean_temp.sql;
mysql -uroot -pcloudera task2 < create_temp_tables.sql;
echo "MySQL temporary tables configured."


echo "Perform Hive queries ..."
# clean temporary Hive tables and perform queries
hive -f clean_hive
hive -f exec_hive_queries
echo "Hive queries performed."

echo "Perform sqoop export to MySQL ..."
# export data from Hive to MySQL
sqoop job --exec export-user-records
sqoop job --exec export-user-without-stats
sqoop job --exec export-no-user-for-stats
echo "Sqoop export to MySQL performed"

echo "Perform MySQL operation ..."
# swap MySQL target tables
mysql -uroot -pcloudera task2 < swap_tables.sql;
echo "MySQL operations performed."

echo "Clean  ..."
# Clean temporary data
hive -f clean_hive
mysql -uroot -pcloudera task2 < clean_temp.sql;
echo "Cleaned."

