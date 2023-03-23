![scylladb](./img/logo.png)


# ScyllaDB

ScyllaDB is a NoSQL database management system that is compatible with Apache Cassandra. 
It is designed to scale linearly across multiple commodity servers, while maintaining low latency and high availability. 
ScyllaDB is written in C++ and uses the Seastar framework for concurrency and asynchronous I/O.


## Prerequisites
- Docker
- Docker Compose


## Running the Stack

### Standalone

Inside the `standalone` directory, run `docker-compose up` to start the connector.

### Port Configurations

 - `9042` - ScyllaDB CQL port
 - `9160` - ScyllaDB Thrift port
 - `7004` - ScyllaDB Inter-node communication (RPC)
 - `7005` - ScyllaDB Inter-node communication (SSL)
 - `10000` - Scylla REST API


### Cluster

Inside the `cluster` directory, run `docker-compose up` to start the connector.

#### Port Configurations

Master

- `9042` - ScyllaDB CQL port
- `9160` - ScyllaDB Thrift port
- `7004` - ScyllaDB Inter-node communication (RPC)
- `7005` - ScyllaDB Inter-node communication (SSL)
- `10000` - Scylla REST API

Node 1

- `9043` - ScyllaDB CQL port
- `9161` - ScyllaDB Thrift port
- `7006` - ScyllaDB Inter-node communication (RPC)
- `7007` - ScyllaDB Inter-node communication (SSL)
- `10001` - Scylla REST API

**Cluster Status:**

run `docker-compose exec scylladb-master nodetool status` to view the cluster status.

```go
Datacenter: datacenter1
=======================
Status=Up/Down
|/ State=Normal/Leaving/Joining/Moving
--  Address     Load       Tokens       Owns    Host ID                               Rack
UN  172.27.0.3  2.07 MB    256          ?       a899f085-0437-444a-80fe-158958a8796b  rack1
UN  172.27.0.2  2.02 MB    256          ?       2910746d-e5f2-4a28-a63d-a089cdcb0438  rack1

Note: Non-system keyspaces don't have the same replication settings, effective ownership information is meaningless
```

**Cluster Topology:**

run `docker-compose exec scylladb-master nodetool describecluster` to view the cluster topology.

```go
Cluster Information:
	Name: Test Cluster
	Snitch: org.apache.cassandra.locator.SimpleSnitch
	DynamicEndPointSnitch: disabled
	Partitioner: org.apache.cassandra.dht.Murmur3Partitioner
	Schema versions:
		f99fb55d-f298-30d6-bd75-31f9855362c2: [172.29.0.2, 172.29.0.3]
```

**Cluster Info:**

run `docker-compose exec scylladb-master nodetool info` to view the cluster info.

```go
ID                     : eb720697-ac71-413c-a843-748527cff616
Gossip active          : true
Thrift active          : false
Native Transport active: true
Load                   : 524 KB
Generation No          : 1679584265
Uptime (seconds)       : 139
Heap Memory (MB)       : 14.16 / 247.50
Off Heap Memory (MB)   : 4.65
Data Center            : datacenter1
Rack                   : rack1
Exceptions             : 0
Key Cache              : entries 0, size 0 bytes, capacity 0 bytes, 0 hits, 0 requests, 0.000 recent hit rate, 0 save period in seconds
Row Cache              : entries 13, size 13 bytes, capacity 154.2 KiB, 271 hits, 271 requests, 1.000 recent hit rate, 0 save period in seconds
Counter Cache          : entries 0, size 0 bytes, capacity 0 bytes, 0 hits, 0 requests, 0.000 recent hit rate, 0 save period in seconds
Percent Repaired       : 0.0%
Token                  : (invoke with -T/--tokens to see all 256 tokens)
```

## CQLSH

CQLSH is a command line tool for interacting with ScyllaDB.

### Usage

```go
docker-compose exec <<scylladb-master | scylladb>> cqlsh
```
