# Hive, Sqoop

## Task

1. `social` table should be presented in Hive (Task 1).
2. Import `rid_bda_users.sql` table to MySQL.
3. Find number of statistic records for each user.
4. Find users who doesn't have statistic records.
5. Find users who have statistics data but `rid_bda_users.sql` doesn't have them.

## Flow
1. Import data from `rid_bda_users.sql` MySQL table to Hive (incremental).
2. Find required data in Hive.
3. Export *Point 3 in task* to Hive (incremental).
4. Export *Point 4 in task* to Hive (full, table swap).
5. Export *Point 5 in task* to Hive (full, table swap).

## Execution
1. `social` table should be presented in Hive (Task 1).
2. ./task2_init.sh.
3. ./task2_exec.sh. (Can be used in cron).

## Configuration

### /usr/lib/sqoop/conf/sqoop-site.xml

```xml
  <property>
    <name>sqoop.metastore.client.record.password</name>
    <value>true</value>
    <description>If true, allow saved passwords in the metastore.
    </description>
  </property>
```


