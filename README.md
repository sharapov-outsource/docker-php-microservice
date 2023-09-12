# Docker PHP Microservice

## Build the container
```bash
docker build . -t docker-microservice:latest
```

## Run the container
```bash
docker run -it --env-file=.env --name docker-microservice --restart=unless-stopped -d docker-microservice:latest
```

## Show logs
```bash
docker logs -f docker-microservice
```

## Container CLI
```bash
docker exec -it docker-microservice /bin/sh
```
