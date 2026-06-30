### nvm setting ###
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="$HOME/.local/bin:$PATH"

### cdxnew - codex app new commend ###
# Open Codex app with the current directory as a new thread workspace.
# Usage:
#   cdxnew
#   cdxnew .
#   cdxnew ~/your/project
#   cdxnew ../other-project
cdxnew() {
  local target="${1:-$PWD}"

  if [ ! -d "$target" ]; then
    echo "cdxnew: directory not found: $target" >&2
    return 1
  fi

  local abs_path
  abs_path="$(cd "$target" && pwd)"

  local encoded
  encoded="$(CODEX_PATH="$abs_path" python3 -c 'import os, urllib.parse; print(urllib.parse.quote(os.environ["CODEX_PATH"]))')"

  open "codex://new?path=$encoded"
}

### pure setting (using brew installed zsh and pure) ###
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit

# Non-official Pure single-line hack with one visible space
prompt_newline=' '

[[ -f ~/.zsh-pure-extra.zsh ]] && source ~/.zsh-pure-extra.zsh

prompt pure
