# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias ll="/usr/local/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias c="clear"
alias reload="exec zsh"

# Directories
alias library="cd $HOME/Library"
alias dotfiles="$IDE $DOTFILES"
alias sshconfig="subl -w ~/.ssh/config"
alias notes="code $HOME/Documents/Notes"
alias aliases="subl $DOTFILES/aliases.zsh"
alias paths="subl $DOTFILES/path.zsh"
alias '..'="cd .."
alias '...'="cd ../../"
alias size='gdu'
alias ssize='du -h -d 1 | sort -h'

# Files
alias untar="tar --extract --verbose --file"
alias ls='exa -lam --group-directories-first'
alias cat='bat --paging=never --plain'
alias st='subl'

alias home="cd ~/"
alias search="rga --rga-cache-max-blob-len=50000000 --no-messages --rga-adapters=-decompress,zip,tar"
alias ssearch="rga --rga-adapters=+pdfpages,tesseract --no-messages"
# export FZF_DEFAULT_COMMAND='fd --type file -E "*.jpg" -E "*.html" -E "*.htm" -E "*.txt"'
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color=always'
export FZF_DEFAULT_OPTS="--ansi"

# Python
alias act="source ./venv/bin/activate"
alias dact="deactivate"
alias rpy="pyenv uninstall"
alias cpy="pyenv virtualenv"
alias spy="pyenv shell"

## Conda
alias ca='conda activate'
alias condad='conda deactivate'
alias ce='conda env list'


alias torguard="sudo wg-quick up wg0 >/dev/null 2>&1"
alias off="sudo wg-quick down wg0 >/dev/null 2>&1"
alias wireguard="sudo wg"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"

# Git
alias gp="git peek"
alias gst="git status"
alias gb="git branch"
alias gc="git clone"
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add -u && git commit -m"
alias force="git push --force"
alias nuke="git clean -df && git reset --hard"
alias pull="git pull"
alias add="git add -u"
alias push="yes | git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="commit wip"
alias grao="git remote set-url origin git@github.com:mihirp1998/${PWD##*/}.git"
alias gcl="git config user.name 'Mihir Prabhudesai' && git config user.email 'mihirp1998.mp@gmail.com' && git config url.'ssh://git@github.com'.insteadOf 'https://github.com'"

sq() {
    #do things with parameters like $1 such as
    squeue -O UserName,,Partition,JobID,cpus-per-task,tres-per-job,tres-per-node,TimeLeft,ReqNodes,NodeList,Name | grep "$1"
}

sqr() {
    #do things with parameters like $1 such as
    squeue -O UserName,,Partition,JobID,cpus-per-task,tres-per-job,tres-per-node,TimeLeft,ReqNodes,Name -t PENDING  | grep "$1"
}

alias sls="screen -ls"
alias sclean="screen -ls | grep -o '[0-9]*\.' | awk '{print substr(\$1, 1, length(\$1)-1)}' | xargs -I {} screen -X -S {} quit"
alias sa="screen -rd "

if [[ -n $GROGU_NODE ]]; then
  alias tmux='tmux -L mprabhud -f "$DOTFILES/.tmux.conf"'
fi

alias tn='tmux new -s'
alias ts='tmux ls'
alias tk='tmux kill-session -t'
alias trn='tmux rename-session -t'

alias s1='ssh $S1_HOSTNAME'
alias s2='ssh $S2_HOSTNAME'
alias s3='ssh $S3_HOSTNAME'
alias s4='ssh $S4_HOSTNAME'
alias sp='et $HOME_HOSTNAME'
alias work="ssh home"

# Docker
alias drr="docker compose down && docker compose up -d"
alias dr="docker compose restart"
alias dup="docker compose pull && docker compose up --force-recreate --build -d"

# Tmux
alias rr='tmux -CC attach -t'

# Other
alias rs="rsync --archive --human-readable --verbose --info=progress2"

source $DOTFILES/shortcuts/functions.zsh

if [[ "$OS" == "macos" ]]; then
  source $DOTFILES/shortcuts/mac_aliases.zsh
elif [[ "$OS" == "linux" ]]; then
  source $DOTFILES/shortcuts/linux_aliases.zsh
fi
