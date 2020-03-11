#!/bin/bash -x

echo "Welcome to tictactoe problem"

#Constants
ROWNUMBER=3
COLNUMBER=3

#variables
assign=$((RANDOM%2))

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

function assignLetter() {
	if (( $assign == 0 ))
	then
		Player1="X"
		Player2="O"
	else
		Player1="O"
		Player2="X"
	fi
}
assignLetter


