#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    -- Criação do banco para Keycloak
    CREATE DATABASE devops_keycloak;
    
    -- Criação do usuário para Keycloak
    CREATE USER keycloak_user WITH PASSWORD 'keycloak123';
    GRANT ALL PRIVILEGES ON DATABASE devops_keycloak TO keycloak_user;
    ALTER DATABASE devops_keycloak OWNER TO keycloak_user;
    
    -- Criação do banco para Jenkins
    CREATE DATABASE db_jenkins;
    
    -- Criação do usuário para Jenkins
    CREATE USER jenkins_user WITH PASSWORD 'jenkins123';
    GRANT ALL PRIVILEGES ON DATABASE db_jenkins TO jenkins_user;
    ALTER DATABASE db_jenkins OWNER TO jenkins_user;
    
    -- Concede permissões adicionais no schema public
    GRANT ALL ON SCHEMA public TO keycloak_user;
    GRANT ALL ON SCHEMA public TO jenkins_user;
EOSQL

# Conecta ao banco keycloak para criar extensões
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "devops_keycloak" <<-EOSQL
    CREATE EXTENSION IF NOT EXISTS pgcrypto;
    GRANT ALL ON SCHEMA public TO keycloak_user;
EOSQL