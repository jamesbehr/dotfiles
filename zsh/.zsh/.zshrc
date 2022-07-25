# Enable vi keybindings in the shell
bindkey -v

alias g=git

autoload -Uz compinit
compinit

autoload zmv

case "$(uname -s)" in
    Darwin)
        source /usr/local/Cellar/fzf/*/shell/key-bindings.zsh
        source /usr/local/Cellar/fzf/*/shell/completion.zsh
        ;;
    Linux)
        source /usr/share/fzf/key-bindings.zsh
        source /usr/share/fzf/completion.zsh
        ;;
esac

# History
HISTFILE="$ZDOTDIR/.zhistory"
HISTSIZE=50000
SAVEHIST=10000
setopt EXTENDED_HISTORY       # record timestamp of command in HISTFILE
setopt HIST_EXPIRE_DUPS_FIRST # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt HIST_IGNORE_DUPS       # ignore duplicated commands history list
setopt HIST_IGNORE_SPACE      # ignore commands that start with space
setopt HIST_VERIFY            # show command with history expansion to user before running it
setopt SHARE_HISTORY          # save and reload history incrementally

source <(starship init zsh --print-full-init)
