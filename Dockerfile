FROM debian:bullseye-slim

# Installer uniquement pg_prove et ses dépendances essentielles
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libdbd-pg-perl \
        libtest-simple-perl \
        postgresql-client \
        make \
        curl \
        pg_tap \
    apt-get remove -y curl make && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["pg_prove"]
