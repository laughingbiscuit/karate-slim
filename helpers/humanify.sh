#!/bin/sh
set -e

sed "
s|I navigate to \(.*\)|driver(\1)|
s|I wait|delay(2000)|
s|I go back|back()|
s|I click \(.*\)|click('\1')|
s|I type \(.*\) into \(.*\)|input('input[name=\2]', '\1')|
s|the page says \(.*\)|match value('*') contains '\1'|
" "$@" 
