#!/bin/bash

# You could find the primary on every request but that would mean two calls per
# request. This will update a file every couple seconds to ensure you are
# looking at the current primary.
{
  > /tmp/redis_host
  echo -n "${REDIS_PORT}" > /tmp/redis_port
  while true
  do
    primary=$(redis-cli -h "${SENTINEL_NAME}" -p "${SENTINEL_PORT}" sentinel get-master-addr-by-name "${INSTANCE_NAME}")
    host=$(echo ${primary} | awk '{print $1}')
    test "${host}" == "$(cat /tmp/redis_host)" || echo -n "${host}" > /tmp/redis_host
    sleep 5
  done
} &

docker-php-entrypoint $@
