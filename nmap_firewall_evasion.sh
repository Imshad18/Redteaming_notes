nmap -sS -Pn -D 10.10.10.1,10.10.10.2,ME -F MACHINE_IP 
-D is decoy
if we dont put ME then nmap puts our IP randomnly

nmap -sS -Pn -D RND,RND,ME -F MACHINE_IP   : all randomn decoy 

nmap -sS -Pn --proxies 10.10.13.37 MACHINE_IP   : proxies, we can chain multiple proxies , --proxies PROXY_URL.

