export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

####		plugins
plugins=(
	git 
	web-search
    zsh-autosuggestions
)

eval "$(zoxide init zsh)"
source /home/yroussea/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH/oh-my-zsh.sh



####		NVIM
export EDITOR='vim'

alias nvim="~/.nvim.appimage"
alias vim="nvim"
alias vi="vim ."



####		C programing
alias norm="norminette | grep -v OK" #42 norm
alias val="valgrind --track-fds=yes --track-origins=yes --show-leak-kinds=all --leak-check=full --trace-children=yes"
alias ccf="cc -Wall -Werror -Wextra"



####		usefull / beautifull
alias push="git add . && git commit && git push"
alias tree="exa --tree"
alias ls="exa"
alias l="exa -alh"
export PAGER="most"
alias cat="batcat"



####		smooth movement between folders
alias cdd='cd "$(dirname $(find ~ -type f | fzf))"'
alias work="cd ~/Documents/42"

if [[ ! -v "${TMUX}" ]]; then
	export FZF_DEFAULT_DIR=$PWD && export FZF_COMMON_PATH=$PWD
else
	export FZF_DEFAULT_DIR="~" && export FZF_COMMON_PATH="~"
fi

common_path() {
	export FZF_COMMON_PATH="$(python3 ~/.pwd_common.py $PWD $FZF_DEFAULT_DIR)"
}

go_to_et_actualise_common_path()
{
	if [[ -n $# ]]; then
		z $*
	else
		z $FZF_DEFAULT_DIR
	fi
	common_path
}

alias cd="go_to_et_actualise_common_path"

if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
fi
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

##bindkey -s '^p' --> fzf tmux popup (-p) into nvimm (waiting the stable version)

alias tag="ctags -R ."



####		tmux
tmx () {
	local TMUX_S_NAME="$(random_emojy) "
    tmux new-session -d -s $TMUX_S_NAME
	tmux rename-window $(random_place)
    tmux attach-session -d -t $TMUX_S_NAME
}

alias texit="tmux kill-session"

tsave () {
	local TMUX_S_NAME="$(tmux ls | grep '(attached)' | awk '{print $1}')"
	tmux rename-session "$TMUX_S_NAME $1"
	tmux detach
}

alias tmux_bar="tmux set -g status"



####		don't ask why
alias google='f() {brave https://duckduckgo.com/$1 };f'
##		quite funny
alias random_emojy='shuf -n 1 ~/.emojy | grep -m1 ""'
alias random_place='shuf -n 1 ~/.place | grep -m1 ""'
##		config files
alias zshrc="vim ~/.zshrc"
alias tmuxrc="vim ~/.tmux.conf"
set -o vi #vim shortcut in terminal



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

