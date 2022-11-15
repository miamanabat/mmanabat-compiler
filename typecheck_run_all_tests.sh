#!/bin/sh

BMINOR="./bminor"

for testfile in tests/typecheck/good*.bminor
do
	if $BMINOR -typecheck $testfile > /dev/null
	then
		echo "$testfile success (as expected)"
	else
		echo "$testfile failure (INCORRECT)"
	fi
done

for testfile in tests/typecheck/bad*.bminor
do
	if $BMINOR -typecheck $testfile > /dev/null
	then
		echo "$testfile success (INCORRECT)"
	else
		echo "$testfile failure (as expected)"
	fi
done
