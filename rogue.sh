#!/bin/bash
sysname=`uname -n`
filename='roguefile'
find / -type f -size +1G -printf '%s %p\n' > $filename
count=`cat roguefile|wc -l`
if [$? -ne 0]
then
  date>>$filename
  mail -s "Attention large rogue file found on $sysname" alarm@animapoint.net < $filename
fi
	
