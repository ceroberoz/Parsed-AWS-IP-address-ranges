AWS IP address ranges from https://ip-ranges.amazonaws.com/ip-ranges.json

Parsed per service, region and IPs (v4 & v6) for convinience.

![alt text](https://github.com/ceroberoz/Parsed-AWS-IP-address-ranges/blob/main/sample-output.png?raw=true)

IP range checked and updated schedule to run at midnight (UTC time) on daily basis.

---

Too impatient waiting for daily update? Run `fetch-aws-ip-ranges.sh` script directly on your Linux / Mac terminal

Short URL
```
sh -c "$(curl -fsSL http://s.id/parsed-aws-ip)"
```

Long URL

```   
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ceroberoz/Parsed-AWS-IP-address-ranges/main/fetch-aws-ip-ranges.sh)"
```
