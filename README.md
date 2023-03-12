# nibiru-node
    docker build . -t nibiru
## Run change `MonPham` to yourself

    docker run -d -e NIBIRU_NODENAME=MonPham --restart unless-stopped -v /root/.nibid:/root/.nibid -p 26656:26656 -p 26657:26657 --name nibiru nibiru
## Snapshot
    docker stop nibiru
    
    cd /root/.nibid
    SNAP_NAME=$(curl -s https://snapshots2-testnet.nodejumper.io/nibiru-testnet/info.json | jq -r .fileName)
    curl "https://snapshots2-testnet.nodejumper.io/nibiru-testnet/${SNAP_NAME}" | lz4 -dc - | tar -xf - -C .
    wget https://api.nodes.guru/nibiru_addrbook.json -O config/addrbook.json
    docker start nibiru
## docs

[Read more](https://nodes.guru/nibiru/setup-guide/en)
