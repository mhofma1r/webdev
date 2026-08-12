FROM alpine:latest

RUN apk add --no-cache \
    bash \
    openssh-client \
    git \
    curl \
    nodejs \
    npm \
    ripgrep \
    jq
# Create a non-root Codex user.
RUN addgroup -g 1000 codex \
    && adduser \
        -D \
        -u 1000 \
        -G codex \
        -s /bin/bash \
        codex

# Install the Codex CLI.
RUN npm install -g @openai/codex

# Prepare the SSH directory.
RUN mkdir -p /home/codex/.ssh \
    && chown -R codex:codex /home/codex \
    && chown -R codex:codex /home/codex

WORKDIR /home/codex

RUN chmod 700 /home/codex/.ssh
RUN mkdir -p /home/codex/.ssh
COPY  ssh/id_ed25519 /home/codex/.ssh/id_ed25519
COPY  ssh/id_ed25519.pub /home/codex/.ssh/id_ed25519.pub
COPY AGENTS.md /home/webuser/.codex/

RUN chown 1000:1000 /home/codex/.ssh/id_ed25519.pub
RUN chown 1000:1000 /home/codex/.ssh/id_ed25519
RUN chmod 700 /home/codex/.ssh
run chmod 600 /home/codex/.ssh/id_ed25519
USER codex
