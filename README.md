# Overview

Django and observability (Grafana + Prometheus)

```shell
docker-compose up -d
make
```
| Service      | Endpoint                       | Auth        |
|--------------|--------------------------------|-------------|
| django-app   | http://localhost:8000/employee | -           |
| django-admin | http://localhost:8000/admin    | admin:1234  |
| prometheus   | http://localhost:9090/         | -           |
| grafana      | http://localhost:3000/         | admin:admin |
