### nvm setting ###
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="$HOME/.local/bin:$PATH"

### pure setting (using brew installed zsh and pure) ###
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit

# Non-official Pure single-line hack with one visible space
prompt_newline=' '

[[ -f ~/.zsh-pure-extra.zsh ]] && source ~/.zsh-pure-extra.zsh

prompt pure
