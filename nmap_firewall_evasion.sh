1. Evasion via Controlling the Source MAC/IP/Port

nmap -sS -Pn -D 10.10.10.1,10.10.10.2,ME -F MACHINE_IP 
-D is decoy
if we dont put ME then nmap puts our IP randomnly

nmap -sS -Pn -D RND,RND,ME -F MACHINE_IP   : all randomn decoy 

nmap -sS -Pn --proxies 10.10.13.37 MACHINE_IP   : proxies, we can chain multiple proxies , --proxies PROXY_URL.

--spoof-mac MAC_ADDRESS  , but we should be on the same network 

Spoof IP address: -S IP_ADDRESS
This will only work if we have access to the spoofed IP device soo we can capture the response

To fix a particular source port to confuse firewall -g or --source-port 


Evasion Approach	                                                  Nmap Argument
Hide a scan with decoys	                                      -D DECOY1_IP1,DECOY_IP2,ME
Hide a scan with random decoys	                                    -D RND,RND,ME
Use an HTTP/SOCKS4 proxy to relay connections                   	--proxies PROXY_URL
Spoof source MAC address	                                      --spoof-mac MAC_ADDRESS
Spoof source IP address	                                            -S IP_ADDRESS
Use a specific source port number                    	-g PORT_NUM or --source-port PORT_NUM

_________________________________________________________________________________________________________________________________

2. Evasion via Forcing Fragmentation, MTU, and Data Length

nmap -sS -Pn -f -F MACHINE_IP       -f will fragment the packet to carry 8 bytes only,        -ff will do 16 bytes
nmap -sS -Pn --mtu 8 -F MACHINE_IP    --mtu specifies how many bytes we wan tto sed , it should be in the multiple of 8
nmap -sS -Pn --data-length 64 -F MACHINE_IP        --data-length specific size of fragments, should be in multiple of 8


