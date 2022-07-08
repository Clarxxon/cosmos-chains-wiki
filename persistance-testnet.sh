persistenceCore tendermint unsafe-reset-all --home /root/.persistenceCore
cp addrbook.json .starsd/config/addrbook.json 
sleep 1

SNAP_RPC=https://rpc.testnet.persistence.one:443

LATEST_HEIGHT=$(curl -s https://rpc.testnet.persistence.one:443/block | jq -r .result.block.header.height); \
BLOCK_HEIGHT=$((LATEST_HEIGHT - 1000)); \
TRUST_HASH=$(curl -s "https://rpc.testnet.persistence.one:443/block?height=$BLOCK_HEIGHT" | jq -r .result.block_id.hash)

# check
echo $LATEST_HEIGHT $BLOCK_HEIGHT $TRUST_HASH

sed -i.bak -E "s|^(enable[[:space:]]+=[[:space:]]+).*$|\1true| ; \
s|^(rpc_servers[[:space:]]+=[[:space:]]+).*$|\1\"https://rpc.testnet.persistence.one:443,https://rpc.testnet.persistence.one:443\"| ; \
s|^(trust_height[[:space:]]+=[[:space:]]+).*$|\1$BLOCK_HEIGHT| ; \
s|^(trust_hash[[:space:]]+=[[:space:]]+).*$|\1\"$TRUST_HASH\"| ; \
s|^(seeds[[:space:]]+=[[:space:]]+).*$|\1\"\"|" /root/.persistenceCore/config/config.toml
sleep 1

persistenceCore start --home /root/.persistenceCore
