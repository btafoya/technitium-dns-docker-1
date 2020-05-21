## Docker Run Example

```
docker run \
  --name=technitium-dns \
  -e TZ='America/Chicago' \
  -p 5380:5380 \
  -p 53:53 \
  -p 53:53/udp \
  -v /path/to/config/dir:/etc/dns/config \
  -v /path/to/log/dir:/etc/dns/config/logs \ # optional if you want a separate log dir
  btafoya/technitium-dns-docker:latest
```
