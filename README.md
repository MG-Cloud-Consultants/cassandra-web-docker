# cassandra-web-docker

A simple Docker image built from [cassandra-web](https://github.com/avalanche123/cassandra-web) web UI

## Supported Tags
- `0.5.0` 

## Quick Start

The container uses environment variables for configuration. Following parameters are available:

*  CASSANDRA_HOST_IPS
   *  A list of Cassandra nodes in the cluster
   *  *Note*: Currently, [only IPs and no FQDNs are accepted](https://github.com/avalanche123/cassandra-web/issues/19)
   *  Default: 127.0.0.1
*  CASSANDRA_PORT
   *  Port exposed by the nodes
   *  Default: 9042
*  CASSANDRA_USER
   *  Default: cassandra
*  CASSANDRA_PASSWORD
   *  Default: cassandra

### Docker CLI

```bash
docker run -d -p 3000:3000 \
    -e CASSANDRA_HOST_IPS=127.0.0.1 \
    -e CASSANDRA_PORT=9042 \
	-e CASSANDRA_USER=cassandra \
	-e CASSANDRA_PASSWORD=cassandra \
	markusgulden/cassandra-web
```


### Docker Compose

```yaml
version: "2.1"
services:
  cassandra:
    image: cassandra:3.11.4
    expose:
    - 7000
    - 7001
    - 7199
    - 9042
    - 9160
  cassandra-web:
    image: markusgulden/cassandra-web
    depends_on:
    - cassandra
    environment:
      CASSANDRA_HOST_IPS: 127.0.0.1
      CASSANDRA_PORT: 9042
      CASSANDRA_USER: cassandra
      CASSANDRA_PASSWORD: cassandra
    ports:
    - 3000:3000
```