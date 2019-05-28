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
abbr norc bash --norc

function git_diff_ahead
    set branch (git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    git log --oneline origin/$branch..HEAD 2> /dev/null | wc -l
end

function git_diff_behind
    set branch (git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    git log --oneline HEAD..origin/$branch 2> /dev/null | wc -l
end

function ps1_git_info_c
    set repo (git rev-parse --show-toplevel 2> /dev/null)
    if [ $repo ]
        set repo (basename "$repo")
        set branch (git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
        set ahead (git_diff_ahead)
        set behind (git_diff_behind)
        set_color 666
        echo -n ":"
        #set_color purple
        #echo -n $branch
        if [ $ahead != 0 ]
            set_color blue
            echo -n $branch
            echo -n "+$ahead"
        end
        if [ $behind != 0 ]
            set_color red
            echo -n $branch
            echo -n "-$behind"
        end
        set num (math $ahead + $behind)
        if [ $num = 0 ]
            set_color green
            echo -n $branch
            #echo -n "😺 "
        end
        #set_color 666
        #echo -n ">"
    end
end

function fish_prompt
    set_color blue
    set u (echo $USER | head -c1)
    echo -n $u 
    set_color 666
    echo -n @
    set_color purple
    echo -n (hostname | sed -e "s/$USER\-//")
    set_color blue
    echo -n (prompt_pwd)
    set_color normal
    ps1_git_info_c
    set_color 666
    echo -n '$ '
    set_color normal
end
