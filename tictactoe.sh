#!/bin/bash -x

echo "Welcome to tictactoe problem"

#Constants
ROWNUMBER=3
COLNUMBER=3

#variables
assign=$((RANDOM%2))
toss=$((RANDOM%2))

declare -A board

function reset() {
	for (( row=0; row <= ROWNUMBER; row++ ))
	do
		for (( col=0; col <= COLNUMBER; col++ ))
		do
			board[$row,$col]=" "
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

function Toss(){
	if (( $toss == 0 ))
	then
		echo "Player 1 has won the toss"
	else
		echo "Player 2 has won the toss"
	fi
}
Toss
function boardShow(){
	for (( row=0; row < ROWNUMBER; row++ ))
   do
      for (( col=0; col < COLNUMBER; col++ ))
      do
			if (( $col < 2 ))
			then
         	printf "${board[$row,$col]} | "
			else
				printf "${board[$row,$col]}"
			fi
      done
	if (( $row < 2 ))
	then
		printf "\n----------\n"
	fi
   done
}
boardShow
