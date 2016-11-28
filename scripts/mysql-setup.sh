#!/usr/bin/env bash

echo "CREATE DATABASE DBdev;" > test.sql
mysql -uadmin -p"$PASS" -hlocalhost < test.sql
