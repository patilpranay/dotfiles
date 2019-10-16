# Search for files.
f() {
  find . -name "*$@*"
}

# For GnuPG signing to work correctly.
GPG_TTY=$(tty)
export GPG_TTY

# To avoid consistently entering SSH key password. Asks for password once.
eval $(ssh-agent)
ssh-add

# Set functionality for the fuzzy find default command (fzf) - requires ripgrep.
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# This function opens fzf in a new tmux session, and, upon selection of a file,
# opens that file in vim.
# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
  local out file key
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}
