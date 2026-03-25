# Pure prompt tweaks
PURE_PROMPT_SYMBOL='❯'
PURE_GIT_DOWN_ARROW='⇣'
PURE_GIT_UP_ARROW='⇡'
PURE_GIT_UNTRACKED_DIRTY=1
PURE_CMD_MAX_EXEC_TIME=3

# Pure prompt colors
zstyle ':prompt:pure:path' color cyan
zstyle ':prompt:pure:git:branch' color magenta

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# Completion
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}no matches found%f'
zstyle ':completion:*' group-name ''

# Make completion feel a bit closer to an oh-my-zsh setup
setopt AUTO_MENU
setopt AUTO_LIST
setopt COMPLETE_IN_WORD

# Key bindings
bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Colored ls replacements
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --group-directories-first --icons'
  alias ll='eza -lh --group-directories-first --icons'
  alias la='eza -lah --group-directories-first --icons'
else
  alias ll='ls -lhG'
fi

# Convenience options
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS
