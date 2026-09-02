FROM debian:sid-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        chezmoi \
        curl \
        git \
        libssl-dev \
        pkg-config \
        sudo \
        zsh \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root

COPY _run.sh /root/

CMD [ "/root/_run.sh" ]