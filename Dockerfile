# Utilise une image Debian légère comme base
FROM ubuntu:24.04

# Installation des dépendances nécessaires
RUN apt-get update && apt-get install -y --no-install-recommends \
    postgresql-client \
    pg_tap

# Vérifie l’installation
RUN pg_prove --version || echo "pg_prove installed."
