Awesome Docker Compose
---

## What is this?

This is a collection of docker compose stacks for daily software development work.
It becomes handy when you want to run a stack of docker containers and you don't want to write a docker compose file for
it.
There are many docker compose files available on the internet but they are not well maintained and they are not up to
date.
This repository is a collection of docker compose files that are well maintained and up to date.

## What is docker compose?

Docker compose is a tool for defining and running multi-container Docker applications.

## How to use?

Clone this repository and run the docker compose file inside the directory.

Example:

Inside directory e.g. `sonarqube`

```
sonarqube $> docker-compose up
```

use `-d` to start compose in detach mode

## Stacks

| Stack                                    | Standalone | Cluster |
|------------------------------------------|------------|---------|
| Apache Kafka                             | ✅          | ✅       |
| Apache Kafka Kraft                       | ✅          |         |
| Debezium - Postgres                      | ✅          |         |
| Debezium - MySQL                         | ✅          |         |
| Jaeger                                   | ✅          |         |
| [Metabase](./metabase/README.md)         | ✅          |         |
| Postgres                                 | ✅          | ✅       |
| Prometheus + Grafana                     | ✅          |         |
| Prometheus Push Gateway                  | ✅          |         |
| [ScyllaDB](./scylladb/Readme.md)         | ✅          | ✅       |
| SonarQube                                | ✅          |         |
| KSQLDB      [Planned]                    |            |         |
| MySQL      [Planned]                     |            |         |
| MongoDB      [Planned]                   |            |         |
| CockroachDB  [Planned]                   |            |         |
| [Redis](./redis/README.md) [In-Progress] |            |         |

## How to contribute

Raise a pull request if you are using docker compose stack and automated it for your daily software development work.
Happy to review and merge!
Cheers :D
