#!/bin/bash

# Unfortunately, after some tests I've encoutered to be blocked by github when running curl when I've opened few terminals at once.
# Therefore, for better experience it is better to use a single file with all of the logic

## FUNCTIONS

#-------------------------------------------------------------------------------------------

function f001() {
	alias cat="ls -lah"
}

#-------------------------------------------------------------------------------------------

function f002() {
	echo -n "Enter your password: "

	while true; do
		read -s password
		echo ""
		echo -n "Wrong password, please try again: "
	done
}

#-------------------------------------------------------------------------------------------

function simple_tac() {
        cat $1 | rev
}

function f003() {
	alias cat="simple_tac"
}

#-------------------------------------------------------------------------------------------

############################################################################################
## MAIN LOGIC OF RANDOMIZING A PRANK
############################################################################################

RANDOM_NUMBER=$(( ( RANDOM % 3 )  + 1 ))
FUNCTION_NAME=`printf f%03d $RANDOM_NUMBER`

$FUNCTION_NAME 
