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

In a web browser, navigate to <http://moodle.localhost/>.

# Scale up

Scale up the number of Moodle instances to 2.
```
docker compose up -d --scale moodle=2
```

# Run scheduled tasks

Every 60 seconds using the `watch` command.
```
watch -n 60 docker compose run --rm moodle php /bitnami/moodle/admin/cli/cron.php
```

# View outgoing emails

[Mailpit] has been set up to catch all outgoing emails from Moodle. View sent emails via the web UI at <http://localhost:8025/>.


[Mailpit]: https://github.com/axllent/mailpit
