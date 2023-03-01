#!/bin/bash


CHAIN_ID='nibiru-itn-1'
NODE_HOME='$HOME/.nibid'
nibid config keyring-backend test
nibid init "$NIBIRU_NODENAME" --chain-id="$CHAIN_ID"
echo 'export CHAIN_ID='\"${CHAIN_ID}\" >> $HOME/.bash_profile


PEERS=""

sed -i 's|seeds =.*|seeds = "'$(curl -s https://networks.itn.nibiru.fi/$CHAIN_ID/seeds)'"|g' $HOME/.nibid/config/config.toml
sed -i 's|^persistent_peers *=.*|persistent_peers = "'$PEERS'"|' $HOME/.nibid/config/config.toml
sed -i 's|^prometheus *=.*|prometheus = true|' $HOME/.nibid/config/config.toml


# sed -i 's|^pruning *=.*|pruning = "custom"|g' $HOME/.nibid/config/app.toml
# sed -i 's|^pruning-keep-recent  *=.*|pruning-keep-recent = "100"|g' $HOME/.nibid/config/app.toml
# sed -i 's|^pruning-interval *=.*|pruning-interval = "10"|g' $HOME/.nibid/config/app.toml
# sed -i 's|^snapshot-interval *=.*|snapshot-interval = 2000|g' $HOME/.nibid/config/app.toml
# sed -i 's|^minimum-gas-prices *=.*|minimum-gas-prices = "0.0001unibi"|g' $HOME/.nibid/config/app.toml




curl -s https://rpc.itn-1.nibiru.fi/genesis | jq -r .result.genesis > $HOME/.nibid/config/genesis.json
# nibid tendermint unsafe-reset-all --home $HOME/.nibid --keep-addr-book
# wget https://api.nodes.guru/nibiru_addrbook.json -o $HOME/.nibid/config/addrbook.json
echo -e '\n\e[42mRunning\e[0m\n' && sleep 1
echo -e '\n\e[42mCreating a service\e[0m\n' && sleep 1


nibid start --home $HOME/.nibid







