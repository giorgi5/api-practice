#!/usr/bin/env bash

# wait-for-it.sh script to wait for the database to be ready

set -e

host="$1"
shift
cmd="$@"

until pg_isready -h "$host"; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"
exec $cmd
