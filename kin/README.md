# kin

### The simplest and cleanest Docker image for running stellar core and horizon

Build and run:

    docker-compose build
    docker-compose up -d

Defaults to testnet.

Creates a folder 'stellar' in your home folder.  Everything is stored there, delete it to reset.

### SSL NOTE:

Start it up once and stop it, for SSL to work you need to copy a folder named 'tsl' inside ~/stellar/node/horizon with your server.crt and server.key

Edit docker-compose.yml for mainnet

Pull requests welcome!

Disclaimer: We are not affiliated with, or sponsored or endorsed by, the Stellar Development Foundation.

## Manual Run

### stellar-postgres
* `docker run --name stellar-postgres -d -p 5432:5432 -v ~/kin/postgres:/var/lib/postgresql/data -e POSTGRES_DB=coredb -e POSTGRES_USER=stellar -e POSTGRES_PASSWORD='password' akagi201/stellar-postgres:latest`

### stellar-core
* `docker run --name stellar-core -d -p 11625:11625 -p 11626:11626 -v ~/kin/core:/opt/stellar -e POSTGRES_USER=stellar -e POSTGRES_PASSWORD=password -e TESTNET=1 -e CORE_DB_DSN="postgresql://dbname=coredb host=172.17.0.1:5432 user=stellar password=password sslmode=disable" akagi201/stellar-core:latest`

### stellar-horizon
* `docker run --name stellar-horizon -d -p 8000:8000 -v ~/kin/horizon:/opt/stellar -e POSTGRES_USER=stellar -e POSTGRES_PASSWORD=password -e TESTNET=1 -e CORE_DB_DSN="postgres://stellar:password@172.17.0.1:5432/coredb?sslmode=disable" -e HORIZON_DB_DSN="postgres://stellar:password@172.17.0.1:5432/horizondb?sslmode=disable" akagi201/stellar-core:latest`

## Refs
* <https://github.com/StellarKit/stellarkit-core-horizon>