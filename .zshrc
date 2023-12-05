# ZShell Configuration:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Commands
alias grep='grep --color=auto'
alias rm='rm -Iv'
alias rmdir='rmdir -v'
alias mkdir='mkdir -v'
alias cp='cp -v'
alias mv='mv -v'
alias df='df -h'
alias ls='ls -h'
alias du='du -h'

# Defines different colors for files in ls output:
alias ls='ls --color'
LS_COLORS='no=00:fi=00:di=00;95:ln=01;36:pi=40;33:so=01;34:do=01;34:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;92:*.tar=01;31:*.tgz=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jpg=01;36:*.jpeg=01;36:*.gif=01;36:*.xpm=01;91:*.tif=01;91:*.tiff=01;91:*.png=01;91:*.mov=01;91:*.mpg=01;91:*.mpeg=01;91:*.avi=01;91:*.fli=01;91:*.gl=01;91:*.dl=01;91:*.xcf=01;91:*.xwd=01;91:*.ogg=01;91:*.mp3=01;91:*.wav=01;91:*.xml=00;91:*.mp4=01;91:*.m4a=01;91:'
export LS_COLORS

# VI Mode:
bindkey -v
export KEYTIMEOUT=1

# Auto/Tab complete:
autoload -U compinit
zstyle ":completion:*" menu select

# Load syntax highlighting; should be last.
source /home/ben/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
