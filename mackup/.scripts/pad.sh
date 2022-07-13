#!/bin/zsh

panes=$(yabai -m query --windows --space | jq '[.[] | select(."app" != "Hammerspoon" and (."stack-index"==0 or ."stack-index"==1))] | length')
# hx_panes=$(yabai -m query --windows --space | jq '[.[] | select(."split-type" == "horizontal")] | length')

if [[ $panes -eq 1 ]]
then
    yabai -m space --padding abs:12:12:1024:1024
elif [[ $panes -eq 2 ]]
then
    yabai -m space --padding abs:12:12:482:482
elif [[ $panes -ge 3 ]]
then
    yabai -m space --padding abs:12:12:12:12
fi
    # if [[ $hx_panes -gt 0 ]]; then
    #     yabai -m window --toggle split
    # fi
