variable "cloudflare_api_token" {
  type = string
  description = "The API token for the Cloudflare account."
}

variable "hcloud_token" {
  type = string
  description = "value of the Hetzner Cloud API token"
}

variable "stack_name" {
  type    = string
  default = "REPLACE_STACK_NAME"
}

variable "domain_name" {
  type    = string
  default = "REPLACE_DOMAIN.de"
}

variable "cloudflare_zone_id" {
  type    = string
  default = "REPLACE_CLOUDFLARE_ZONE_ID"
}

variable "ssh_key_ids" {
  type = list(string)
  default = ["REPLACE_SSH_KEY_ID"]
}

variable "ssh_key_path" {
  type = string
  default = "~/.ssh/PATH_TO_SSH_KEY"
}