# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/pranay.patil/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# https://github.com/agkozak/zsh-z
source ~/.zsh/plugins/zsh-z/zsh-z.plugin.zsh

# Show colors with ls
export CLICOLOR=1 # macOS only
export LSCOLORS=gxfxfxdeBxegheabagacad # macOS only
alias ls='ls --color' # Linux only

# https://github.com/joel-porquet/zsh-dircolors-solarized
alias dircolors='gdircolors' # macOS only
source ~/.zsh/plugins/zsh-dircolors-solarized/zsh-dircolors-solarized.zsh

# https://github.com/Aloxaf/fzf-tab
source ~/.zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # For colors with fzf-tab

export PROMPT='%m %B%1~%b %# '
# export PATH=
export VISUAL=vim
export EDITOR="$VISUAL"
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# Search for files (case-insensitive)
f() {
  find . -iname "*$@*"
}

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# vi mode for command line and enable reverse search
bindkey -v
bindkey "^R" history-incremental-search-backward

# Navigate to iCloud Drive
alias icloud='cd Library/Mobile\ Documents/com\~apple\~CloudDocs'
