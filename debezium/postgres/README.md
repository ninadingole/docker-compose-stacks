## Debezium Postgres CDC

This module provides a Debezium connector for Postgres. It is based on the [Debezium Postgres connector](https://debezium.io/documentation/reference/1.0/connectors/postgresql.html)
and uses confluent zookeeper, broker, schema registry and rest proxy.

### Prerequisites
- Docker
- Docker Compose


### Running the Stack
- Run `docker-compose up` to start the connector
- Run `docker-compose down` to stop the connector
- Run `docker-compose logs -f` to view the logs
- Run `docker-compose exec postgres bash` to access the postgres container
- Run `docker-compose exec broker bash` to access the kafka container


### Registering the connector
- Run `curl -X POST -H "Content-Type: application/json" -d @connector.json http://localhost:8083/connectors`

### Testing the connector
- Run `docker-compose exec postgres bash` to access the postgres container
- Run `psql -U postgres` to access the postgres database

### Viewing the data
- Run `docker-compose exec broker bash` to access the kafka container
- Run `kafka-console-consumer --bootstrap-server broker:9092 --topic postgres.public.movies --from-beginning`


## Schema Registry

### Viewing the schema
- Run `curl -X GET http://localhost:8081/subjects/postgres.public.movies/versions/1`


### Registering the schema
- Run `curl -X POST -H "Content-Type: application/json" -d @schema.json http://localhost:8081/subjects/postgres.public.movies/versions`
