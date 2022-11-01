#!/bin/sh

BMINOR="./bminor"

rm outall

for testfile in tests/printer/good*.bminor
do
    if $BMINOR -print $testfile > output1
    then
        $BMINOR -print output1 > output2
	    if cmp -s output1 output2
	    then
		    echo "$testfile success (as expected)"
	    else
		    echo "$testfile failure (INCORRECT)"
	    fi
    else
        echo "$testfile success (INCORRECT)"
    fi
    
done

for testfile in tests/printer/bad*.bminor
do
    if $BMINOR -print $testfile > output1
    then
        echo "$testfile success (INCORRECT)"
    else
        echo "$testfile failure (as expected)"
    fi
done
