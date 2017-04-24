directory_name() {
  echo "%2~"
}

host_name() {
  echo "%m"
}

job_count() {
  echo "%j"
}

return_status() {
  echo "%(?:✓:✗)"
}

export PROMPT='[$(host_name) $(job_count) $(return_status) $(git_super_status) $(directory_name)]$ '

precmd() {
  title "zsh" "%m" "%55<...<%2~"
}
