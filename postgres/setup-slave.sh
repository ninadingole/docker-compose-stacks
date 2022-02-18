#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL

    CREATE TABLE test_replication (id INT PRIMARY KEY, name VARCHAR(30));

    CREATE SUBSCRIPTION my_subscription
    CONNECTION 'host=postgres-master-1 port=5432 dbname=data_service password=my_replicator_password user=replicator' PUBLICATION pub;

EOSQL
