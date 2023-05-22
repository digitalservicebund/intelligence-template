#!/bin/bash
set -e # exit immediately if a command exits with a non-zero status.

POSTGRES="psql -U postgres"

# create a shared role to read & write general datasets into postgres
echo "Creating database role: $NOCODB_USER"
$POSTGRES <<-EOSQL
CREATE USER $NOCODB_USER WITH
    LOGIN
    NOSUPERUSER
    NOCREATEDB
    NOCREATEROLE
    NOINHERIT
    NOREPLICATION
    PASSWORD '$NOCODB_USER_PASSWORD';
EOSQL

# create database for superset
echo "Creating database: nocodb_data"
$POSTGRES <<EOSQL
CREATE DATABASE nocodb_data OWNER $NOCODB_USER;
EOSQL