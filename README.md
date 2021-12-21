# Research Processing System

A new Flutter project.

## Get started

To get this web app up and running there are 2 steps

1. Setup the database
2. Run the flutter app

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [docker compose](https://docs.docker.com/compose/cli-command/#installing-compose-v2)
  or [docker-compose](https://docs.docker.com/compose/install/)
- [Flutter](https://docs.flutter.dev/get-started/install)
- [Google Chrome](https://www.google.com/chrome/)

### Steps

1. Start the postgreSQL, postgrest, and swagger UI services

```
docker compose up
```

or

```
docker-compose up
```

2. Run the flutter app on chrome

```
flutter run -d chrome
```