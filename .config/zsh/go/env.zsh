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

unset_golang_env() {
  unset GOPATH
}

set_asdf_golang_env() {
  # Use the default GOPATH for asdf isntall
  unset GOPATH
}

set_system_golang_env() {
  local system_gopath="${HOME}/.go"

  # Override the GOPATH default of ~/go
  export GOPATH
  GOPATH="${system_gopath}"
}

set_golang_env() {
  local go_path
  go_path=$(resolve_cmd_path go)

  if [[ -z "$go_path" ]]; then
    # Go is not installed.
    unset_golang_env
  elif [[ "$go_path" = *".asdf/installs"* ]]; then
    # Go is an asdf install
    set_asdf_golang_env
  else
    # Go is a system install
    set_system_golang_env
  fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd set_golang_env
