if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

function reload {
  if [ -n "$(jobs)" ]; then
    print -P "Error: %j job(s) in background"
  else
    exec zsh
  fi
}

autoload -Uz compinit
compinit

autoload zmv

case "$(whichos)" in
    macos)
        source /usr/local/Cellar/fzf/*/shell/key-bindings.zsh
        source /usr/local/Cellar/fzf/*/shell/completion.zsh
        ;;
    archlinux)
        source /usr/share/fzf/key-bindings.zsh
        source /usr/share/fzf/completion.zsh
        ;;
esac

for module in $ZDOTDIR/modules/*.zsh; do
    source "$module"
done

function g {
    # Make `git` with no arguments behave like `git status`
    if [[ $# -gt 0 ]]; then
        git "$@"
    else
        git status
    fi
}
