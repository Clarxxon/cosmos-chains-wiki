## restake script

### env
create env-variables `ph` and `addr`

```
echo $ph | defundd tx distribution withdraw-rewards defundvaloper1pp5vvnzvxw67ll8ls3ltjdl5n0nc6g43tq67j0 --gas-adjustment="1.5" --gas="2000000" --fees 50000ufetf --from=wallet -y
```
check balance 
```
defundd query bank balances $addr
```
