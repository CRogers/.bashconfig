parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

function prompt {
	local BLUE="\[\e[0;34m\]"
	local CYAN="\[\e[0;36;1m\]"
	local GREEN="\[\e[0;32m\]"
	local BGREEN="\[\e[0;32m;1m\]"
	local CEND="\[\e[m\]" 

	PS1="$CYAN\w$GREEN\$(parse_git_branch)$CEND $ "
}

prompt