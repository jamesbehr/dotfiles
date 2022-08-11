setopt AUTO_PUSHD            # make cd become pushd (push directories onto stack), use popd to navigate back up directory stack
unsetopt PUSHD_MINUS         # use cd +N to go to Nth directory in history
setopt PUSHD_IGNORE_DUPS     # don't push duplicates to directory stock
setopt PUSHD_SILENT          # don't print directory stack for pushd/popd
setopt AUTO_CD               # type just the name of a directory to cd into it (e.g. `..` is the same as `cd ..`)

function list_relative_directories {
    (cd "$1" && ls -ad */)
}

function fuzzily_cd_relative_to {
    local origin="$1"
    local query="$2"
    local directory="$(list_relative_directories "$origin" | interactive_grep "$query")"

    if [ -z "$directory" ]; then
        echo "$0: no such file or directory: $query"
        return 1
    else
        cd "$origin/$directory"
    fi
}

function mk {
	while [ $# -gt 0 ]; do
		case "$1" in
			*/)
				mkdir -p "$1"
				;;
			*)
				mkdir -p "$(dirname "$1")"
				touch "$1"
				;;
		esac
		shift
	done
}

function cdf {
    fuzzily_cd_relative_to "$PWD" "$1"
}

function p {
    fuzzily_cd_relative_to ~/code "$1"
}

function dots {
    cd ~/dotfiles
    git fetch --all
}

function parent_directory_widget {
    cd ..
    zle reset-prompt
}

zle -N parent-directory parent_directory_widget
bindkey -M viins '\e.' parent-directory
