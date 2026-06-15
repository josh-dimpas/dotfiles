eval "$(zoxide init zsh)"

# Use python 3.14 from brew
# alias py=/opt/homebrew/bin/python3
# alias python=/opt/homebrew/bin/python3

# Use python 3.9 from system installation
# alias py=/usr/bin/python3
# alias python=/usr/bin/python3





# Created by `pipx` on 2026-03-25 03:48:43
export PATH="$PATH:/Users/swg_inter/.local/bin"

alias lg='lazygit'

# Replace ls with eza
alias ls='eza -lh --icons --group-directories-first'
alias ll='eza -lh --icons --group-directories-first'
alias la='eza -a --icons --group-directories-first'
alias lla='eza -lah --icons --group-directories-first'

# bun completions
[ -s "/Users/swg_inter/.bun/_bun" ] && source "/Users/swg_inter/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
