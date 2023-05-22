# intelligence-template

Simple FOSS stack for data management, automation and visualization

## Components

This stack builds up a stack consisting of the following services:

- Metabase (Visualization)
- NocoDB (Data Management)
- N8N (Automation)
- traefik (Routing Proxy with Dashboard)

## Tooling

- Terraform is used to provision the instance on Hetzner
- Docker will be installed on the instance
- stack credentials come from 1password
- The KPI Stack is deployed with docker compose, the following things are part of the compose file
  - PostegreSQL
  - Autoheal (monitors and restarts containers)
  - Traefik (proxy to the public services)
  - Metabase
  - NocoDB
  - n8n

It uses the following [terraform modules](https://github.com/digitalservicebund/terraform-modules):

- [cloudflare-record](https://github.com/digitalservicebund/terraform-modules/tree/main/cloudflare-record)
- [hetzner-instance](https://github.com/digitalservicebund/terraform-modules/tree/main/hetzner-instance)

## Example

Use the [example](./example) folder for a reference

You need an API token for Hetzner and Cloudflare

```bash
git clone git@github.com:digitalservicebund/kpi-dashboard.git

cd example/terraform
terraform init
touch secrets.auto.tfvars
# set your token in the tfvars file e.g.:
# token="secret token generated at hetzner in your project"
terraform plan
terraform apply

#connect once to the docker host
ssh root@<SERVER_IP>
```

Obtain credentials from 1password by setting up 1password cli and navigate into the config folder and run

```bash
cd config
# It is important to set the APP_ENV to to link your config
APP_ENV=example op inject -i postgres.env.tpl -o postgres.env
APP_ENV=example op inject -i metabase.env.tpl -o metabase.env
APP_ENV=example op inject -i nocodb.env.tpl -o nocodb.env
APP_ENV=example op inject -i n8n.env.tpl -o n8n.env
cd ..
```

```bash
# Generate a htpasswd user for the traefik dashboard
echo $(htpasswd -nB user) | sed -e s/\\$/\\$\\$/g
# collect the ip from the terraform outputs
docker context create remote --docker host=ssh://root@<SERVER_IP>
docker-compose --context remote up -d
docker --context kpi-dashboard-tst container ls
docker-compose --context remote down -v
```
