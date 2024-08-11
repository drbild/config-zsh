alias emcas='emacs'

if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
  alias emacs='emacsclient_vterm'
else
  alias emacs='emacsclient -create-frame --alternate-editor=""'
fi

# Launch emacsclient inside of vterm.
#
# Strips any args that would try to create a new frame, ensuring that the
# requested buffer the frame hosting the vterm instance.
#
# Trying to create new frame can cause the emacs server to freeze.
function emacsclient_vterm() {
    local args=()

    for arg in "$@"; do
      case "$arg" in
        -c|--create-frame|-nw|-t|--tty)
          # Drop args that would create a new frame
          ;;
        *)
          args+=("$arg")
          ;;
      esac
    done

    emacsclient "${args[@]}"
}
