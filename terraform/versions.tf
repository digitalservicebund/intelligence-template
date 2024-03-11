terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.44.1"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.26.0"
    }
  }
  required_version = ">= 1.3.9"
}