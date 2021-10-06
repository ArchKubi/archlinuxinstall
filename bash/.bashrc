#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

##-----------------------------------------------------
## synth-shell-greeter.sh
if [ -f /home/jayjames/.config/synth-shell/synth-shell-greeter.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/jayjames/.config/synth-shell/synth-shell-greeter.sh
fi

##-----------------------------------------------------
## synth-shell-prompt.sh
if [ -f /home/jayjames/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/jayjames/.config/synth-shell/synth-shell-prompt.sh
fi

##-----------------------------------------------------
## better-ls
if [ -f /home/jayjames/.config/synth-shell/better-ls.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/jayjames/.config/synth-shell/better-ls.sh
fi

##-----------------------------------------------------
## alias
if [ -f /home/jayjames/.config/synth-shell/alias.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/jayjames/.config/synth-shell/alias.sh
fi

##-----------------------------------------------------
## better-history
if [ -f /home/jayjames/.config/synth-shell/better-history.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/jayjames/.config/synth-shell/better-history.sh
fi
