#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /furima_1295/tmp/pids/server.pid
rm -f /frima_1295/tmp/pids/unicorn.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"