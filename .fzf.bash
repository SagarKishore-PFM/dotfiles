# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/apple/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/apple/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/apple/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/apple/.fzf/shell/key-bindings.bash"
