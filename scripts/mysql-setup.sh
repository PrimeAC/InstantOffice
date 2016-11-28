#!/usr/bin/env bash

echo "CREATE DATABASE BDdev;" > test.sql
mysql -uadmin -p"$PASS" -hlocalhost < test.sql
