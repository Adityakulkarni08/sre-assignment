#!/bin/bash

DOMAINS=("authelia.local" "grafana.local" "gitea.local")
CERT_DIR="./nginx/certs"

mkdir -p "$CERT_DIR"

for DOMAIN in "${DOMAINS[@]}"; do
  openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout "$CERT_DIR/$DOMAIN.key" \
    -out "$CERT_DIR/$DOMAIN.crt" \
    -subj "/C=US/ST=Local/L=Local/O=Dev/OU=Dev/CN=$DOMAIN"
    
  echo "✔️  Generated certificate for $DOMAIN"
done

