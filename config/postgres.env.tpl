POSTGRES_USER={{ op://VAULT_NAME/$APP_ENV-db-admin/username }}
POSTGRES_PASSWORD={{ op://VAULT_NAME/$APP_ENV-db-admin/password }}
METABASE_USER={{ op://VAULT_NAME/$APP_ENV-metabase-db-user/username }}
METABASE_PASSWORD={{ op://VAULT_NAME/$APP_ENV-metabase-db-user/password }}
ARBITRARY_DB_NAME=ds_data
ARBITRARY_DATA_USER={{ op://VAULT_NAME/$APP_ENV-arbitrary-db-user/username }}
ARBITRARY_DATA_USER_PASSWORD={{ op://VAULT_NAME/$APP_ENV-arbitrary-db-user/password }}
NOCODB_USER={{ op://VAULT_NAME/$APP_ENV-nocodb-db-user/username }}
NOCODB_USER_PASSWORD={{ op://VAULT_NAME/$APP_ENV-nocodb-db-user/password }}