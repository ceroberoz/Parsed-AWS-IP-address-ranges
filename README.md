[![auto-fetch-runner](https://github.com/ceroberoz/Parsed-AWS-IP-address-ranges/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/ceroberoz/Parsed-AWS-IP-address-ranges/actions/workflows/main.yml)

AWS IP address ranges from https://ip-ranges.amazonaws.com/ip-ranges.json

Parsed per service, region and IPs (v4 & v6) for convinience.

![alt text](https://github.com/ceroberoz/Parsed-AWS-IP-address-ranges/blob/main/sample-output.png?raw=true)

IP range checked and updated schedule to run at midnight (UTC time) on daily basis.

---

Too impatient waiting for daily update? Run `fetch-aws-ip-ranges.sh` script directly on your Linux / Mac terminal.

Required `curl` and `jq` installed before running Shell below.

Short URL
```
curl -fsSL https://s.id/parsed-aws-ip | sh
```

Long URL

```   
curl -fsSL https://raw.githubusercontent.com/ceroberoz/Parsed-AWS-IP-address-ranges/main/fetch-aws-ip-ranges.sh | sh
```

---

# Misc

Need Google Cloud Platform with same format? See my other repository

https://github.com/ceroberoz/Parsed-GCP-IP-address-ranges



Need only AWS Cloudfront IP regardless region? See my other repository

https://github.com/ceroberoz/Parsed-AWS-Cloudfront
