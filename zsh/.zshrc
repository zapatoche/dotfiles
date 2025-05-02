export BB_REPO_PATH=/Users/yannick.schall/Sites/
export BEGIN_INSTALL="/Users/yannick.schall/.begin"
export PATH="$BEGIN_INSTALL:$PATH"
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"
export PATH="$PATH:$HOME/Sites/dev-scripts/"
export BB_REPO_PATH="$HOME/Sites/"
export EDITOR=hx

eval "$(zoxide init zsh)"
alias fzs="fd --type f | fzf --preview 'bat --style=numbers --color=always {}' | xargs nvim"
alias fzv="fd --type f --hidden --exclude .git | fzf-tmux --reverse --preview 'bat --style=numbers --color=always {}' | xargs nvim"


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

zle     -N             sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions


# .zshrc
autoload -U promptinit; promptinit
prompt pure

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
