#!/bin/bash

sessions="$(tmux list-sessions | awk '{print $1}' | sed -e 's/://g')"

names=""

possiblities=("code" "std" "markdown" "qemu" "misc")

# compare all recomendations aka possiblities with
# existing sessions and list those which are not in use as
# options for creating a new Sessio
if [ $sessions == ""]
then
    tmux new -s std
    exit 1
fi

for pos in ${possiblities[*]}
do
	found=false
	for ses in $sessions
	do
		if [ "$ses" = "$pos" ]
		then
			found=true
		fi
	done
	if [ "$found" = "false" ]
	then
		names+="$pos\n"
	fi
done

sessions="$sessions\n"

mode=$(printf "$sessions[new]" | fzf --preview " if  [ {} != \[new\] ]; then tmux list-windows -t {}; fi")
# mode=$(printf "$sessions[new]" | rofi -dmenu)

if [ $mode = "[new]" ]
then
    # name=$(printf $names | rofi -dmenu)
    name=$(printf $names | fzf)
	if [ $name != "" ]
	then
		tmux new -s $name
	else
        tmux new
	fi
elif [ $mode != "" ]
then
	    tmux attach -t $mode
fi
