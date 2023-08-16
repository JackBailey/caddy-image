FROM caddy:2.7-builder AS builder

RUN xcaddy build \
  --with github.com/caddyserver/replace-response \
  --with github.com/caddy-dns/cloudflare \
  --with github.com/WeidiDeng/caddy-cloudflare-ip

FROM caddy:2.7

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
