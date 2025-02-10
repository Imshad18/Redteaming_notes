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





