# Moodle container

The purpose of this project is to create a container image for Moodle that is capable of operating at large scale.

# Requirements

- Docker
- Docker Compose

# Quick start

Start all services.
```
docker compose up -d
```

In a web browser, navigate to http://moodle.localhost/ .

# Scale up

Scale up the number of Moodle instances to 2.
```
docker compose up -d --scale moodle=2
```
