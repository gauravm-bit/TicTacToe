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
		if [[	$playCount == $TOTALCOUNT ]]
		then
			echo "Match tie"
		fi
		read -p "Player turn, Enter player position :" position

		case $position in
		1) if [[ ${board[0,0]} == " " ]]
		   then
				 board[0,0]=$player
		   else
				 printf "\ninvaild position Enter again\n"
				 playerTurn
		   fi
			;;
		2) if [[ ${board[0,1]} == " " ]]
		   then
				 board[0,1]=$player
		   else
				 printf "\ninvaild position Enter again\n"
				 playerTurn;
		   fi
      	;;
		3) if [[ ${board[0,2]} == " " ]]
		   then
				 board[0,2]=$player
		   else
				 printf "\ninvaild position Enter again\n"
				 playerTurn
		   fi
      	;;
		4) if [[ ${board[1,0]} == " " ]]
		   then
				board[1,0]=$player
		   else
				 printf "\ninvaild position Enter again\n"
		   playerTurn
		   fi
      	;;
		5) if [[ ${board[1,1]} == " " ]]
		   then
				 board[1,1]=$player
		   else
				 printf "\ninvaild position Enter again\n"
			playerTurn
		   fi
      	;;
		6) if [[ ${board[1,2]} == " " ]]
		   then
				 board[1,2]=$player
		   else
				 printf "\ninvaild position Enter again\n"
			playerTurn
		   fi
      	;;
		7) if [[ ${board[2,0]} == " " ]]
		   then
				 board[2,0]=$player
			 else
				 printf "\ninvaild position Enter again\n"
			playerTurn
		   fi
      	;;
		8) if [[ ${board[2,1]} == " " ]]
		   then
				 board[2,1]=$player
		   else
				printf "\ninvaild position Enter again\n" 
			playerTurn
		 	fi
      	;;
		9) if [[ ${board[2,2]} == " " ]]
		   then
				board[2,2]=$player;
			else
				printf "\ninvaild position Enter again\n"
			playerTurn
			fi
      	;;
		esac
	((playCount++))
	 boardShow
	if	[[ $(checkWin $player) == true ]]
	then
		printf "player won"
		exit
	fi
	computerTurn
}
function computerTurn(){
      if [[ $playCount == $TOTALCOUNT ]]
      then
         echo "Match tie"
      fi
      printf "\nComputer turn\n"
		position=$(( RANDOM%9 + 1 ))

      case $position in
      1) if [[ ${board[0,0]} == " " ]]
		   then
				 board[0,0]=$computer
			else
				 printf "\ninvaild position\n"
				 computerTurn
		   fi
      	;;
      2) if [[ ${board[0,1]} == " " ]]
		   then
				 board[0,1]=$computer
		   else
				 printf "\ninvaild position\n"
				 computerTurn
		   fi
     	 	;;
      3) if [[ ${board[0,2]} == " " ]]
		   then
				 board[0,2]=$computer
		   else
				printf "\ninvaild position\n"
				computerTurn
			fi
      	;;
      4) if [[ ${board[1,0]} == " " ]]
		   then
				 board[1,0]=$computer
		   else
				printf "\ninvaild position\n"
				computerTurn
			fi
     		;;
      5) if [[ ${board[1,1]} == " " ]]
		   then
				 board[1,1]=$computer
		   else
				printf "\ninvaild position\n"
				computerTurn
			fi
      	;;
      6) if [[ ${board[1,2]} == " " ]]
		   then
				 board[1,2]=$computer;
		   else
				 printf "\ninvaild position\n"
				 computerTurn
		   fi
      	;;
      7) if [[ ${board[2,0]} == " " ]]
		   then
				 board[2,0]=$computer
			else
				printf "\ninvaild position\n"
				computerTurn
		   fi
      	;;
      8) if [[ ${board[2,1]} == " " ]]
		   then
				 board[2,1]=$computer
		   else
				printf "\ninvaild position\n"
				computerTurn
			fi
      	;;
      9) if [[ ${board[2,2]} == " " ]]
		   then
				board[2,2]=$computer
		   else
				printf "\ninvaild position\n"
				computerTurn
			fi
      	;;
      esac
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
