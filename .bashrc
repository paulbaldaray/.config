##### Sources #####
##### Aliases #####
alias vbash="vim $HOME/.bashrc"
alias vvim="vim $HOME/.vim/vimrc"
export H="$HOME"
##### Functions #####
function book() {
	[ $# -ne 1 ] && echo "Error: book not specified" && return 1
	[ ! -f "$HOME/Books/$1.pdf" ] && echo "Error: Book does not exist" && return 1
	open $HOME/Books/$1.pdf && exit 0
}

function vlang() {
	[ $1 = "all" ] && vim $HOME/.vim/langcfg/*.vim || vim $HOME/.vim/langcfg/${1}.vim
}

function vbin() {
	[ $# -eq 0 ] && echo "Error: program unspecified" && return 1
	PROGRAMS=""
	while (( "$#" )); do
		if [ -f "$HOME/Bin/$1" ]; then
			PROGRAMS="$PROGRAMS $HOME/Bin/$1"
		else
			echo "vbin: cannot open '$HOME/Bin/$1': No such file" && return 1
		fi
		shift
	done
	vim $PROGRAMS
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
export PS1="${RCLR}[${YCLR}\u${GCLR}@${LCLR}\h ${BCLR}\w${PCLR}]${GRCLR}$ ${WCLR}"
export CLICOLOR=1
export LSCOLORS="gxfxcxdxbxegedabagacad"
set -o vi

##### Exports #####
export TERMINAL="alacritty"
export GTK_THEME="Materia:dark"
export BROWSER="firefox"
export PATH="$HOME/Bin:$PATH"
