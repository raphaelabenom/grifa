#!/bin/bash

set -e

# Função de log para padronizar saída
log() {
  echo "[post_create_command] $1"
}

# Instalação do pipx localmente, se necessário
log "Instalando pipx localmente (caso não esteja instalado)"
pip install --user pipx || { echo "Erro ao instalar pipx"; exit 1; }

# Adiciona o diretório do pipx ao PATH
export PATH="$HOME/.local/bin:$PATH"

# Verifica se o pipx está disponível
log "Verificando se pipx está disponível"
command -v pipx >/dev/null 2>&1 || { echo "pipx não encontrado no PATH"; exit 1; }

# Instala o uv usando pipx
log "Instalando uv usando pipx"
pipx install uv || { echo "Erro ao instalar uv"; exit 1; }

# Verifica se o uv está disponível
log "Verificando se uv está disponível"
command -v uv >/dev/null 2>&1 || { echo "uv não encontrado no PATH"; exit 1; }

log "uv autocompletion para zsh"
echo 'eval "$(uv generate-shell-completion zsh)"' >> ~/.zshrc

# Cria diretório backend e inicializa projeto com uv
log "Criando diretório backend"
mkdir -p backend

log "Criando ambiente virtual com uv dentro da pasta backend"
cd backend
uv init || { echo "Erro ao criar ambiente virtual com uv"; exit 1; }

# Instala dependências com uv
log "Instalando dependências com uv"
uv add fastapi[standard] python-dotenv requests httpx ruff pytest pytest-cov taskipy || { echo "Erro ao instalar dependências"; exit 1; }
cd ..
# uv pip install -r .devcontainer/requirements.txt || { echo "Erro ao instalar dependências"; exit 1; }

# Executa lint e testes
# log "Executando lint (ruff) e testes (pytest)"
# ruff . || { echo "Lint falhou"; exit 1; }
# pytest || { echo "Testes falharam"; exit 1; }
# log "Qualidade de código e testes executados com sucesso!"

log "Setup concluído com sucesso!"
