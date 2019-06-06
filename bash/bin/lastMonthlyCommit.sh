
#!/usr/bin/env bash

# A script to delete a local and remote git tag on the current repository
#
# Uasge
#    gitTagDelete -<tag name>
#
# Input
#   $1 - tagname
#
# Output
#   bash status: 0=OK, other=failed
#
OUTPUTFILE="~/work/gitCommit.log"
git log --pretty=format:'%H %cI' > ~/work/gitCommit.log

# handle line breaks properly; needed when a line has spaces or tabs
IFS=$'\n'

controlString=""
testString=""
finalString=""

for gitLogLine in `cat ~/work/gitCommit.log`
do
   # echo ${gitLogLine:41:7}
   testString="$(echo ${gitLogLine:41:7})"
   # echo $testString
   if [ "$testString" != "$controlString" ]
   then
      echo $gitLogLine
      controlString=$testString
   fi
done
