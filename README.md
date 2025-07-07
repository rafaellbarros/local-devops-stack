# DevOps Local Stack - Ambiente Modular com Docker

![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=for-the-badge&logo=Prometheus&logoColor=white)
![Grafana](https://img.shields.io/badge/Grafana-F46800?style=for-the-badge&logo=grafana&logoColor=white)
![Keycloak](https://img.shields.io/badge/Keycloak-EC2A24?style=for-the-badge&logo=keycloak&logoColor=white)

## 📋 Visão Geral

Este projeto fornece uma stack DevOps local completa usando Docker Compose, com uma estrutura modular que facilita a manutenção e expansão. A stack inclui:

- **PostgreSQL**: Banco de dados relacional
- **Prometheus**: Sistema de monitoramento e alerta
- **Grafana**: Plataforma de visualização de métricas
- **Keycloak**: Solução de gerenciamento de identidade e acesso
- **Postgres Exporter**: Coletor de métricas para PostgreSQL

## 🏗️ Estrutura do Projeto

```
.
├── .env                    # Variáveis de ambiente
├── docker-compose.yml      # Configuração principal
├── configs/                # Arquivos de configuração
│   ├── postgres/           # Scripts SQL e queries
│   ├── prometheus/         # Configuração do Prometheus
│   └── grafana/            # Dashboards e provisionamento
└── services/               # Definições modulares dos serviços
    ├── postgres/           # Configuração do PostgreSQL
    ├── prometheus/         # Configuração do Prometheus
    ├── grafana/            # Configuração do Grafana
    ├── keycloak/           # Configuração do Keycloak
    └── postgres-exporter/  # Configuração do exporter
```

## 🛠️ Tecnologias Utilizadas

| Tecnologia       | Versão       | Descrição                                  | Porta  |
|------------------|--------------|--------------------------------------------|--------|
| PostgreSQL       | 15-alpine    | Banco de dados relacional avançado         | 54322  |
| Prometheus       | latest       | Monitoramento e sistema de alerta          | 9090   |
| Grafana          | oss          | Visualização de métricas e dashboards      | 3000   |
| Keycloak         | 21.1.1       | Gerenciamento de identidade e acesso       | 8180   |
| Postgres Exporter| latest       | Coletor de métricas para PostgreSQL        | 9187   |

## 🚀 Como Executar

1. **Pré-requisitos**:
   - Docker Engine 20.10+
   - Docker Compose 2.0+

2. **Iniciar a stack**:
   ```bash
   docker-compose up -d
   ```

3. **Parar a stack**:
   ```bash
   docker-compose down
   ```

4. **Reiniciar um serviço específico**:
   ```bash
   docker-compose restart <nome-do-serviço>
   ```

## 🔧 Configuração

### Variáveis de Ambiente

Edite o arquivo `.env` para configurar:

```ini
# PostgreSQL
POSTGRES_ROOT_USER=postgres
POSTGRES_PASSWORD=postgres123
POSTGRES_DB=postgres

# Keycloak
DB_KEYCLOAK_USER=keycloak_user
DB_KEYCLOAK_PASSWORD=keycloak123
DB_KEYCLOAK=devops_keycloak

# Grafana
GRAFANA_ADMIN=admin
GRAFANA_PASSWORD=admin123

# Keycloak Admin
KEYCLOAK_ADMIN=admin
KEYCLOAK_PASSWORD=admin123

# Timezone
TZ=America/Sao_Paulo
```

### Inicialização do PostgreSQL

Adicione scripts SQL em `configs/postgres/init-scripts/` para executar na inicialização.

### Configuração do Prometheus

Edite `configs/prometheus/prometheus.yml` para adicionar novos alvos de monitoramento.

## 🌐 Acessos

| Serviço     | URL                     | Credenciais               |
|-------------|-------------------------|---------------------------|
| Grafana     | http://localhost:3000   | admin / admin123          |
| Prometheus  | http://localhost:9090   | -                         |
| Keycloak    | http://localhost:8180   | admin / admin123          |


## 📄 Licença

Este projeto está licenciado sob a licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.