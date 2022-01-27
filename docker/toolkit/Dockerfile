FROM linuxserver/code-server

ENV DEBIAN_FRONTEND noninteractive

# Must haves
RUN apt update && apt install -y curl wget git apt-transport-https ca-certificates gnupg openssl man-db

# Programming langages
RUN apt install -y python3 python3-pip python3-venv openjdk-17-jdk-headless nodejs

# Google SDK
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | \
    tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
    apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && \
    apt update && \
    apt install google-cloud-sdk -y

# Usefull tools
RUN apt install -y build-essential \
    openssh-server \
    kubectl \
    zsh \
    ffmpeg \
    nmap \
    hping3 \
    tcpdump \
    iftop \
    fzf \
    fish \
    htop \
    glances \
    aria2 \
#    exa \
    zip \
    unzip \
    rsync \
    nano \
    pwgen \
    iputils-ping \
    dnsutils \
    postgresql-client \
    mariadb-client \
    redis-tools

# Update stuff to latest
RUN apt update && apt dist-upgrade -y

# OhMyZsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN apt-get auto-remove -y && \
    apt-get clean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

COPY root /

EXPOSE 22
EXPOSE 8443
VOLUME /config
