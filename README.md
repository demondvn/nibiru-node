# nibiru-node
    docker build . -t nibiru
## Run

    docker run -e NIBIRU_NODENAME=MonPham -v /mnt/blockstore/nibiru/:/root/.nibid -p 26656:26656 -p 26657:26657 --name nibiru nibiru

## docs

[Read more](https://nodes.guru/nibiru/setup-guide/en)
