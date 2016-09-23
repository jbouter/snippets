if [ $UID -eq 0 ]; then CARETCOLOR="red"; else CARETCOLOR="green"; fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%m:%{$reset_color%}%{${fg[$CARETCOLOR]}%}%3~$(git_prompt_info)%{${reset_color}%}%# '

RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%} ("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
