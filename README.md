# Docker PHP Microservice

## Build the container
```bash
docker build . -t docker-php-microservice:latest
```

## Run the container
```bash
docker run -it --env-file=.env --name docker-php-microservice --restart=unless-stopped -d docker-php-microservice:latest
```

## Show logs
```bash
docker logs -f docker-php-microservice
```

## Container CLI
```bash
docker exec -it docker-php-microservice /bin/sh
```
