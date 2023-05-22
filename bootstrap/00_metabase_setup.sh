#!/bin/bash
set -e # exit if a command exits with a not-zero exit code

POSTGRES="psql -U postgres"

# create a shared role to read & write general datasets into postgres
echo "Creating database role: $METABASE_USER"
$POSTGRES <<-EOSQL
CREATE USER $METABASE_USER WITH
    LOGIN
    NOSUPERUSER
    NOCREATEDB
    NOCREATEROLE
    NOINHERIT
    NOREPLICATION
    PASSWORD '$METABASE_PASSWORD';
EOSQL

# create database
echo "Creating database: metabase"
$POSTGRES <<EOSQL
CREATE DATABASE metabase OWNER $METABASE_USER;
EOSQL