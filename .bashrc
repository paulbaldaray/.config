##### Aliases #####
alias vbash="vim $HOME/.bashrc"
alias vbashp="vim $HOME/.bash_profile"
alias vvim="vim $HOME/.vim/vimrc"
alias rsptd="systemctl --user restart spotifyd"
alias startx="startx $HOME/.xinitrc"
export H="$HOME"
export D="$HOME/Downloads"
export B="$HOME/Bin"
export P="$HOME/Pictures"
##### Functions #####
function vlang() {
	[ $1 = "all" ] && vim $HOME/.vim/langcfg/*.vim || vim $HOME/.vim/langcfg/${1}.vim
}

function stpltx() {
	[ $# -eq 0 ] && echo Error: directory unspecified && return 1
	[ -d $1/src ] || mkdir $1/src
	[ -d $1/bin ] || mkdir $1/bin
	[ -d $1/aux ] || mkdir $1/aux
}

function mktmplt() {
	[ $# -ne 3 ] && echo Error: Expected 3 Arguments: tmpdir, tmpname, dest && return 1
	[ ! -d $HOME/Templates/$1 ] && echo Error: Template directory does not exist && return 1
	tmpdir=$1
	[ $1 = latex ] && tmpdir=$1/src
	[ ! -f $HOME/Templates/$tmpdir/$2.* ] && echo Error: Template \'$2\' does not exist in $tmpdir && return 1
	cp -r $HOME/Templates/$tmpdir/$2.* $3
}

##### Command Prompt #####
RCLR="\[\e[31m\]"
YCLR="\[\e[33m\]"
GCLR="\[\e[32m\]"
LCLR="\[\e[36m\]"
BCLR="\[\e[34m\]"
PCLR="\[\e[35m\]"
GRCLR="\[\e[90m\]"
WCLR="\[\e[37m\]"
export PS1="${RCLR}[${YCLR}\u${GCLR}@${LCLR}\h ${BCLR}\W${PCLR}]${GRCLR}$ ${WCLR}"
export CLICOLOR=1
export LSCOLORS="gxfxcxdxbxegedabagacad"
set -o vi

if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_prompt_command
fi

##### Exports #####
export TERMINAL="termite"
export EDITOR="vim"
export GTK_THEME="Materia:dark"
export BROWSER="firefox"
export GTK2_RC_FILES="/usr/share/themes/Materia-dark/gtk-2.0/gtkrc"
