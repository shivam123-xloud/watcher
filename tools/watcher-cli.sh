#!/bin/bash
# watcher-cli.sh — Helper script to run Watcher CLI via Docker container
#
# Usage:
#   ./watcher-cli.sh strategy list
#   ./watcher-cli.sh audit create --goal dummy --strategy dummy
#   ./watcher-cli.sh audit list
#   ./watcher-cli.sh actionplan list
#   ./watcher-cli.sh actionplan start <uuid>
#
# Install:
#   cp tools/watcher-cli.sh /usr/local/bin/watcher-cli
#   chmod +x /usr/local/bin/watcher-cli
#
# Requirements:
#   - python-watcherclient must be installed in the watcher_engine container:
#       docker exec watcher_engine pip install python-watcherclient
#   - Set OS_* environment variables below to match your deployment

docker exec \
  -e OS_AUTH_URL=https://lab-int.xloud.tech:5000 \
  -e OS_USERNAME=admin \
  -e OS_PASSWORD=cidBLnhn3VE3QoHMWvZIrKsaPMzYUzpKYfkPkVpK \
  -e OS_PROJECT_NAME=admin \
  -e OS_USER_DOMAIN_NAME=Default \
  -e OS_PROJECT_DOMAIN_NAME=Default \
  -e OS_INFRA_OPTIM_API_VERSION=1.4 \
  watcher_engine \
  openstack optimize "$@"
