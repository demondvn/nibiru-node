# nibiru-node
docker build . -t nibiru

cd  /mnt/blockstore/biniru/config && wget wget https://networks.testnet.nibiru.fi/nibiru-testnet-2/genesis -O genesis.json

docker run -it -v /mnt/blockstore/nibiru/:/root/.nibid  --name nibiru nibiru tendermint unsafe-reset-all

docker run -it -d -v /mnt/blockstore/nibiru/:/root/.nibid -p 26656:26656 -p 26657:26657 --name nibiru nibiru --home /root/.nibid

https://nodes.guru/nibiru/setup-guide/en
