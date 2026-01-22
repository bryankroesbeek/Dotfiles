# Set up the prompt

autoload -Uz promptinit
promptinit
# PROMPT=$(~/repos/go-prompt/prompt zsh)
# RPS1="%?"
# source ~/repositories/dotfiles/bashgit.zsh-theme

# Add this function to your .bashrc file
function set_custom_prompt {
    # TODO: Use proper path the executable instead of repo path
    PROMPT="$(~/repos/emerald-prompt/bin/emerald zsh)"
}

# Add the function to precmd to update the prompt dynamically
precmd_functions+=(set_custom_prompt)


setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/bryan/.zshrc'

autoload -Uz compinit
zmodload zsh/complist
compinit
# End of lines added by compinstall

### Custom config
source ~/.config/zsh/init.zsh

PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.local/scripts"

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]=fg=4
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=2
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=10

ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=3
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=11
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]=fg=9
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]=fg=9
ZSH_HIGHLIGHT_STYLES[default]=fg=14

export COLORTERM="truecolor"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval $(thefuck --alias)
