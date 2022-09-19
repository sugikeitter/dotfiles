# export PS1="\[\e[1;35m\][\u@\h \w \t]\n$ \[\e[0m\]"
export PROMPT='
%F{magenta}[%D %* %n@%m:%~]
$%f '

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
