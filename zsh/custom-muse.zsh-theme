#!/usr/bin/env zsh
#local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

setopt promptsubst

autoload -U add-zsh-hook

C_WHITEB=$fg_bold[white]
C_GREENB=$fg_bold[green]
C_YELLOWB=$fg_bold[yellow]
C_MAGENTAB=$fg_bold[magenta]
C_CYANB=$fg_bold[cyan]
C_RESET=$reset_color
C_DEFAULT=$FG[004]
C_PROMPT=$FG[002]
C_YELLOW=$FG[003]
C_MAGENTA=$FG[005]
C_DRED=$FG[006]

PROMPT_FAILURE_COLOR=$FG[001]
PROMPT_VCS_INFO_COLOR=$FG[002]
GIT_DIRTY_COLOR=$FG[001]
GIT_CLEAN_COLOR=$FG[002]
GIT_PROMPT_INFO=$FG[004]

# 256-color support
if (( $(tput colors) == 256)) then
    C_DEFAULT=$FG[117]
    C_PROMPT=$FG[077]

    GIT_PROMPT_INFO=$FG[012]
    GIT_DIRTY_COLOR=$FG[133]
    GIT_CLEAN_COLOR=$FG[118]
fi

function hostprompt() {
    host=$(hostname)
    datetime=$(date +%H:%M:%S)
    envname="$ENV_NAME"

    if [[ $ENV_NAME == "prod" ]]
    then
        echo "%{$C_WHITEB%}$datetime %{$C_GREENB%}""$host""%{$C_RESET%}:";
    else
        echo "%{$C_WHITEB%}$datetime %{$C_YELLOWB%}""$host""%{$C_RESET%}:";
    fi
}

PROMPT='%{$C_RESET%}$(hostprompt)%{$C_DEFAULT%}%~%{$C_RESET%} %{$GIT_PROMPT_INFO%}$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status)%{$C_RESET%}%{$C_PROMPT%}ᐅ%{$C_RESET%} '

#RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%}) "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$GIT_DIRTY_COLOR%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$GIT_CLEAN_COLOR%}✔"
