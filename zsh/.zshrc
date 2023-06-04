# full color terminal
export TERM="xterm-256color"

# enable colors:
autoload -U colors && colors

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ls='exa --icons'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -s new -lF'

# aliases
alias bat='batcat'
alias cat='batcat'
alias df="df -h -x squashfs -x tempfs"
alias fzfa="fzf --height 75% --layout reverse --preview 'batcat --style=numbers --color=always {} | head -500'"
alias ncdu='ncdu --color dark'
alias fd='fdfind'

# theme bat (batcat)
# theme is located in ~/.config/bat/themes 
# theme downloaded from https://github.com/catppuccin/bat
export BAT_THEME="Catppuccin-mocha"

# custom color fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# replate ^c to ^X
stty intr \^X

# Basic auto/tab completion:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_opiont+=(globdots)  #include hidden files

# History in cache directory
setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

# Cycle through history based on characters already typed on the line
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search

# never beep
setopt NO_BEEP

# add zoxide (cd helper to navigat faster between directories)
eval "$(zoxide init zsh)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/oehzelt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/oehzelt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/oehzelt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/oehzelt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# load fzf integration
source /usr/share/doc/fzf/examples/completion.zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh

# load zsh plugins
source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
source ~/.config/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh # download from https://github.com/catppuccin/zsh-syntax-highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
