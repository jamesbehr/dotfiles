# Enable vi keybindings in the shell
bindkey -v

# Allow backspace/CTRL-H to delete past the point insert mode was entered
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

# Press v to edit command line in text editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
