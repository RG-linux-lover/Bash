#!/bin/bash
# this is best way to handled argument 

echo "\$* gives $*"  # creates one single string that contains all the arg
echo "\$# gives $#"  # count arg
echo "\$@ gives $@"  # arg treated one by one
echo "\$0 gives $0"  # file name

#showing the interpretation of \$*
for i in "$*"
do
        echo $i
done

#Showing the interpretation of \$@
for j in "$@"
do
        echo $j
done

exit 0


