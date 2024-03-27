FROM debian:latest

RUN apt-get update && apt-get install -y \
    curl git sudo zsh \
    && apt-get clean

RUN sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/bin/

WORKDIR /root

COPY _run.sh /root/

CMD [ "/root/_run.sh" ]
