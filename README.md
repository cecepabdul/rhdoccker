# RHMiner in docker example

## Usage

### Setup 

Set the version of rhminer you want to use.

Execute `make set VERSION=1.3` to set the version to 1.3.

Create a mining executable for linux in the `miner.sh` file.

For solo mining and a wallet running on the host use something like this:

`./rhminer -r 20 -s http://127.0.0.1:4009 -cpu -cputhreads 1`

For pool mining use something like this:

```
echo Mining on mine.pool.pascalpool.org with one CPU thread
 ./rhminer -r 20 -s mine.pool.pascalpool.org:3333 -su $YOUR_ACCOUNT.0.$YOUR_WORKER_NAME/$YOUR_EMAIL -cpu -cputhreads 1
```

See https://pool.pascalpool.org/#help for a generator.

## Build

Execute `make build` to build the container.

## Run

Execute `make start` to start the miner.

## Stop

Execute `make stop` to stop the miner.
