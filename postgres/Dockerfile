FROM postgres:alpine
ENV POSTGRES_USER=blockscout POSTGRES_PASSWORD=blockscout POSTGRES_DB=postgres
COPY dump.sql /docker-entrypoint-initdb.d/0-init.sql