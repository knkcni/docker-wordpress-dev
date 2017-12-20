# docker-wordpress-dev

> Develop in local with ease.

## Features

- Easy dev environments with Docker Compose
- Used locally for my own sites, tested and up-to-date


## Requirements

- Docker Engine
- Docker Compose

These can be installed using your system's native package manager or from binaries/installers. See the [Docker docs](https://docs.docker.com/engine/installation/) for details.

## Getting Started
```bash
docker-compose up 
```

## Changing ports

To change the port of the dockerized wordpress instance, go into [`docker-compose.yml`] and modify `ports`. 
The - "80:80" maps the internal docker port 80 to the outside port 80 of the host machine.

```yml
# docker-compose.yml
 ...
  ports:
    - "80:80" # The 80:80 maps the internal docker port 80 to the outside port 80 of the host machine. --> localhost:80
 ...
```


## Extra Tools : Adminer & cAdvisor

Using this docker-compose will bring you Adminer, a GUI SQL where you can interact with your SQL database.

```yml
# docker-compose.yml
 ...
  ports:
    - "8080:8080" # The 8080:8080 maps the internal docker port 8080 to the outside port 8080 of the host machine. --> localhost:8080
 ...
```

You will also have access to cAdvisor, a monitoring tool that provides users an understanding of the resource usage and performance characteristics of their running containers.

```yml
# docker-compose.yml
 ...
  ports:
    - "8008:8080" # The 8008:8080 maps the internal docker port 8080 to the outside port 8008 of the host machine. No conflict with Adminer in that case --> localhost:8008
 ...
```
---

## Developing a Theme

Configure the volume to load the theme in the container in the docker-compose.yml

```
volumes:
  - ./theme-name/:/var/www/html/wp-content/themes/theme-name
```

## Developing a Plugin

Configure the volume to load the plugin in the container in the docker-compose.yml

```
volumes:
  - ./plugin-name/:/var/www/html/wp-content/plugins/plugin-name
```
