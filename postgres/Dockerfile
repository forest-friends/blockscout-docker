FROM postgres:alpine
ENV POSTGRES_USER=blockscout POSTGRES_PASSWORD=blockscout
COPY dump.sql /docker-entrypoint-initdb.d/0-init.sql