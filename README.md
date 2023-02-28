# nibiru-node
    docker build . -t nibiru
## Run

    docker run -d -e NIBIRU_NODENAME=MonPham -v /mnt/blockstore/nibiru/:/root/.nibid -p 26656:26656 -p 26657:26657 --name nibiru nibiru
## Snapshot
    docker stop nibiru
    <!-- docker exec -it nibiru /bin/bash -->
    <!-- apt install lz4 tar -y -->
    cd /mnt/blockstore/nibiru/
    SNAP_NAME=$(curl -s https://snapshots2-testnet.nodejumper.io/nibiru-testnet/info.json | jq -r .fileName)
    curl "https://snapshots2-testnet.nodejumper.io/nibiru-testnet/${SNAP_NAME}" | lz4 -dc - | tar -xf - -C .
## docs

[Read more](https://nodes.guru/nibiru/setup-guide/en)
