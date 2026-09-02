FROM koalaman/shellcheck:v0.11.0@sha256:61862eba1fcf09a484ebcc6feea46f1782532571a34ed51fedf90dd25f925a8d AS shellcheck

FROM debian:sid-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends chezmoi \
    && rm -rf /var/lib/apt/lists/*

COPY --from=shellcheck /bin/shellcheck /usr/local/bin/shellcheck

WORKDIR /workspace
COPY . /workspace

ENTRYPOINT ["/bin/bash", "/workspace/_lint.sh"]
