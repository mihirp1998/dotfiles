export DOTFILES=$HOME/Documents/dotfiles

# Determine what type of machine we're running on
# This affects what we source, put on our path, and which aliases we use
if [[ "$(uname)" == "Darwin" ]]; then
  export OS='macOS'
  cpu_str=$(sysctl -a | grep 'machdep.cpu.brand_string')
  arm64_cpu="Apple M1"
  if [[ "$cpu_str" == *"$arm64_cpu"* ]]; then
    export MACHINE='ARM64'
    export BREWPREFIX='/opt/homebrew'
  else
    export MACHINE='X86'
    export BREWPREFIX='/usr/local'
  fi
else
  export OS='Linux'
  export MACHINE='Other'
fi

source $DOTFILES/path.zsh
source $DOTFILES/aliases.zsh

# Random
if [[ "$OS" == "macOS" ]]; then
  source $DOTFILES/plugins/pyenv-lazy/pyenv-lazy.plugin.zsh
  source ~/.iterm2_shell_integration.zsh
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  if [[ "$MACHINE" == "ARM64" ]]; then
  else
  fi
fi

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source $DOTFILES/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ## https://stackoverflow.com/a/48679640
# ARCH="$(uname -m)"
# case ARCH in
#     i386)   ARCH="386" ;;
#     i686)   ARCH="386" ;;
#     x86_64) ARCH="amd64" ;;
#     arm)    dpkg --print-architecture | grep -q "arm64" && ARCH="arm64" || ARCH="arm" ;;
# esac

# if [[ "${ARCH}"  == "arm64" ]]; then
#     PREFIX="/opt/homebrew"
# else
#     PREFIX="/usr/local"
# fi

# # https://github.com/pyenv/pyenv/issues/1768
# SDK_PATH="$(xcrun --show-sdk-path)"
# export CPATH="${SDK_PATH}/usr/include"
# export CFLAGS="-I${SDK_PATH}/usr/include/sasl $CFLAGS"
# export CFLAGS="-I${SDK_PATH}/usr/include $CFLAGS"
# export CFLAGS="-I${PREFIX}/include $CFLAGS"
# export LDFLAGS="-L${SDK_PATH}/usr/lib $LDFLAGS"
# export LDFLAGS="-L${PREFIX}/lib $LDFLAGS"