autoload -Uz vcs_info
setopt PROMPT_SUBST

function precmd {
  vcs_info

  if [[ "$SSH_CONNECTION" ]]; then
    _prompt_hostname='%F{cyan}%n%f@%F{cyan}%m%f '
  else
    _prompt_hostname=''
  fi
}

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%F{red}%b%f'

PROMPT='$_prompt_hostname%F{cyan}%~%f %(!.%(?.%F{green}#%f.%F{red}#%f).%(?.%F{green}$%f.%F{red}$%f)) '
RPROMPT='$vcs_info_msg_0_'
