## ------------------------------------------------------------------
## Aliases. Yes I am lazy and bad at spelling.
## ------------------------------------------------------------------
alias gts="git status -sb"
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
alias rld="source ~/.finish.sh"
alias py3="python3"
alias rebar="rebar3"

## ------------------------------------------------------------------
## Path modifications.
## Need to review this tbh
## ------------------------------------------------------------------
PATH=/bin
PATH=$PATH:/sbin
PATH=$PATH:/usr/bin
PATH=$PATH:/usr/sbin
PATH=$PATH:/usr/local/bin
PATH=$PATH:/usr/local/Homebrew/bin/

# Erlang
PATH=$PATH:~/.cache/rebar3/bin

# Go
PATH=$PATH:/usr/local/go/bin

# Python
PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.4/bin
PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.7/bin

# OCaml
PATH=$PATH:~/.opam/4.04.0/bin
PATH=$PATH:/usr/local/Cellar/opam/1.2.2_4/bin
PATH=$PATH:/usr/local/Cellar/ocaml/4.04.0/bin

# Rust
PATH=$PATH:~/.cargo/bin/

# Tex
PATH=$PATH:/Library/TeX/Root/bin/x86_64-darwin/

export PATH

# OPAM configuration
. ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

## ------------------------------------------------------------------
## PS1
## ------------------------------------------------------------------
PS1="$ "
export PS1

#$0 --version | awk '{print "[-] " $0 }'
date | awk '{print "[!][" $5 "] Reloaded"}'
