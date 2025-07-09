FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs

WORKDIR /app

RUN npm init -y && \
    npm install @playwright/test && \
    npx playwright install-deps && \
    npx playwright install chrome
