#!/bin/bash

amixer get Master | egrep -o "[0-9]+%" | uniq | while read line ; do
   echo $line
done


