#!/bin/bash
sysname=`uname -n`
filenames='roguefile'
find / -type f -size +1G -printf '%s %p\n' > $filenames
count=`cat roguefile|wc -l`
if [$? -ne 0]
then
  date>>$filenames
  mail -s "Attention large rogue file found on $sysname" alarm@animapoint.net < $filenames
fi
	
