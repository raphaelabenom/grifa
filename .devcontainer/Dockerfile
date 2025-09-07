FROM python:3.13-slim

ENV TZ=America/Sao_Paulo

# =============================
# Instala dependências de sistema e ferramentas de desenvolvimento
# =============================
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    fontconfig \
    git \
    unzip \
    wget \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# =============================
# Instala LSD (listagem de diretórios moderna)
# =============================
WORKDIR /usr/local/lsd
ENV LSD_VERSION 1.1.5
ADD https://github.com/lsd-rs/lsd/releases/download/v${LSD_VERSION}/lsd-musl_${LSD_VERSION}_amd64.deb /usr/local/lsd/lsd.deb
RUN dpkg -i ./lsd.deb && rm ./lsd.deb

# =============================
# Cria usuário não-root para desenvolvimento seguro
# =============================
ARG USERNAME=nonroot
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
  && chown -R $USER_UID:$USER_GID /home/$USERNAME

USER $USERNAME

# =============================
# (Opcional) Instala dependências Python em cache de build para acelerar builds futuros
# COPY requirements.txt /tmp/requirements.txt
# RUN pip install --user --upgrade pip && pip install --user -r /tmp/requirements.txt
# =============================

# Dica: para builds mais rápidos, descomente as linhas acima e mantenha requirements.txt atualizado.