FROM caddy:2.10.0-builder AS builder

RUN xcaddy build \
  --with github.com/caddyserver/replace-response \
  --with github.com/caddy-dns/cloudflare \
  --with github.com/WeidiDeng/caddy-cloudflare-ip \
  --with github.com/mholt/caddy-dynamicdns \
  --with github.com/lanrat/caddy-dynamic-remoteip

FROM caddy:2.10.0

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
