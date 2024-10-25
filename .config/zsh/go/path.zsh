function path_remove() {
  path=(${path:#$1})
}

function path_prepend() {
  if [[ -d "$1" ]]; then
    path_remove "$1"
    path=("$1" $path)
  fi
}

function path_append() {
  if [[ -d "$1" ]]; then
    path_remove "$1"
    path=($path "$1")
  fi
}

function set_golang_path() {
  local system_gopath_bin="${HOME}/.go/bin"

  # Include the system Go installs in $PATH when it is active, as
  # implied by GOPATH.
  if [[ -n "$GOPATH" ]]; then
    path_prepend "${system_gopath_bin}"
  else
    path_remove "${system_gopath_bin}"
  fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd set_golang_path
