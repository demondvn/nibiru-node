#!/bin/bash


CHAIN_ID=nibiru-itn-1
NODE_HOME=$HOME/.nibid
nibid init "$NIBIRU_NODENAME" --chain-id="$CHAIN_ID"
echo 'export CHAIN_ID='\"${CHAIN_ID}\" >> $HOME/.bash_profile

sed -i 's|seeds =.*|seeds = "'$(curl -s https://networks.itn.nibiru.fi/$CHAIN_ID/seeds)'"|g' $NODE_HOME/config/config.toml
pruning="custom"
pruning_keep_recent="100"
pruning_keep_every="0"
pruning_interval="10"
sed -i -e "s/^pruning *=.*/pruning = \"$pruning\"/" $NODE_HOME/config/app.toml
sed -i -e "s/^pruning-keep-recent *=.*/pruning-keep-recent = \"$pruning_keep_recent\"/" $NODE_HOME/config/app.toml
sed -i -e "s/^pruning-keep-every *=.*/pruning-keep-every = \"$pruning_keep_every\"/" $NODE_HOME/config/app.toml
sed -i -e "s/^pruning-interval *=.*/pruning-interval = \"$pruning_interval\"/" $NODE_HOME/config/app.toml
sed -i -e "s/^minimum-gas-prices *=.*/minimum-gas-prices = \"0.025unibi\"/" $NODE_HOME/config/app.toml
sed -i 's|enable =.*|enable = true|g' $NODE_HOME/config/config.toml
sed -i 's|rpc_servers =.*|rpc_servers = "'$(curl -s https://networks.itn.nibiru.fi/$CHAIN_ID/rpc_servers)'"|g' $NODE_HOME/config/config.toml
sed -i 's|trust_height =.*|trust_height = "'$(curl -s https://networks.itn.nibiru.fi/$CHAIN_ID/trust_height)'"|g' $NODE_HOME/config/config.toml
sed -i 's|trust_hash =.*|trust_hash = "'$(curl -s https://networks.itn.nibiru.fi/$CHAIN_ID/trust_hash)'"|g' $NODE_HOME/config/config.toml


wget -O $HOME/.nibid/config/genesis.json https://raw.githubusercontent.com/Pa1amar/testnets/main/nibiru/nibiru-itn-1/genesis.json
nibid tendermint unsafe-reset-all

echo -e '\n\e[42mRunning\e[0m\n' && sleep 1
echo -e '\n\e[42mCreating a service\e[0m\n' && sleep 1


nibid start







