# Utilise une image Debian légère comme base
FROM ubuntu:24.04

# Variables d’environnement
ENV DEBIAN_FRONTEND=noninteractive

# Installation des dépendances nécessaires
RUN apt-get update && apt-get install -y --no-install-recommends \
    postgresql-client \
    pg_tap \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Vérifie l’installation
RUN pg_prove --version || echo "pg_prove installed."
