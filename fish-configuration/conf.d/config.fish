set -gx PATH ~/.symfony/bin /usr/local/opt/gnu-sed/libexec/gnubin $PATH
set -gx PATH /usr/local/bin $PATH

alias vi="nvim"
alias vim="nvim"

eval (starship init fish)
