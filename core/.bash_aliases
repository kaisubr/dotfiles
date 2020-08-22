# ~/.bash_aliases : this file should be sourced from .bashrc

ALIASES="$HOME/.bash_aliases"
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -p --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# alias ls="ls -p"

alias lessc="less -R"
alias grepc="grep --color=always"
alias _less="less -R"
alias _grep="grep --color=always"
alias _tree="tree -C"

alias _?="cat -n $ALIASES | pygmentize -l bash | _less -S"
alias _ip="curl https://ifconfig.co"
alias _loc="curl https://tools.keycdn.com/geo.json | python -m json.tool | pygmentize -l json"
alias _go="cd ~/public_html"
alias _help="_?"

alias _rmxf-file="exiftool -all= "      #usage _rmxf-file file.pdf  (file.pdf)
                                        #usage _rmxf-file *         (all files in current directory)

alias _rmxf-rcrs="exiftool -all= -r "   #usage _rmxf-rcrs *.jpg ./  (all jpg in current directory AND subdirectories)

alias _duck='echo -e "\_o<"'
function _ducc {
    if [ $# -eq 0 ]; then
        exit 1 #$1=1
    fi
    for ((i = 0 ; i < $1 ; i++)); do
        printf "\\_o<   "
        sleep 0.1
    done
    printf "\n"
}

# eg$ _disk
alias _disk="df -h 2>/dev/null"

# eg$ _here ~/.public_html or _here * or simply _here .
function _here { 

    for val in "$@"; do #$1, $2, $3, ...
        du -sh "$val" 2>/dev/null
    done
    
    # du -sh "$str" 2>/dev/null
}

# stable. please use this.
# use libreoffice to convert to pdf
function _lpdf {
    for val in "$@"; do
        echo "==> $val <=="
        soffice --headless --convert-to pdf "$val" --outdir .
        echo
    done
}

function _lpdfc {
    for val in "$@"; do
        echo -e "\n[i] init $val..."
        (soffice --headless --convert-to pdf "$val" --outdir . > /dev/null 2>&1 && echo -e "\n[f] finished $val") &
    done
}
