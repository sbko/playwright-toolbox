# Playwright Docker Image

A Docker image with Playwright and Chrome pre-installed for use with Claude Code MCP on Fedora systems.

## Purpose

This image solves the compatibility issue where Playwright officially supports only Ubuntu and Debian distributions, but you're running Claude Code on Fedora. Using Podman toolbox, this Ubuntu-based container provides a compatible environment for the Playwright MCP integration.

## Prerequisites

- Fedora Linux with Podman and toolbox installed
- Claude Code CLI tool

## Setup

1. Pull the image from GitHub Container Registry:

```bash
# Latest version
podman pull ghcr.io/sbko/playwright-toolbox:latest

# Or specific version (e.g., 1.53.2)
podman pull ghcr.io/sbko/playwright-toolbox:1.53.2
```

2. Create a toolbox container using the Ubuntu-based image:

```bash
toolbox create playwright --image ghcr.io/sbko/playwright-toolbox:latest
```

3. Configure Claude Code MCP to use Playwright through the toolbox:

```bash
claude mcp add playwright -s user -- toolbox run -c playwright npx @playwright/mcp@latest
```

## Why This Approach?

- **Compatibility**: Playwright officially supports Ubuntu 22.04/24.04 and Debian 12, not Fedora
- **Isolation**: Toolbox provides seamless integration between Fedora host and Ubuntu container
- **MCP Integration**: Enables Claude Code to use Playwright's browser automation capabilities through the Model Context Protocol

## What's Included

- Ubuntu 22.04 base image
- Node.js v22.17.0 LTS
- Latest Playwright with Chrome browser
- All necessary dependencies for browser automation

## Building Locally

```bash
docker build -t playwright-toolbox .
```

## Automated Builds

This image is automatically built and pushed to `ghcr.io` on every push to the main branch. Images are tagged with:
- `latest` - Always points to the most recent build
- `<version>` - Specific Playwright version (e.g., `1.53.2`, `1.54.0`)

New versions are automatically detected and built when Playwright releases updates.
