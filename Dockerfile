FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs

RUN rm -rf /root/.npm && npm init -y
RUN npx playwright@latest install-deps
RUN npx playwright@latest install
RUN npx playwright install chrome
