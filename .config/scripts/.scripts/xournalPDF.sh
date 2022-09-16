#!/bin/zsh

# don't exit if no match is found
setopt +o nomatch

year=$(date +%Y)
month=$(date +%m)

currentSemesterDirectory="$HOME/ownCloud/Documents/Uni"

if [[ $month -le 9 && $month -ge 4 ]]
then
    currentSemesterDirectory="$currentSemesterDirectory/$year-SoSe"
elif [[ $month -ge 10 ]]
then
    currentSemesterDirectory="$currentSemesterDirectory/$year-WiSe"
elif [[ $month -le 3 ]]
then
    old_year=$(echo "$year - 1" | bc)
    currentSemesterDirectory="$currentSemesterDirectory/$old_year-WiSe"
    cd "$doc_dir/$year-WiSe"
fi

# Match
for subject_dir in $currentSemesterDirectory/*
do
    for week_dir in $subject_dir/*/
    do
        for file in $week_dir*
        do
            # Only match files ending with .xopp
            if [[ -f $file && $(echo $file | grep "\.xopp$") ]]
            then
                output_file=$(echo $file | sed s/.xopp$//g)
                echo $output_file
                xournalpp -p "$output_file.pdf" $file
            fi
        done
    done
done


