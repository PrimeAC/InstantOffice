#!/usr/bin/env bash

echo "CREATE DATABASE BDdev;" | mysql -uadmin -p"$PASS" -hlocalhost

mysql -uadmin -p"$PASS" -hlocalhost BDdev < /sql/schema.sql
mysql -uadmin -p"$PASS" -hlocalhost BDdev < /sql/storedprocstriggers.sql
mysql -uadmin -p"$PASS" -hlocalhost BDdev < /sql/populate.sql
mysql -uadmin -p"$PASS" -hlocalhost BDdev < /sql/dwSchema.sql
mysql -uadmin -p"$PASS" -hlocalhost BDdev < /sql/populateDW.sql
