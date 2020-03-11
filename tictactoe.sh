#!/bin/bash -x

echo "Welcome to tictactoe problem"

#Constants
ROWNUMBER=3
COLNUMBER=3

declare -A board

function reset() {
	for (( row=0; row <= ROWNUMBER; row++ ))
	do
		for (( col=0; col <= COLNUMBER; col++ ))
		do
			board[$row,$col]=""
		done
	done
}
reset


