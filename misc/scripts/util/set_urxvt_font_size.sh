FONT_SIZE=${1:-11}
FONT_STRING="xft:Hack:pixelsize=$FONT_SIZE,xft:NanumGothicCoding"
for pts in $(ps x -o tty= | sort -u); do
  case "$pts" in pts/*) printf '\33]50;%s\007' $FONT_STRING > "/dev/$pts";; esac
done
