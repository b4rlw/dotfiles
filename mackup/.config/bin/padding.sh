 #!/bin/dash

display=$( yabai -m query --displays --space | jq )
width=$( echo $display | jq '.frame.w')

if [ "$width" = "3440" ]; then
  windowcount=$(yabai -m query --windows --space | jq -r '[ .[] | select(."is-floating" == false and ."subrole" != "AXDialog" and ."stack-index" == 0) ] | length' )
  stackcount=$(yabai -m query --windows --space | jq -r '[ .[] | select(."is-floating" == false and ."subrole" != "AXDialog" and ."stack-index" == 1) ] | length' )
  totalcount=$((windowcount + stackcount))

  case "${totalcount}" in
    "1")
      yabai -m space --padding abs:24:34:522:522
    ;;
    *)
      yabai -m space --padding abs:24:34:34:34
    ;;
  esac
fi
