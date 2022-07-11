

peggo service 

```
[Unit]
  Description=peggo

[Service]
  WorkingDirectory=/root/.peggo
  ExecStart=/bin/bash -c 'peggo orchestrator '
  Type=simple
  Restart=always
  RestartSec=1
  User=root

[Install]
  WantedBy=multi-user.target
```
