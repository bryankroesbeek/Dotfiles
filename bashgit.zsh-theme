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

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%} ("
# CUSTOM_GIT_COLOR_NORMAL="%{$fg_bold[cyan]%}"
# CUSTOM_GIT_BRACKET_COLOR="%{$reset_color%}%{$fg_bold[white]%}"
# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_NORMAL="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED_AND_STAGED="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_DIVERGED="%{$fg[yellow]%}"

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
    ### Git remote status
    if [[ -n "$(command git rev-list origin/$(git_current_branch)..HEAD 2> /dev/null)" && "$(command git rev-list HEAD..origin/$(git_current_branch) 2> /dev/null)" ]]; then
        build_prompt "$ZSH_THEME_GIT_PROMPT_DIVERGED" " ↕"
        return
    fi
    if [[ -n "$(command git rev-list origin/$(git_current_branch)..HEAD 2> /dev/null)" ]]; then
        build_prompt "$ZSH_THEME_GIT_PROMPT_AHEAD" " ↑"
        return
    fi 
    if [[ -n "$(command git rev-list HEAD..origin/$(git_current_branch) 2> /dev/null)" ]]; then
        build_prompt "$ZSH_THEME_GIT_PROMPT_BEHIND" " ↓"
        return
    fi
    ###
    
    ### Git local status
    GIT_STAGED="$(command git diff --staged --name-only)"
    GIT_UNSTAGED="$(command git diff --name-only)"
    GIT_UNTRACKED="$(command git ls-files --others --exclude-standard)"

    if ! [[ -n "$(command git show-ref origin/$(git_current_branch) 2> /dev/null)" ]]; then
        build_prompt "$ZSH_THEME_GIT_PROMPT_NORMAL" ""
        return
    fi

    if [[ ( -n $GIT_UNSTAGED || -n $GIT_UNTRACKED ) && -n $GIT_STAGED ]]; then
        build_prompt "$ZSH_THEME_GIT_PROMPT_NORMAL" "$ZSH_THEME_GIT_PROMPT_UNSTAGED_AND_STAGED !$ZSH_THEME_GIT_PROMPT_NORMAL"
        return
    else
        if [[ -n $GIT_UNSTAGED || -n $GIT_UNTRACKED ]]; then
            build_prompt "$ZSH_THEME_GIT_PROMPT_NORMAL" "$ZSH_THEME_GIT_PROMPT_UNSTAGED !$ZSH_THEME_GIT_PROMPT_NORMAL"
            return
        fi
        if [[ -n $GIT_STAGED ]]; then
            build_prompt "$ZSH_THEME_GIT_PROMPT_NORMAL" "$ZSH_THEME_GIT_PROMPT_STAGED !$ZSH_THEME_GIT_PROMPT_NORMAL"
            return
        fi
    fi
    build_prompt "$ZSH_THEME_GIT_PROMPT_NORMAL" " ≡"
    ###
}

function build_prompt() {
    # $1 = the color
    # $2 = git indicator

    echo "$1 (${ref#refs/heads/}$2)$CUSTOM_GIT_COLOR_NORMAL$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

