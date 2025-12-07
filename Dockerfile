FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun \
    --with github.com/gsmlg-dev/caddy-admin-ui@main \
    --with github.com/porech/caddy-maxmind-geolocation 

FROM caddy:latest

LABEL org.opencontainers.image.source="https://github.com/thechinx/caddy-porkbun"
LABEL org.opencontainers.image.description="Custom Caddy with Porkbun + Admin UI + MaxMind"
LABEL org.opencontainers.image.version="${CADDY_VERSION}"

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile

