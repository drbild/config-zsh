autoload -U colors
colors

aws_vault_status() {
  if (( ${+AWS_VAULT} )); then
    STATUS="$ZSH_THEME_AWS_PROMPT_VAULT$AWS_VAULT%{${reset_color}%}"
    echo "($STATUS)"
  fi
}

ZSH_THEME_AWS_PROMPT_VAULT="%{$fg[green]%}"
