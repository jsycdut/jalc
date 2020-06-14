# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS environment variable
PS1="\e[0;31m[\e[0m\e[1;36m\u\e[0m\e[1;32m@\e[0m\e[1;33m\h\e[0m \e[3;35m\W\e[0m\e[1;31m]\e[0m\$\e[0m "

# load aliases
for alias_file in $HOME/.config/aliases; do
    source $alias_file
done

# load environment variables
for env_file in $HOME/.config/envs; do
    source $env_file
done
