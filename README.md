# Requirements

- Docker
- Docker Compose

# Quick start

Start all services.
```
docker compose up -d
```

In browser, navigate to [http://moodle.local].

# Scale up

Scale up the number of Moodle instances to 2.
```
docker compose up -d --scale moodle=2
```
