Jstorm Docker
========

### Setting up a minimal Storm cluster
Run `docker-compose up`. The nimbus, supervisor and zookeeper will run. The nimbus will be available at port 6627.

If you want to run the cluster in backend, you can run `docker-compose up -d`.

### Setting up step by step
1. Run zookeeper at first:
```bash
docker run -d --restart always --name jstorm-zookeeper zookeeper:3.4
```
2. Set up nimbus. The Nimbus daemon has to be connected with the zookeeper(by link `--link jstorm-zookeeper:zookeeper`).
```bash
docker run -d --restart always --name jstorm-nimbus --link jstorm-zookeeper:zookeeper mtunique/jstorm jstorm nimbus
```

3. Set up a supervisor node.
```bash
docker run -d --restart always --name jstorm-supervisor --link jstorm-zookeeper:zookeeper mtunique/jstorm jstorm supervisor
```

