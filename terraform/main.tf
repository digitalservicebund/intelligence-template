module "server" {
  source        = "github.com/digitalservicebund/terraform-modules//hetzner-instance?ref=88f0df1804fcb2b94556acdaecb2b4df4fe1469e"
  stack_name    = var.stack_name
  ssh_key_ids   = var.ssh_key_ids
  ssh_key_path  = var.ssh_key_path
  userdata_path = "userdata.sh"
}

module "main_record" {
  source     = "github.com/digitalservicebund/terraform-modules//cloudflare-record?ref=88f0df1804fcb2b94556acdaecb2b4df4fe1469e"
  zone_id    = var.cloudflare_zone_id
  name       = "${var.stack_name}.${var.domain_name}"
  value      = module.server.ipv4_address
  dependencies = [module.server]
}

module "traefik_record" {
  source     = "github.com/digitalservicebund/terraform-modules//cloudflare-record?ref=88f0df1804fcb2b94556acdaecb2b4df4fe1469e"
  zone_id    = var.cloudflare_zone_id
  name       = "${var.stack_name}-traefik.${var.domain_name}"
  value      = module.server.ipv4_address
  dependencies = [module.server]
}

module "nocodb_record" {
  source     = "github.com/digitalservicebund/terraform-modules//cloudflare-record?ref=88f0df1804fcb2b94556acdaecb2b4df4fe1469e"
  zone_id    = var.cloudflare_zone_id
  name       = "${var.stack_name}-nocodb.${var.domain_name}"
  value      = module.server.ipv4_address
  dependencies = [module.server]
}

module "n8n_record" {
  source     = "github.com/digitalservicebund/terraform-modules//cloudflare-record?ref=88f0df1804fcb2b94556acdaecb2b4df4fe1469e"
  zone_id    = var.cloudflare_zone_id
  name       = "${var.stack_name}-n8n.${var.domain_name}"
  value      = module.server.ipv4_address
  dependencies = [module.server]
}

resource "null_resource" copyBootstrapFiles {
  provisioner "file" {
    source      = "../bootstrap"
    destination = "/root/bootstrap"

    connection {
      host     = "${module.server.ipv4_address}"
      type     = "ssh"
      user     = "root"
      agent    = true
      timeout  = "2m"
      private_key = file("${var.ssh_key_path}")
    }
  }

  depends_on = [
    module.server
  ]
}

resource "null_resource" copyPostgresConfig {
  provisioner "file" {
    source      = "../config/postgres.conf"
    destination = "/root/postgres.conf"

    connection {
      host     = "${module.server.ipv4_address}"
      type     = "ssh"
      user     = "root"
      agent    = true
      timeout  = "2m"
      private_key = file("${var.ssh_key_path}")
    }
  }

  depends_on = [
    module.server
  ]
}