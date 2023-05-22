NODE_ENV=production
N8N_EMAIL_MODE=smtp
N8N_SMTP_HOST=smtp.provider.de
N8N_SMTP_PORT=465
GENERIC_TIMEZONE="Europe/Berlin"
WEBHOOK_URL=https://project-n8n.domain.de
EXECUTIONS_PROCESS=main
NODE_FUNCTION_ALLOW_BUILTIN="*"
NODE_FUNCTION_ALLOW_EXTERNAL="lodash"
N8N_HIDE_USAGE_PAGE=true
N8N_DIAGNOSTICS_ENABLED=false
N8N_HIRING_BANNER_ENABLED=false
N8N_SMTP_USER={{ op://VAULT_NAME/n8n-smtp/username }}
N8N_SMTP_SENDERR={{ op://VAULT_NAME/n8n-smtp/username }}
N8N_SMTP_PASS={{ op://VAULT_NAME/n8n-smtp/password }}
N8N_ENCRYPTION_KEY={{ op://VAULT_NAME/$APP_ENV-n8n-encryption-key/password }}