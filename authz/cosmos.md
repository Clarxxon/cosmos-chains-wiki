## Example gov message
```
{
  "chain_id": "osmosis-1",
  "account_number": "7879",
  "sequence": "4745",
  "fee": {
    "gas": "250000",
    "amount": [
      {
        "denom": "uosmo",
        "amount": "6250"
      }
    ]
  },
  "msgs": [
    {
      "type": "cosmos-sdk/MsgVote",
      "value": {
        "option": 1,
        "proposal_id": "231",
        "voter": "osmo1f3gq2a54u6547frv456ylkj45lkzh09ytur"
      }
    }
  ],
  "memo": ""
}
```

:atom_symbol: `"type": "cosmos-sdk/MsgVote"`
