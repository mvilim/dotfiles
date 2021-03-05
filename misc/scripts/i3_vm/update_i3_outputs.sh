set -e
set -x

display_from_res () {
    echo `xrandr | grep 'connected.*'$1'.*+' | sed 's/ .*//'`
}

left_output=`display_from_res 1080`
right_output=`display_from_res 1120`
left_output=${left_output:-Virtual1}
right_output=${right_output:-Virtual1}

./update_i3_config.sh $left_output $right_output
killall compton || true
i3-msg restart || true
sleep 1
./move_workspaces.sh $left_output $left_output $right_output $right_output
compton --backend glx -b
