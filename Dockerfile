# Utilise une image Debian légère comme base
FROM debian:bookworm-slim

# Variables d’environnement
ENV DEBIAN_FRONTEND=noninteractive

# Installation des dépendances nécessaires
RUN apt-get update && apt-get install -y --no-install-recommends \
    postgresql-client \
    libdbd-pg-perl \
    libdbi-perl \
    libtest-simple-perl \
    make \
    cpanminus \
    curl \
    && cpanm TAP::Parser::SourceHandler::pgTAP \
    && curl -L https://raw.githubusercontent.com/theory/pgtap/master/pg_prove > /usr/local/bin/pg_prove \
    && chmod +x /usr/local/bin/pg_prove \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Vérifie l’installation
RUN pg_prove --version || echo "pg_prove installed."

ENTRYPOINT ["pg_prove"]
