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

path_prepend "${GOPATH}/bin"
