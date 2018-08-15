#!/bin/bash
# 
# nicholas eskie
# 
# all newly created resources are removed before script completes.
# intended to be reran everytime it complets via parent.sh
#

(wget https://nike.com/launch/?s=in-stock) && echo "wcopped"

(mv 'index.html?s=in-stock' parsable/index.html) && echo "renamed"

(awk '{gsub(/.{80}/,"&\n")}1' parsable/index.html | tee parsable/newindex.html) && echo "make readable"

(cat parsable/newindex.html | grep aria-label | tee parsable/aria-labelshit.txt) && echo "aria filtered"

(python3 striptxt.py) && echo "special chars and #s filtered"

#(rm parsable/aria-labelshit.txt parsable/aria-destination.txt) && touch parsable/aria-labelshit.txt parsable/aria-destination.txt
#uncomment when this script is ran recursively from a parent script