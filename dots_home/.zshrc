export ZSH="$HOME/.oh-my-zsh"

export PATH="$PATH:/home/t3chj4ck/script"
export EDITOR=nvim
export DISPLAY=:0


source $ZSH/oh-my-zsh.sh



function yazi_cd() {
  local tmpfile="$(mktemp)"
  yazi --chooser-file="$tmpfile" "$@"
  if [[ -f "$tmpfile" ]]; then
    local dir="$(<"$tmpfile")"
    rm -f "$tmpfile"
    if [[ -d "$dir" ]]; then
      cd "$dir"
    fi
  fi
}
alias y=yazi_cd

# eval "$(starship init zsh)"

# pyenv
# export PATH="$HOME/.pyenv/shims:$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
#
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk


zinit load zsh-users/zsh-autosuggestions
zinit load zsh-users/zsh-syntax-highlighting

#zellij
# if [[ -z "$ZELLIJ" && $- == *i* ]]; then
#     if zellij list-sessions 2>/dev/null | grep -q -v "EXITED"; then
#         zellij attach
#     else
#         zellij
#     fi
# fi
#
# eval "$(starship init zsh)"


#tmux
if [[ -z "$TMUX" && "$TERM" != "linux" && $- == *i* ]]; then
    BASE_SESSION="tmux_main"
    # session name (PID)
    CLIENT_SESSION="${BASE_SESSION}_$$"

    # session already exist?
    if ! tmux has-session -t "$BASE_SESSION" 2>/dev/null; then
        # A: first terminal
        # 1.creat main session
        tmux new-session -c "$PWD" -s "$BASE_SESSION" -d
        
        # 2. client session
        tmux new-session -t "$BASE_SESSION" -s "$CLIENT_SESSION" -d
        
    else
        # B: not the first terminal
        # creat client session
        tmux new-session -t "$BASE_SESSION" -s "$CLIENT_SESSION" -d
       	#new window 
        tmux new-window -t "$CLIENT_SESSION" -c "$PWD"
    fi
	#attach
    tmux attach-session -t "$CLIENT_SESSION" -x
fi
#PROMPT

PROMPT='%B%K{cyan}%F{#000000}%n@%m%k%f %K{red}%F{#000000}%~%k%b%f $ '
