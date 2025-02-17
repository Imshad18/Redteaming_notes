history
!9 : execute 9th command in history
!! : execute the last command

cat file.txt : read
head file.txt : read first 10 lines
tail file.txt : read last 10 lines

Find & Filter
cat file.txt | cut -f 1  : cut the first field
cat file.txt | cut -c1  : cut first column
cat file.txt | grep 'keywords'
cat file.txt | sort   : sort output alphabetically
cat file.txt | sort -n : sort output numerically
cat file.txt | uniq : eliminate duplicate lines
cat file.txt | wc -l : count line number
cat file.txt | nl  : show line numbers

Advanced
cat file.txt | sed -n '11p'   : print line 11
cat file.txt | sed -n '10,15p'  : print lines between 10 to 15
cat file.txt | awk 'NR < 11 {print $0}'   : print lines above line 11
cat file.txt | awk 'NR == 11 {print $0}'  : print line 11


sort | uniq    : removes duplicate
sort | uniq -c : removes duplicate & counts number of occurance of each value
sort -nr   : search numerically and recursively
rev : reverse strig characters
cut -f 1 : cut field 1
cut -d '.' -f 1-2  : split the string on every dot and keep the first 2 fields
grep -v 'test' : display lines that dont match the word test
grep -v -e 'test1' -e 'test2'  :  display lines that don't match one or both "test1" and "test2" strings.
file  : view file info
grep -rin Testvalue1 * | column -t | less -S  : search the "Testvalue1" string everywhere, organise column spaces and view the output with less.


python httpS server
 openssl req -new -x509 -keyout localhost.pem -out localhost.pem -days 365 -nodes
 python3 -c "import http.server, ssl;server_address=('0.0.0.0',443);httpd=http.server.HTTPServer(server_address,http.server.SimpleHTTPRequestHandler);httpd.socket=ssl.wrap_socket(httpd.socket,server_side=True,certfile='localhost.pem',ssl_version=ssl.PROTOCOL_TLSv1_2);httpd.serve_forever()"



