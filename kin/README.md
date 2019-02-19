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

## Refs
* <https://github.com/StellarKit/stellarkit-core-horizon>