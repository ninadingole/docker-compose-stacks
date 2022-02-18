#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER replicator WITH REPLICATION ENCRYPTED PASSWORD 'my_replicator_password';

    CREATE TABLE test_replication (id INT PRIMARY KEY, name VARCHAR(30));
    INSERT INTO test_replication (id, name) VALUES (1, 'test');
    INSERT INTO test_replication (id, name) VALUES (2, 'test');
    INSERT INTO test_replication (id, name) VALUES (3, 'test');
    INSERT INTO test_replication (id, name) VALUES (4, 'test');

    GRANT ALL ON test_replication TO replicator;

    CREATE PUBLICATION pub FOR ALL TABLES;
EOSQL
