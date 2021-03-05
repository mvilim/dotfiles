rsync -r --progress ~/repos/$REPO/ --filter=':- .gitignore' --filter='+ .git/' $TARGET_HOST:repos/$REPO
lsyncd -nodaemon -delay 1 lsyncd.conf
