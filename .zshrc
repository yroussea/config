export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"


plugins=(
	git 
	web-search
    zsh-autosuggestions
)

eval "$(zoxide init zsh)"
alias cdd='cd "$(dirname $(find ~ -type f | fzf))"'

source /home/yroussea/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

alias nvim="~/.nvim.appimage"
alias vim="nvim"
alias vi="vim ."


export PAGER="most"

alias work="cd ~/Documents/42"

alias neo="clear && neofetch"

alias ccf="cc -Wall -Werror -Wextra"
alias push="git add . && git commit && git push"

alias tree="exa --tree --icons"
alias ls="exa --icons"
alias l="exa -alh --icons"

alias cat="batcat"
alias ascii="batcat --style='plain' /etc/ascii"


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
alias tag="ctags -R ."

alias allias="vim ~/.zshrc"
alias zshrc="vim ~/.zshrc"
alias neorc="vim ~/.config/neofetch/config.conf"
alias vimrc="vim ~/.vimrc"
alias tmuxrc="vim ~/.tmux.conf"

alias tmux_bar="tmux set -g status"

alias google='f() {brave https://duckduckgo.com/$1 };f'

alias random_emojy='shuf -n 1 ~/.emojy | grep -m1 ""'
alias random_place='shuf -n 1 ~/.place | grep -m1 ""'


tmx () {
	if [ "$1" != "" ];then
		cd "$1"
	fi
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

alias norm="norminette | grep -v OK"
alias val="valgrind --track-fds=yes --track-origins=yes --show-leak-kinds=all --leak-check=full --trace-children=yes --suppressions=readline.supp"


#determines search program for fzf
if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
fi
#refer rg over ag
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

set -o vi


#bindkey -s '^p' --> fzf tmux popup (-p) into nvimm (waiting the stable version)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# opam configuration
[[ ! -r /home/yroussea/.opam/opam-init/init.zsh ]] || source /home/yroussea/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
