## Band statesync script
```
sudo systemctl stop bandd.service

LATEST_HEIGHT=$(curl -s http://rpc.laozi1.bandchain.org:80/block | jq -r .result.block.header.height); \
BLOCK_HEIGHT=$((LATEST_HEIGHT - 1000)); \
TRUST_HASH=$(curl -s "http://rpc.laozi1.bandchain.org:80/block?height=$BLOCK_HEIGHT" | jq -r .result.block_id.hash)
```

### check and restart bandd
```
echo $LATEST_HEIGHT $BLOCK_HEIGHT $TRUST_HASH

sed -i.bak -E "s|^(enable[[:space:]]+=[[:space:]]+).*$|\1true| ; \
s|^(rpc_servers[[:space:]]+=[[:space:]]+).*$|\1\"http://rpc.laozi1.bandchain.org:80,http://rpc.laozi1.bandchain.org:80\"| ; \
s|^(trust_height[[:space:]]+=[[:space:]]+).*$|\1$BLOCK_HEIGHT| ; \
s|^(trust_hash[[:space:]]+=[[:space:]]+).*$|\1\"$TRUST_HASH\"| ; \
s|^(seeds[[:space:]]+=[[:space:]]+).*$|\1\"\"|" $HOME/.band/config/config.toml

bandd unsafe-reset-all
sudo systemctl restart bandd.service && journalctl -u bandd.service -f
```
