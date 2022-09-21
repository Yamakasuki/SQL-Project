FROM postgres
ENV POSTGRES_PASSWORD 123
ADD main.sql /docker-entrypoint-initdb.d
EXPOSE 5432
