if which ccache > /dev/null; then
  export CCACHE_DIR="${HOME}/.ccache"
  if [[ `uname` == 'Darwin' ]]; then
    export CC="ccache-clang"
    export CXX="ccache-clang"
  else
    export CC="ccache-gcc"
    export CXX="ccache-g++"
  fi
fi
