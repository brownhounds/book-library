## Library Api

### Dev

1. Copy `.env.example` => `.env` or `make init`
2. Start `Postgres` database with `make dev-db`
3. Run database migrations with `migoro migrate`
4. Start `api` with `make run`.

### Migrator

Migrator installation documentation can be found at:

- [https://github.com/brownhounds/migoro](https://github.com/brownhounds/migoro)

### Docker Compose

**It does not require migrator installation - it will run in docker container**

Alternatively start an `api` with `docker compose up`.

**NOTE:** Make sure to build swagger docs with `./scripts/build-docs.sh` or `make docs`

Alternatively run `make run-compose` this will take care of `swagger` docs generation.

To remove database volume run `docker compose down` && `docker compose up --build --force-build`

### Api Documentation - OpenApi Swagger

Once `api` has been started visit [http://127.0.0.1:8080/docs](http://127.0.0.1:8080/docs)
