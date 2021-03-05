xset r rate 180 30
compton --backend glx -b
sshfs -o 'reconnect,ServerAliveInterval=15,nonempty' q.aq.tc:/q /q/
sshfs -o 'reconnect,ServerAliveInterval=15,nonempty' mvilim-desktop:/home/mvilim /home/mvilim/mvilim-desktop
