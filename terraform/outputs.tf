output "main_url" {
  value = module.main_record.record_name
}

output "traefik_url" {
  value = module.traefik_record.record_name
}

output "nocodb_url" {
  value = module.nocodb_record.record_name
}

output "n8n_url" {
  value = module.n8n_record.record_name
}

output "server_ipv4_address" {
  value = module.server.ipv4_address
}
