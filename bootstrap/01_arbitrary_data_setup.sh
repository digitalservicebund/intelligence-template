#!/bin/bash
set -e # exit if a command exits with a not-zero exit code

POSTGRES="psql -U postgres"

# create a shared role to read & write general datasets into postgres
echo "Creating database role: $ARBITRARY_DATA_USER"
$POSTGRES <<-EOSQL
CREATE USER $ARBITRARY_DATA_USER WITH
    LOGIN
    NOSUPERUSER
    NOCREATEDB
    NOCREATEROLE
    NOINHERIT
    NOREPLICATION
    PASSWORD '$ARBITRARY_DATA_USER_PASSWORD';
EOSQL

# create database
echo "Creating database: $ARBITRARY_DB_NAME"
$POSTGRES <<EOSQL
CREATE DATABASE $ARBITRARY_DB_NAME OWNER $ARBITRARY_DATA_USER;
EOSQL