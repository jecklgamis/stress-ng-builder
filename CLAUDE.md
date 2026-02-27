# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repo builds static [`stress-ng`](https://github.com/ColinIanKing/stress-ng) binaries via two methods: a Docker-based Ubuntu builder and a localhost builder.

## Build Commands

### Ubuntu (Docker) builder
```bash
cd ubuntu && make all
```
This runs the full pipeline: builds the Docker image, starts it as a daemon (nginx on port 3080), downloads the `stress-ng-linux` binary via HTTP, then stops the container.

Individual targets:
- `make image` — build the Docker image
- `make run` / `make run-daemon` — run container (foreground / background)
- `make run-bash` — interactive shell in container
- `make download-binary` — download built binary from `http://localhost:3080/stress-ng`
- `make stop` — stop the running container

### Localhost builder
```bash
cd localhost && make all
```
Requires gcc. Downloads stress-ng source and builds it statically (`STATIC=1`).

## Architecture

- **`ubuntu/`** — Docker-based builder. The Dockerfile (Ubuntu 22.04) installs gcc/make/nginx, downloads and compiles stress-ng (version 0.15.01), copies the binary to nginx's web root, and serves it on port 3080.
- **`localhost/`** — Direct local build. Downloads stress-ng source tarball (version 0.10.04) and compiles statically.
- Nginx config (`ubuntu/nginx.conf`, `ubuntu/nginx_default_server.conf`) serves files from `/var/www/html` on port 3080 with autoindex enabled.

## Key Details

- Both builders use stress-ng version 0.20.01. Version is set via `VERSION` variable in each Makefile/Dockerfile.
- The Ubuntu builder produces a dynamically-linked binary; the localhost builder produces a static binary (`STATIC=1`).
- The `default` target in both Makefiles just prints the Makefile contents (`cat ./Makefile`).
