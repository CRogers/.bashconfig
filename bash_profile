SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add $HOME/.ssh/id_rsa
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi 


export JAVA_HOME=$(/usr/libexec/java_home)
PATH="$HOME/.cabal/bin/:$HOME/.local/share/trails/bin/unix/:$JAVA_HOME/bin/:$PATH"


export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias ls='ls -GpF'
#function cd() { builtin cd && ls }


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

export MARKPATH=$HOME/.marks
function jump { 
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
alias j='jump'
function mark { 
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark { 
    rm -i "$MARKPATH/$1"
}
function marks {
    \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}
