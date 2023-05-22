# Configure the Cloudflare Provider
provider "cloudflare" {
  api_token = "${var.cloudflare_api_token}"
}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = "${var.hcloud_token}"
}