# Based upon the mrtazz theme

if [ $UID -eq 0 ]; then 
  CARETCOLOR="red"
  PROMPTLOGO="#"
else 
  CARETCOLOR="green"
  PROMPTLOGO="$"
fi

PROMPT='%{$fg[$CARETCOLOR]%}%m%{$reset_color%} %{$fg_bold[blue]%}%2~ %{$reset_color%}$PROMPTLOGO '
RPROMPT='%{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}% %{$fg_bold[green]%}<%{$reset_color%}%{$fg[cyan]%}%*%{$reset_color%}%{$fg_bold[green]%}>%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="<%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%} %{$fg[yellow]%}✗%{$fg[green]%}>%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}>"
