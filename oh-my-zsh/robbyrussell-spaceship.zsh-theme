PROMPT='%{$fg[cyan]%}%3~%{$reset_color%} $(git_prompt_info)'
PROMPT+="%(?:%{$fg_bold[green]%}➜%{$reset_color%} :%{$fg_bold[red]%}➜%{$reset_color%} )"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}on %{$fg[magenta]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""
