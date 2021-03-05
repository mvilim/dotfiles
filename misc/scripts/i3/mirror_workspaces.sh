#!/bin/bash

# should we generate this in some way?
# should dedupe this with the config files as well
i3-msg [workspace=11] move workspace to output fake-0
i3-msg [workspace=13] move workspace to output fake-0
i3-msg [workspace=15] move workspace to output fake-0
i3-msg [workspace=17] move workspace to output fake-0
i3-msg [workspace=19] move workspace to output fake-0

i3-msg [workspace=1] move workspace to output fake-0
i3-msg [workspace=3] move workspace to output fake-0
i3-msg [workspace=5] move workspace to output fake-0
i3-msg [workspace=7] move workspace to output fake-0
i3-msg [workspace=9] move workspace to output fake-0

i3-msg [workspace=0] move workspace to output fake-1
i3-msg [workspace=2] move workspace to output fake-1
i3-msg [workspace=4] move workspace to output fake-1
i3-msg [workspace=6] move workspace to output fake-1
i3-msg [workspace=8] move workspace to output fake-1

i3-msg [workspace=10] move workspace to output fake-1
i3-msg [workspace=12] move workspace to output fake-1
i3-msg [workspace=14] move workspace to output fake-1
i3-msg [workspace=16] move workspace to output fake-1
i3-msg [workspace=18] move workspace to output fake-1
