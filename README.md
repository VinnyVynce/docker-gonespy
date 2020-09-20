# docker-gonespy
a dockerfile for gonespy

## Notes
This docker dosen't include DNS server software built-in. You can use any dns server software you want: MaraDNS, Unbound, etc.  
I'm using my Pi-hole as my DNS server. To add it on my pi-hole I created a new file in the dnsmasq.d directory: 42-reverse-proxied-subdomains.conf.
Here's the content of *42-reverse-proxied-subdomains.conf*:
```
address=/gamespy.com/10.7.0.136
address=/gamespy.net/10.7.0.136
```
Where 10.7.0.136 is your local ip address for gonespy.
