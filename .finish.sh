## ------------------------------------------------------------------
## Aliases. Yes I am lazy and bad at spelling.
## ------------------------------------------------------------------
alias gts="git status"
alias gtc="git checkout"
alias gtb="git branch"
alias gtd="git diff"
alias gth="git log --oneline --graph --color=auto --decorate --all"
alias vum="vim"
alias vin="vim"
alias grep="grep --color" #Color matches
alias ls="ls -G" #Color ls results
alias ll='ls -hlSr'
alias cd..="cd .." # Because typing a space is so hard.
alias rld=". ~/.finish.sh"

## ------------------------------------------------------------------
## Path modifications.
## ------------------------------------------------------------------
PATH=$PATH:/Users/Artlac/.cache/rebar3/bin
PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.4/bin
export PATH
alias rebar="rebar3"
export GOPATH=~/Workspace/


# OPAM configuration
#. /Users/Artlac/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true



## ------------------------------------------------------------------
## PS1
## ------------------------------------------------------------------
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
 }
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    PS1='🚨 \\h: '
else
    PS1="\[\033[94m\]$(parse_git_branch)\]\[\033[0m\] 🖍 : "
fi

date | awk '{print "[!][" $5 "] Reloaded"}'
