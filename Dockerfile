FROM postgres
ENV POSTGRES_PASSWORD 123
ADD puc.sql /docker-entrypoint-initdb.d
EXPOSE 5432