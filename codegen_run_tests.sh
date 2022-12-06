#!/bin/sh

for testfile in ./tests/codegen/sample_tests/good*.bminor
do 
    if ./bmake.sh $testfile > /dev/null 2>&1 ; then 
        echo "$testfile: success!"
    else
        echo "$testfile: failure!"
    fi
done
for testfile in ./tests/codegen/good*.bminor
do 
    if ./bmake.sh $testfile > /dev/null 2>&1 ; then 
        echo "$testfile: success!"
    else
        echo "$testfile: failure!"
    fi
done

