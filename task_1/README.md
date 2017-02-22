# Flume

## Task

Set up Flume process which will get files as stream from port and:
1. Put data to HDFS according to receiving timestamp in 100 records buckets.
2. Put data to Hive in ORC.
3. Convert to AVRO and put to HDFS. 

## Execution
1. sudo rm -rf /tmp/flume/*
2. hadoop fs -rmr /user/cloudera/flume/task
3. hive -f /home/cloudera/Documents/bigdata/flume_adreport.sql
4. flume-ng agent --conf ./conf/ -f /usr/lib/flume-ng/conf/flume-hometask.conf -Dflume.root.logger=DEBUG,console -n flume_home_task
5. ./task1-runer.sh



