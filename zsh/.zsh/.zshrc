# Enable vi keybindings in the shell
bindkey -v

alias g=git
alias vim=nvim
alias v=vim

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

# Directory management
setopt AUTO_PUSHD            # make cd become pushd (push directories onto stack), use popd to navigate back up directory stack
unsetopt PUSHD_MINUS         # use cd +N to go to Nth directory in history
setopt PUSHD_IGNORE_DUPS     # don't push duplicates to directory stock
setopt PUSHD_SILENT          # don't print directory stack for pushd/popd
setopt AUTO_CD               # type just the name of a directory to cd into it (e.g. `..` is the same as `cd ..`)

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
