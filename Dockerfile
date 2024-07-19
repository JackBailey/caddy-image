FROM caddy:2.8.4-builder AS builder

RUN xcaddy build \
  --with github.com/caddyserver/replace-response \
  --with github.com/caddy-dns/cloudflare \
  --with github.com/WeidiDeng/caddy-cloudflare-ip \
  --with github.com/mholt/caddy-dynamicdns \
  --with github.com/lanrat/caddy-dynamic-remoteip \
  --with github.com/tailscale/caddy-tailscale \
  --with github.com/lucaslorentz/caddy-docker-proxy/v2@v2.7.0

FROM caddy:2.8.4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
