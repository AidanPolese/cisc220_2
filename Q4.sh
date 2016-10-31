#Loop through Queen's IPs to find computing sub-domains
#Manvir Grewal : 10193283
#Aiden Polese : 10197342
#Kathleen Abols : 10179548
#!/bin/bash

printf "IP Address: %-11s Name:\n"

for ((i=0; i<=255; i++)); do  #there are none for 0 so it takes a while
        for ((j=0; j<=255; j++)); do

                nslookup 130.15.${i}.${j} | grep -w "name" | grep ".cs.queensu.ca" | awk '{print $1 "\t" $4}'

        done
done
