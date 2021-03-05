left_output=$1
right_output=$2

replace_output ()
{
    echo "$1" | sed 's/set \$'$2'.*/set $'$2' '$3'/'
}

config=`cat ~/.config/i3/config`
config=$(replace_output "$config" left_outer $left_output)
config=$(replace_output "$config" left_inner $left_output)
config=$(replace_output "$config" right_inner $right_output)
config=$(replace_output "$config" right_outer $right_output)

echo "$config" > ~/.config/i3/config
