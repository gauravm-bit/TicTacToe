#!/bin/bash -x

echo "Welcome to tictactoe problem"

#Constants
ROWNUMBER=3
COLNUMBER=3
TOTALCOUNT=9

#variables
assign=$((RANDOM%2))
toss=$((RANDOM%2))
playcount=0

declare -A board

function reset() {
	for (( row=0; row < ROWNUMBER; row++ ))
	do
		for (( col=0; col < COLNUMBER; col++ ))
		do
			board[$row,$col]=" "
		done
	done
}

function assignLetter() {
	if (( $assign == 0 ))
	then
		player="X"
		computer="O"
	else
		player="O"
		computer="X"
	fi
	echo "Player has been assigned $player"
   echo "Computer has been assigned $computer"

}

function boardShow(){
	for (( row=0; row < ROWNUMBER; row++ ))
   do
      for (( col=0; col < COLNUMBER; col++ ))
      do
			if (( col < 2 ))
			then
         	printf "${board[$row,$col]} | "
			else
				printf "${board[$row,$col]}"
			fi
      done
	if (( row < 2 ))
	then
		printf "\n----------\n"
	fi
   done
		printf "\n"
}

function checkWin(){
	playerinput=$1
	row=0
	column=0
	flag=false

	while [ $column -lt $COLNUMBER ]
	do
		if [[ ${board[$row,$column]}${board[$(($row+1)),$column]}${board[$(($row+2)),$column]} == $playerinput$playerinput$playerinput ]]
		then
			flag=true
			echo "$flag"
			return
		fi
		((column++))
	done

	row=0
	column=0

	while [ $row -lt $ROWNUMBER ]
	do
		if [[ ${board[$row,$column]}${board[$row,$(($column+1))]}${board[$row,$(($column+2))]} == $playerinput$playerinput$playerinput ]]
		then
			flag=true
			echo "$flag"
			return
		fi
		((row++))
	done

	row=0
	column=0

	if [[ ${board[$row,$column]}${board[$(($row+1)),$(($column+1))]}${board[$(($row+2)),$(($column+2))]} == $playerinput$playerinput$playerinput ]]
	then
		flag=true
		echo "$flag"
		return
	fi

	row=0
	column=$(($column+2))

	if [[ ${board[$row,$column]}${board[$(($row+1)),$(($column-1))]}${board[$(($row+2)),$(($column-2))]} == $playerinput$playerinput$playerinput ]]
	then
		flag=true
		echo "$flag"
		return
	fi

	echo "$flag"
}
function playerTurn(){
		count=1
		if [[	$playCount == $TOTALCOUNT ]]
		then
			echo "Match tie"
			exit
		fi
		read -p "Player turn, Enter player position :" position
		for (( i=0; i<$ROWNUMBER; i++ ))
		do
			for (( j=0; j<$COLNUMBER; j++))
			do
				if [[ $count == $position ]]
				then
					if [[ ${board[$i,$j]} == " " ]]
					then
						board[$i,$j]=$player
					else
						printf "\nInvalid move,Enter again\n"
						playerTurn
					fi
				fi
			((count++))
			done
		done

	((playCount++))
	 boardShow
	if	[[ $(checkWin $player) == true ]]
	then
		printf "player won"
		exit
	fi
	computerTurn
}

function winningLogic(){
    input=$1
   for (( i=0; i<$ROWNUMBER; i++ ))
   do
      if [[ ${board[$i,0]}${board[$i,1]} == $input$input ]]
      then
         if [[ ${board[$i,2]} == " " ]]
         then
            board[$i,2]=$input
            flag="true"
         fi
      elif [[ ${board[$i,1]}${board[$i,2]} == $input$input ]]
		then
			if [[ ${board[$i,0]} == " " ]]
			then
				board[$i,0]=$input
				flag="true"
			fi
		elif [[ ${board[$i,2]}${board[$i,0]} == $input$input ]]
		then
			if [[ ${board[$i,0]} == " " ]]
			then
				board[$i,0]=$input
				flag="true"
			fi
		fi
	done
	for (( i=0; i<$COLNUMBER; i++ ))
	do
		if [[ ${board[0,$i]}${board[1,$i]} == $input$input ]]
		then
			if [[ ${board[2,$i]} == " " ]]
			then
				board[2,$i]=$input
				flag="true"
			fi
		elif [[ ${board[1,$i]}${board[2,$i]} == $input$input ]]
		then
			if [[ ${board[0,$i]} == " " ]]
			then
				board[0,$i]=$input
				flag="true"
			fi
		elif [[ ${board[2,$i]}${board[0,$i]} == $input$input ]]
		then
			if [[ ${board[1,$i]} == " " ]]
			then
				board[1,$i]=$input
				flag="true"
			fi
	done
function computerTurn(){
		count=0
      if [[ $playCount == $TOTALCOUNT ]]
      then
         echo "Match tie"
      exit
      fi
      printf "\nComputer turn\n"
		position=$(( RANDOM%9 + 1 ))

		for (( i=0; i<$ROWNUMBER; i++ ))
      do
         for (( j=0; j<$COLNUMBER; j++ ))
         do
            if [[ $count == $position ]]
            then
               if [[ ${board[$i,$j]} == " " ]]
               then
                  board[$i,$j]=$computer
               else
                  printf "\nInvalid position by computer\n"
                  computerTurn
               fi
            fi
         ((count++))
         done
      done
   ((playCount++))
	boardShow
   if [[ $(checkWin $computer) == true ]]
   then
      printf "computer won"
		exit
   fi
   playerTurn
}

function Toss(){
   if (( $toss == 0 ))
   then
      echo "Player  has won the toss"
      playerTurn
   else
      echo "Computer has won the toss"
      computerTurn
   fi
}
reset
assignLetter
Toss
