#!/bin/bash

set +ex

# $HIVE_HOME/bin/schematool --verbose -initSchema -dbType mysql -userName root -passWord secret123321$% -url jdbc:mysql://metastore-db:3306/metastore_db?createDatabaseIfNotExist=true
# $HIVE_HOME/hcatalog/sbin/hcat_server.sh start &

# sleep 10

$HIVE_HOME/bin/hiveserver2 --hiveconf hive.root.logger=Info,console &

/usr/bin/tail -f /dev/null