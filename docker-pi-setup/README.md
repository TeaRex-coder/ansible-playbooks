# Docker Pi Setup Playbook

This playbook contains 2 roles to setup a Raspberry Pi Docker Container host running Ubuntu Server 23.04 Arm! Here is a breadown in sequential order:

- Update server
- Install essential packages
- Harden SSH configuration
- Create user with defined config
- Install Oh My ZSH with tjkirch theme
- Run Jeff Geerling's Pip and Docker roles
- Create directory structure for Docker containers
- Create container config files
- Start containers
- Import Docker volumes coming soon...

## Pre-requisite Steps

- Install Ubuntu 23.04 Arm on your Raspberry Pi (I am using a Pi 4b+)
- Setup a satic ip
- Copy your SSH key to the server

## Playbook usage

```sh
git clone https://github.com/TeaRex-coder/ansible-playbooks
cd docker-pi-setup
./ansible-run.sh
```

## Things to Consider

Before using the playbook you will likely want to update the [hosts file](./hosts) for your target server.

I have also included defaults where necessary to allow the playbook to be used without my vault. You will want to update them for the [system role](./roles/system/defaults/main.yml) the [services role](./roles/services/defaults/main.yml).

Optionally you can also replace the vault file with your own with: `ansible-vault create group_vars/all/secret.yml `

Below is my template for the vault file:

```yml
---
password: changeme

cloudflare_ddns_api_key: api_key
ddns_domain: ddns.example.clom
cloudflare_domain_zone_id: zone_id

pihole_webpassword: changeme
traefik_pihole_domain: pihole.example.com

cf_api_email: name@example.com
cf_traefik_api_key: api_key
traefik_traefik_dashboard_domain: traefik.example.clom
traefik_certificate_email: name@example.com

traefik_uptime_kuma_domain: status.example.com

wireguard_webpassword: changeme
public_ip: 1.2.3.4
traefik_wireguard_domain: wireguard.example.clom
```
