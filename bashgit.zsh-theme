if [ $UID -eq 0 ]; then 
    NCOLOR="red"; 
else 
    NCOLOR="green"; 
fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{$fg_bold[$NCOLOR]%}%n@%m\
%{$reset_color%}:%{$fg_bold[blue]%}%~\
$(git_prompt_info)\
%{$reset_color%}%{$fg[1]%}%(!.#.$)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

FG_CYAN="%{$fg[cyan]%}"
FG_RED="%{$fg[red]%}"
FG_GREEN="%{$fg[green]%}"
FG_YELLOW="%{$fg[yellow]%}"
FG_RESET="%{$reset_color%}"

# ≡ the branch matches its remote
# ↑ the branch is ahead of its remote
# ↓ the branch is behind its remote
# ↕ the branch is both ahead of and behind its remote


### git logic

# Outputs current branch info in prompt format
function git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$(prompt)"
  fi
}

function prompt() {
    GIT_AHEAD="$(command git rev-list origin/$(git_current_branch)..HEAD 2> /dev/null)"
    GIT_BEHIND="$(command git rev-list HEAD..origin/$(git_current_branch) 2> /dev/null)"

    ### Git remote status
    if [[ -n $GIT_AHEAD && $GIT_BEHIND ]]; then
        build_prompt "$FG_YELLOW" " ↕"
        return
    fi

    if [[ -n $GIT_AHEAD ]]; then
        build_prompt "$FG_GREEN" " ↑"
        return
    fi

    if [[ -n $GIT_BEHIND ]]; then
        build_prompt "$FG_RED" " ↓"
        return
    fi
    ###

    ### Git local status
    GIT_STAGED="$(command git diff --staged --name-only)"
    GIT_UNSTAGED="$(command git diff --name-only)"
    GIT_UNTRACKED="$(command git ls-files --others --exclude-standard)"

    if ! [[ -n "$(command git show-ref origin/$(git_current_branch) 2> /dev/null)" ]]; then
        build_prompt "$FG_CYAN" ""
        return
    fi

    if [[ ( -n $GIT_UNSTAGED || -n $GIT_UNTRACKED ) && -n $GIT_STAGED ]]; then
        build_prompt "$FG_CYAN" "$FG_YELLOW !$FG_CYAN"
        return
    fi

    if [[ -n $GIT_UNSTAGED || -n $GIT_UNTRACKED ]]; then
        build_prompt "$FG_CYAN" "$FG_RED !$FG_CYAN"
        return
    fi

    if [[ -n $GIT_STAGED ]]; then
        build_prompt "$FG_CYAN" "$FG_GREEN !$FG_CYAN"
        return
    fi
    build_prompt "$FG_CYAN" " ≡"
    ###
}

function build_prompt() {
    # $1 = the color
    # $2 = git indicator

    echo "$1 ($(git_current_branch)$2)$FG_RESET"
}

