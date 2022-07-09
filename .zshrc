# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history


autoload -Uz cominit
compinit -u

export CLICOLOR=1

function left-prompt {
	name_t='179m%}'
	name_b='000m%}'
	path_t='255m%}'
	path_b='031m%}'
	arrow='087m%}'
	text_color='%{\e[38;5;'
	back_color='%{\e[30;48;5;'
	reset='%{\e[0m%}'
	sharp="\uE0B0"
	user="${back_color}${name_b}${text_color}${name_t}"
	dir="${back_color}${path_b}${text_color}${path_t}"
	echo ""
	echo "${user}%n@%m${back_color}${path_b}${text_color}${name_b}${sharp} ${dir}%~${reset}${text_color}${path_b}${sharp}${reset}${text_color}${arrow} ${reset}"
}

PROMPT=`left-prompt`

function precmd() {
	if [ -z "$NEW_LINE_BEFORE_PROMT" ]; then
		NEW_LINE_BEFORE_PROMPT=1
	elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
		echo ""
	fi
}

setopt prompt_subst

