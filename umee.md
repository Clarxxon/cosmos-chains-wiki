

peggo service 

```
echo "[Unit]
Description=Peggo Service
After=network.target

[Service]
User=$USER
Type=simple
ExecStart=/usr/local/bin/peggo orchestrator $BRIDGE_ADDR \
  --bridge-start-height=\"$START_HEIGHT\" \
  --eth-rpc=\"$ETH_RPC\" \
  --relay-batches=true \
  --relay-valsets=false \
  --cosmos-chain-id=umee-1 \
  --cosmos-keyring-dir=\"$HOME/.umee\" \
  --cosmos-from=\"$ORCHESTRATOR_WALLET_NAME\" \
  --cosmos-from-passphrase=\"$ORCHESTRATOR_WALLET_PASSWORD\" \
  --cosmos-keyring=\"os\" \
  --log-level debug \
  --log-format text
Environment=\"PEGGO_ETH_PK=$PEGGO_ETH_PK\"
Restart=always
RestartSec=5
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target" > $HOME/peggod.service
sudo mv $HOME/peggod.service /etc/systemd/system
```
