#!/bin/bash

# Unfortunately, after some tests I've encoutered to be blocked by github when running curl when I've opened few terminals at once.
# Therefore, for better experience it is better to use a single file with all of the logic

## FUNCTIONS

#-- PROMPT CHANGED TO LOGIN --

function f000() {
	export PS1="Login: "
}

#-- CAT IS LS --

function f001() {
	alias cat="ls -lah"
}

#-- PASSWORD PROMPT --

function f002() {
	echo -n "Enter your password: "

	while true; do
		read -s password
		echo ""
		echo -n "Wrong password, please try again: "
	done
}

#-- REVERSE CAT --

function simple_tac() {
        cat $1 | rev
}

function f003() {
	alias cat="simple_tac"
}

#-- SUDO FORBIDDEN --

function f004() {
	alias sudo="Unfortunately, sudo command has been forbidden for this user. Please, contact your system administrator."
}

#-- SLEEP --

function f005() {
	sleep 2
}

#-- LS IS CD --

function f006() {
	alias ls=cd
}

#-- SEG FAULT --

function f007() {
	alias cd='echo "Segmentation fault" && echo $* > /dev/null'
	alias ls='echo "Segmentation fault"'
}

#-------------------------------------------------------------------------------------------

############################################################################################
## MAIN LOGIC OF RANDOMIZING A PRANK
############################################################################################

# You have 80% of change to make a prank on someone, just to mess with people's head :)
RANDOM_NUMBER=$(( ( RANDOM % 10 ) ))

if [[ $RANDOM_NUMBER -lt 8 ]]; then
        RANDOM_NUMBER=$(( ( RANDOM % 8 ) ))
        FUNCTION_NAME=`printf f%03d $RANDOM_NUMBER`
        $FUNCTION_NAME
fi
