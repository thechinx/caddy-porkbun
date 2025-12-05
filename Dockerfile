# Dockerfile
# SrstOne

FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun \
    --with github.com/gsmlg-dev/caddy-admin-ui@main \
    --with github.com/porech/caddy-maxmind-geolocation 

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile

