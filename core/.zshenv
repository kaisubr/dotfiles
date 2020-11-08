# Sourced on all invocations of the shell
# Includes exported variables such as $PATH
# export applies to forks & subshells

export HISTSIZE=500
export HISTFILESIZE=100000
export CONDA_AUTO_ACTIVATE_BASE=false
export GREP_COLORS="ms=38;5;0;48;5;73" # See 256color chart: https://askubuntu.com/questions/1042234/modifying-the-color-of-grep
export HISTCONTROL=ignoreboth

export PATH="/home/kailash/.local/bin":"/home/kailash/Desktop/LocalHome/Programs/texlive/2020/bin/x86_64-linux:$PATH"
export MANPATH="/home/kailash/Desktop/LocalHome/Programs/texlive/2020/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/home/kailash/Desktop/LocalHome/Programs/texlive/2020/texmf-dist/doc/info:$INFOPATH"

# Preferred editor local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    if command -v vim > /dev/null 2>&1; then
        export EDITOR='vim'
    else
        export EDITOR='nano'
    fi
else
    export EDITOR='vim'
fi
