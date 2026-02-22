# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"

# export PS1="\[\e[1;35m\][\u@\h \w \t]\n$ \[\e[0m\]"
export PROMPT='
%F{magenta}[%D %* %n@%m:%~]
$%f '

### デモなどで外部公開用 (テーマは Solarized Light で、背景を少し濃い色 (FCE8AD / FCE7B7 あたり) にしたもの)
# export PROMPT='
# %F{blue}[%* ec2-user@%y:%~]
# $%f '

# aliases
alias ll='ls -l'
alias la='ll -a'

# 履歴サイズ
HISTSIZE=50000
# 履歴に重複を記録しない
setopt hist_ignore_dups

# aws コマンドの自動補完
## `chmod 755 /usr/local/share/zsh/site-functions && chmod 755 /usr/local/share/zsh` の実行が事前に必要
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws 

# Created by `pipx` on 2024-05-10 02:04:57
export PATH="$PATH:/Users/sugikei/.local/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# kubenetes
source <(kubectl completion zsh)
compdef kubecolor=kubectl
alias k='kubecolor'
alias kubectl='kubecolor'

alias kx='f() { [ "$1" ] && kubectl config use-context $1 || echo "(current)" && kubectl config current-context && echo "\n[list]" && kubectl config get-contexts -o name ; } ; f'
alias kn='f() { [ "$1" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

export PATH=$HOME/.toolbox/bin:$PATH

# finch
export DOCKER_HOST=unix:///Applications/Finch/lima/data/finch/sock/finch.sock
export DOCKER_CONFIG=$HOME/.finch

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
alias q='kiro-cli'



# Claude Code
## Enable Bedrock integration
export CLAUDE_CODE_USE_BEDROCK=1
export AWS_REGION=ap-northeast-1
## Recommended output token settings for Bedrock
export CLAUDE_CODE_MAX_OUTPUT_TOKENS=4096
export MAX_THINKING_TOKENS=1024
## Using inference profile ID
export ANTHROPIC_MODEL='jp.anthropic.claude-sonnet-4-5-20250929-v1:0'
#export ANTHROPIC_SMALL_FAST_MODEL='us.anthropic.claude-haiku-4-5-20251001-v1:0'



# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"
