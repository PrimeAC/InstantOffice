#!/usr/bin/env bash

echo "CREATE DATABASE BDdev;" > test.sql
mysql -uadmin -p"$PASS" -hlocalhost < test.sql

mysql -uadmin -p"$PASS" -hlocalhost BDdev < /sql/schema.sql
mysql -uadmin -p"$PASS" -hlocalhost BDdev < /sql/storedprocstriggers.sql
mysql -uadmin -p"$PASS" -hlocalhost BDdev < /sql/populate.sql
