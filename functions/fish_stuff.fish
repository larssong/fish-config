[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

#find . -type d -mindepth 1 -maxdepth 1 -exec autojump --add \{\} \;

abbr c cd ~/Code
abbr co git checkout
abbr wtf git status
abbr s git status
abbr d git diff -w
abbr m git merge
abbr b git branch -v
abbr push git push
abbr pu git push
abbr pull git pull
abbr pl git pull
abbr lol git lol
abbr l colorls -lA --sd
#abbr staging git push origin HEAD:staging
#abbr deploy git push origin HEAD:deploy
