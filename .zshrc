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


# Strands CLI でデフォルトのモデルを指定したい場合
alias strands='strands --model-config '"'"'{"model_id": "jp.anthropic.claude-sonnet-4-5-20250929-v1:0"}'"'"
