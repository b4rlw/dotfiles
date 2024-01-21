#!/bin/bash

dir=$1
window=$(yabai -m query --windows --window | jq -r '.id')

# stack focused window into window/stack
yabai -m window $dir --stack $window

# unstack if stacked and no valid stack target
if [ $? -ne 0 ] && (yabai -m query --windows --window | jq -e '."stack-index" != 0'); then
  yabai -m window --insert $dir \
    && yabai -m window $window --toggle float \
    && yabai -m window $window --toggle float

# rotate if already unstacked and no valid stack target
# right
elif (yabai -m query --windows --window | jq -e '.frame | .x > 0 and .y < 33'); then
  if [ "$dir" = "south" ]; then
    yabai -m space --rotate 270
  elif [ "$dir" = "north"  ]; then
    yabai -m space --rotate 90
  fi
# left
elif (yabai -m query --windows --window | jq -e '.frame | .x == -0 and .y < 33 and .h > 900'); then
  if [ "$dir" = "south" ]; then
    yabai -m space --rotate 90
  elif [ "$dir" = "north" ]; then
    yabai -m space --rotate 270
  fi
# top
elif (yabai -m query --windows --window | jq -e '.frame | .x == -0 and .y < 33 and .w > 1500' ); then
  if [ "$dir" = "west" ]; then
    yabai -m space --rotate 90
  elif [ "$dir" = "east" ]; then
    yabai -m space --rotate 270
  fi
# bottom
elif (yabai -m query --windows --window | jq -e '.frame | .x == 0 and .y > 32 and .w > 1500'); then
  if [ "$dir" = "east" ]; then
    yabai -m space --rotate 90
  elif [ "$dir" = "west" ]; then
    yabai -m space --rotate 270
  fi
fi
