set -e
set -x

left_outer=$1
left_inner=$2
right_inner=$3
right_outer=$4

i3-msg [workspace=0] move workspace to output $right_inner
i3-msg [workspace=1] move workspace to output $left_inner
i3-msg [workspace=2] move workspace to output $right_inner
i3-msg [workspace=3] move workspace to output $left_inner
i3-msg [workspace=4] move workspace to output $right_inner
i3-msg [workspace=5] move workspace to output $left_inner
i3-msg [workspace=6] move workspace to output $right_inner
i3-msg [workspace=7] move workspace to output $left_inner
i3-msg [workspace=8] move workspace to output $right_inner
i3-msg [workspace=9] move workspace to output $left_inner
i3-msg [workspace=10] move workspace to output $right_outer
i3-msg [workspace=11] move workspace to output $left_outer
i3-msg [workspace=12] move workspace to output $right_outer
i3-msg [workspace=13] move workspace to output $left_outer
i3-msg [workspace=14] move workspace to output $right_outer
i3-msg [workspace=15] move workspace to output $left_outer
i3-msg [workspace=16] move workspace to output $right_outer
i3-msg [workspace=17] move workspace to output $left_outer
i3-msg [workspace=18] move workspace to output $right_outer
i3-msg [workspace=19] move workspace to output $left_outer
