FROM linuxserver/code-server:4.11.0

ENV DEBIAN_FRONTEND noninteractive

# Update stuff to latest
RUN apt update
RUN apt dist-upgrade -y

# Must haves
RUN apt install -y curl wget git apt-transport-https ca-certificates gnupg openssl man-db

# Programming langages
RUN apt install -y python3 python3-pip python3-venv openjdk-17-jdk-headless maven gradle
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1
RUN curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash -
RUN apt install -y nodejs

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
    exa \
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

# OhMyZsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    usermod -s /bin/zsh abc && \
    usermod -s /bin/zsh root && \
    sed -i '1s/^/ZSH_DISABLE_COMPFIX="true"\n/' /config/.zshrc

RUN bash <(curl -fSsL https://fig.io/headless.sh) && exec $SHELL

RUN apt-get auto-remove -y && \
    apt-get clean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

EXPOSE 8443
