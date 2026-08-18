FROM koalaman/shellcheck:v0.11.0@sha256:61862eba1fcf09a484ebcc6feea46f1782532571a34ed51fedf90dd25f925a8d AS shellcheck

FROM debian:trixie-slim@sha256:3a39a0592364683e6bab97937b72cad5a8fa6dcbbee90edb3bb48c7f8e94f258

ARG CHEZMOI_VERSION=v2.72.0

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl \
    && rm -rf /var/lib/apt/lists/*

COPY --from=shellcheck /bin/shellcheck /usr/local/bin/shellcheck

RUN sh -c "$(curl -fsLS https://get.chezmoi.io)" -- \
    -b /usr/local/bin \
    -t "${CHEZMOI_VERSION}"

WORKDIR /workspace
COPY . /workspace

ENTRYPOINT ["/bin/bash", "/workspace/_lint.sh"]
