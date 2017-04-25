if which ccache > /dev/null; then
  export CCACHE_DIR="${HOME}/.ccache"
  export CC="ccache gcc"
  export CXX="ccache g++"
fi
