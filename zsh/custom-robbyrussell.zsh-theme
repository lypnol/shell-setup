#!/bin/zsh

function get_datetime() {
    echo $(date +%H:%M)
}

local ret_status="%(?:%{$fg_bold[green]%}ᐅ :%{$fg_bold[red]%}ᐅ )"
PROMPT='%{$fg_bold[white]%}$(get_datetime) %{$fg_bold[cyan]%}%c $(git_prompt_info)${ret_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}[%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}] %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}]"
