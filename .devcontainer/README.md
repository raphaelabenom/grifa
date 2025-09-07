# Ambiente DevContainer

Este diretório contém a configuração completa para desenvolvimento isolado e reprodutível usando [Dev Containers](https://containers.dev/).

## Estrutura

- `Dockerfile`: Imagem base customizada para Python, com ferramentas de desenvolvimento e usuário não-root.
- `docker-compose.yml`: Orquestração dos serviços (app e Redis), volumes e healthchecks.
- `devcontainer.json`: Configuração do ambiente para VSCode/DevContainers, scripts de automação e extensões recomendadas.
- `scripts/`: Scripts de automação executados na criação e pós-criação do container.
- `.env.example`: Exemplo de variáveis de ambiente necessárias para rodar o projeto.

## Scripts

- `scripts/on_create_command.sh`: Instala fontes e temas para o terminal.
- `scripts/post_create_command.sh`: Prepara ambiente Python, instala dependências, executa lint e testes automaticamente.

## Variáveis de Ambiente

Copie `.env.example` para `.env` e ajuste conforme necessário:

```
cp .env.example .env
```

- `DATABASE_URL`: URL de conexão com Redis (ou outro serviço, se necessário)
- `SECRET_KEY`: Chave secreta para uso na aplicação

## Serviços Disponíveis

- **devcontainer**: Ambiente Python customizado
- **redis**: Redis (latest), exposto na porta 6379

## Dicas de Uso

- O ambiente já instala e executa lint (ruff) e testes (pytest) automaticamente após o setup.
- Para adicionar novos serviços, edite o `docker-compose.yml` e siga o exemplo do Redis.
- Para builds mais rápidos, considere descomentar o cache de dependências Python no Dockerfile.

## Extensões Recomendadas VSCode

- Python
- Docker

## Observações

- Sempre mantenha o arquivo `requirements.txt` atualizado.
- Scripts separados facilitam manutenção e automação.
- O ambiente foi pensado para escalabilidade e onboarding rápido de novos desenvolvedores. 