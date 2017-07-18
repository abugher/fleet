#!/bin/bash
time ansible-playbook ./playbooks/deploy_role.yml -e role="${1}"
