resolve_cmd_path() {
  local cmd_name="$1"
  local cmd_path

  cmd_path==$(which "$cmd_name" 2>/dev/null)

  # If the path is ASDF-managed, resolve again using asdf.
  # This will resolve a <cmd> pointed at the system install
  #    asdf global <cmd> system
  # to its system path.
  if [[ -n "$cmd_path" && "$cmd_path" == *".asdf/shims/$cmd_name" ]]; then
     asdf which "$cmd_name"
  else
     echo "$cmd_path"
  fi
}

set_system_golang_env() {
  # Override the GOPATH default of ~/go
  export GOPATH="${HOME}/.go"
}

set_golang_env() {
  local go_path
  go_path=$(resolve_cmd_path go)

  # If the active go is not asdf-installed, configure the system
  # env
  if [[ -n "$go_path" && "$go_path" != *".asdf/installs"* ]]; then
    set_system_golang_env
  fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd set_golang_env
