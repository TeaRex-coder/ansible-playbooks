#!/bin/bash

set -e

echo "Installing Ansible Galaxy dependencies..."
ansible-galaxy install -r requirements.yml

echo "Running Ansible Playbook..."
ansible-playbook run.yml -K --ask-vault-pass
