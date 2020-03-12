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

function assignLetter() {
	if (( $assign == 0 ))
	then
		Player="X"
		Computer="O"
	else
		Player="O"
		Computer="X"
	fi
	echo "Player has been assigned $Player"
   echo "Computer has been assigned $Computer"

}

function Toss(){
	if (( $toss == 0 ))
	then
		echo "Player  has won the toss"
	else
		echo "Computer has won the toss"
	fi
}
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
function checkWin(){
	rows=0
	column=0
	playerinput=$1
	flag=false
		while [[ column -lt COLNUMBER ]]
		do
			if [[ ${board[$row,$column]}${board[$(($row+1)),$column]}${board[$(($row+2)),$column]} == $playerinput$playerinput$playerinput ]]
			then
					flag=true
					echo $flag
			fi
			((column++))
		done

	rows=0
	column=0

		while [[ rows -lt ROWNUMBER ]]
         do
            if [[ ${board[$row,$column]}${board[$row,$(($column+1))]}${board[$row,$(($column+2))]} == $playerinput$playerinput$playerinput ]]
			   then
                  flag=true
                  echo $flag
            fi
            ((rows++))
          done

	rows=0
	column=0

		if [[ ${board[$row,$column]}${board[$(($row+1)),$(($column+1))]}${board[$(($row+2)),$(($column+2))]} == $playerinput$playerinput$playerinput ]]
		then
			flag=true
			echo $flag
		fi

	rows=0
	column=0

		if [[ ${board[$row,$(($column+2))]}${board[$(($row+1)),$(($column+1))]}${board[$(($row+2)),$column]} == $playerinput$playerinput$playerinput ]]
		then
			flag=true
			echo $flag
		fi
		}
reset
assignLetter
Toss
boardShow
checkWin $Player
