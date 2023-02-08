# nibiru-node
docker build . -t nibiru

cd  /mnt/blockstore/biniru/config 
wget https://networks.testnet.nibiru.fi/nibiru-testnet-2/genesis -O genesis.json

NETWORK=nibiru-testnet-2
sed -i 's|seeds =.*|seeds = "'$(curl -s https://networks.testnet.nibiru.fi/$NETWORK/seeds)'"|g' config.toml
sed -i 's|enable =.*|enable = true|g' config.toml
sed -i 's|rpc_servers =.*|rpc_servers = "'$(curl -s https://networks.testnet.nibiru.fi/$NETWORK/rpc_servers)'"|g' config.toml
sed -i 's|trust_height =.*|trust_height = "'$(curl -s https://networks.testnet.nibiru.fi/$NETWORK/trust_height)'"|g' config.toml
sed -i 's|trust_hash =.*|trust_hash = "'$(curl -s https://networks.testnet.nibiru.fi/$NETWORK/trust_hash)'"|g' config.toml


docker run -it -v /mnt/blockstore/nibiru/:/root/.nibid  --name nibiru nibiru tendermint unsafe-reset-all

docker run -it -d -v /mnt/blockstore/nibiru/:/root/.nibid -p 26656:26656 -p 26657:26657 --name nibiru nibiru --home /root/.nibid

https://nodes.guru/nibiru/setup-guide/en
