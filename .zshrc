# General:
export TERM=xterm-kitty
export DESKTOPS='1 2 3 4 5 6 7 8 9 10'
export EDITOR='nvim -u $HOME/.config/nvim/init.lua'
export TMPDIR='$HOME/.cache'
export PATH=$PATH:$HOME/.config/as-scripts

# History:

# Set history size in memory and file
export HISTSIZE=100000
export HISTFILESIZE=200000

# Add timestamp to history
export HISTTIMEFORMAT="%F %T "

# Control history behavior: ignore duplicates and commands with leading space
setopt HIST_IGNORE_ALL_DUPS # Remove older duplicates
setopt HIST_IGNORE_SPACE    # Ignore commands starting with space
setopt HIST_SAVE_NO_DUPS    # Don't save duplicates to file

# Append history immediately after each command
setopt INC_APPEND_HISTORY # Append to history file right away
setopt SHARE_HISTORY      # Share history between sessions

# disable stupid mails in /var/mail/
export MAILCHECK=-1

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# True Color support
export COLORTERM=truecolor

# Alias definitions
if [ -f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

# Custom Bash Functions
if [ -f ~/.zsh_functions ]; then
  source ~/.zsh_functions
fi

# Main:

# fzf
export FZF_DEFAULT_OPTS="--color='bg:#1d2021,bg+:#282828,info:#fabd2f,border:#504945,spinner:#8ec07c'
--color='hl:#689d6a,fg:#bdae93,header:#689d6a,fg+:#fbf1c7'
--color='pointer:#b8bb26,marker:#b8bb26,prompt:#b8bb26,hl+:#b8bb26' --border='sharp' --border-label='' --preview-window='border-sharp' --prompt='> '
  --marker='*' --pointer='>' --separator='─' --scrollbar='█'"
export FZF_ALT_C_OPTS="--preview 'ls -Alh --color=always {} | head -200'"
export FZF_CTRL_T_OPTS="--preview '(cat {} || ls -Alh --color=always {}) 2> /dev/null | head -200'"
eval "$(fzf --zsh)"

# oh-my-posh
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh.omp.json)"

# brew auto-completion
eval "$(brew shellenv)"
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -Uz compinit && compinit   

# Miscellaneous:

# android studio TMP
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export REPO_OS_OVERRIDE=linux
