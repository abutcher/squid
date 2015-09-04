#!/bin/bash

set -e

if [ -z ${PROXY_PEER+x} ]; then echo "PROXY_PEER is unset"; exit; else echo "PROXY_PEER is '$PROXY_PEER'"; fi
if [ -z ${PROXY_PORT+x} ]; then echo "PROXY_PORT is unset"; exit; else echo "PROXY_PORT is '$PROXY_PORT'"; fi

echo "Modifying configuration..."
sed -i "s/PROXY_PEER/${PROXY_PEER}/" /etc/squid/squid.conf
sed -i "s/PROXY_PORT/${PROXY_PORT}/" /etc/squid/squid.conf

echo "Starting squid..."
exec squid -f /etc/squid/squid.conf -NYCd 1
