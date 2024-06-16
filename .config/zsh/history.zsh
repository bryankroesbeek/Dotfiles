# Start typing + [Up-Arrow] - Find history forward
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search

bindkey -M emacs "${key[Up]}" up-line-or-beginning-search
bindkey -M viins "${key[Up]}" up-line-or-beginning-search
bindkey -M vicmd "${key[Up]}" up-line-or-beginning-search

# Start typing + [Down-Arrow] - Find history backward
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey -M emacs "${key[Down]}" down-line-or-beginning-search
bindkey -M viins "${key[Down]}" down-line-or-beginning-search
bindkey -M vicmd "${key[Down]}" down-line-or-beginning-search

# [Shift-Tab] - move through the completion menu backwards
bindkey -M emacs "${terminfo[kcbt]}" reverse-menu-complete
bindkey -M viins "${terminfo[kcbt]}" reverse-menu-complete
bindkey -M vicmd "${terminfo[kcbt]}" reverse-menu-complete

# [Ctrl-Delete] - delete whole word forwards
bindkey -M emacs '^[[3;5~' kill-word
bindkey -M viins '^[[3;5~' kill-word
bindkey -M vicmd '^[[3;5~' kill-word

# [Ctrl-Backspace] - delete whole word backwards
bindkey -M emacs '^H' backward-kill-word
bindkey -M viins '^H' backward-kill-word
bindkey -M vicmd '^H' backward-kill-word

# [Ctrl-RightArrow] - move forward one word
bindkey -M emacs '^[[1;5C' forward-word
bindkey -M viins '^[[1;5C' forward-word
bindkey -M vicmd '^[[1;5C' forward-word
# [Ctrl-LeftArrow] - move backward one word
bindkey -M emacs '^[[1;5D' backward-word
bindkey -M viins '^[[1;5D' backward-word
bindkey -M vicmd '^[[1;5D' backward-word

