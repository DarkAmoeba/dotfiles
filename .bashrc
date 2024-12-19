# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

export PATH="$HOME/anaconda/bin:/usr/local/anaconda/bin:$PATH:."

# Create files with group write
umask 0002


if [ $USER != "rkni" ]; then
	PS1="\[\e[0;93m\]\u@\h\[\e[m\]:\w> "
elif [ $HOSTNAME == "aps01" ]; then
	PS1="\[\e[0;32m\]\u@\h\[\e[m\]:\w> "
	stty -ixon
	export LD_LIBRARY_PATH=/usr/local/unixODBC/lib
elif [ $HOSTNAME == "aps03" ]; then
	PS1="\[\e[0;91m\]\u@\h\[\e[m\]:\w> "
	export RADAR_INFO_PLATFORM_NODE="aps01"
	export LD_LIBRARY_PATH=/usr/local/unixODBC/lib
elif [ $HOSTNAME == "aps04" ]; then
	PS1="\[\e[0;34m\]\u@\h\[\e[m\]:\w> "
elif [ $HOSTNAME == "aps05" ]; then
	PS1="\[\e[0;34m\]\u@\h\[\e[m\]:\w> "
elif [ $HOSTNAME == "aps06" ]; then
	PS1="\[\e[0;96m\]\u@\h\[\e[m\]:\w> "
elif [ $HOSTNAME == "aps07" ]; then
	PS1="\[\e[0;95m\]\u@\h\[\e[m\]:\w> "
else
	PS1="\[\e[0;96m\]\u@\h\[\e[m\]:\w> "
fi


# prevent items with a leading space being added to history
HISTCONTROL=ignoreboth

#alias lsshr='ls --ignore=aps* --ignore=*.pyc --ignore=550q* --ignore=flosys* --ignore=itec*'
#alias view='vim -R'
#stty -ixon

# export SPARK_HOME=/opt/pkg/spark
# export PATH=$SPARK_HOME/bin:$PATH
# export PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.7-src.zip:$PYTHONPATH
export EDITOR=/usr/bin/vim

function pretty_csv {
    perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | less  -F -S -X -K
}
function pretty_tsv {
    perl -pe 's/((?<=\t)|(?<=^))\t/ \t/g;' "$@" | column -t -s $'\t' | less  -F -S -X -K
}

alias gl='git log --oneline -n 10'
alias gll='git log --oneline --stat -n 5'
alias gs='git status'
alias gsw='git switch'
alias gd='git diff'
alias gr='python -m tools.git_refresh'
alias gb='git branch'
alias th='cd ~/toast'
alias fh='cd ~/toast/foursight/foursight'
alias ih='cd ~/toast/itec/itec'
alias eh='cd ~/toast/excds/excds'
alias pygrep='grep -r --include \*.py'
alias rgrep='grep -Ir'
alias sshf="ssh foursight@aps07"
alias sshta="ssh toastadm@aps03"
alias c="clear"
alias ..="cd .."
alias gh="history | grep"
alias fc="python -m foursight.control"
alias ic="python -m itec.control"
alias ec="python -m excds.control"

# Unset the prompt command to stop it overwriting the screen tab name
unset PROMPT_COMMAND


# PYTHON311="/usr/local/CONDA/conda_toast-3.11.01/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:.:/home/rkni/.local/bin:/home/rkni/bin"
# PYTHON37="/usr/local/CONDA/conda_toast-3.7.11/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:.:/home/rkni/.local/bin:/home/rkni/bin"
# DEFAULT="$HOME/anaconda/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:.:/home/rkni/.local/bin:/home/rkni/bin"

# alias eleven='export PATH=$PYTHON311'
# alias seven='export PATH=$PYTHON37'
# alias default='export PATH=$DEFAULT'

export NUMEXPR_MAX_THREADS=16
