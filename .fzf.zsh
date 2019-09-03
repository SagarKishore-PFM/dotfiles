# Setup fzf
# ---------
if [[ ! "$PATH" == */home/sagarkishore/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/sagarkishore/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/sagarkishore/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/sagarkishore/.fzf/shell/key-bindings.zsh"
