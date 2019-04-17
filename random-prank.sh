#!/bin/bash

# Unfortunately, after some tests I've encoutered to be blocked by github when running curl when I've opened few terminals at once.
# Therefore, for better experience it is better to use a single file with all of the logic

## FUNCTIONS

function simple_tac() {
        cat $1 | rev
}

## ALIASES

ALIASES=(
	#-- PROMPT CHANGED TO LOGIN --
	'export PS1="Login: "'

	#-- PASSWORD PROMPT --
	'echo -n "Enter your password: "; while true; do read -s password; echo ""; echo -n "Wrong password, please try again: "; done'

	#-- SUDO FORBIDDEN --
	'alias sudo="Unfortunately, sudo command has been forbidden for this user. Please, contact your system administrator."'

	#-- SLEEP --
	'sleep 5'

	#-- SOMETHING IS TERRIBLY WRONG
	'alias ls="cd"'
	'alias ls="df -h"'
	'alias ls="man bash"'
	'alias cat="simple_tac"'
	'alias cat="ls -lah"'
	'alias cat="df -h"'
	'alias man="ls -lah"'
	'alias man="cd /tmp/"'
	'alias cd="echo \"Segmentation fault\" && echo $* > /dev/null"; alias ls="echo \"Segmentation fault\"'
)

#-------------------------------------------------------------------------------------------

############################################################################################
## RANDOMIZING A PRANK
############################################################################################

RANDOM_PRANK=$[$RANDOM % ${#ALIASES[@]}]
echo "${ALIASES[$RANDOM_PRANK]}"
eval "${ALIASES[$RANDOM_PRANK]}"
