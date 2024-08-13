if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
  export EDITOR='emacsclient'
else
  export EDITOR='emacsclient -tty --alternate-editor=""'
fi
