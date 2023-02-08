# nibiru-node
docker build . -t nibiru

cd  /mnt/blockstore/biniru/ && wget wget https://networks.testnet.nibiru.fi/nibiru-testnet-2/genesis

docker run -it -v /mnt/blockstore/biniru/:/root/.nibid  --name nibiru nibiru nibid tendermint unsafe-reset-all

docker run -it -d -v /mnt/blockstore/biniru/:/root/.nibid -p 26656:26656 -p 26657:26657 --name nibiru nibiru --home /root/.nibid

https://nodes.guru/nibiru/setup-guide/en
