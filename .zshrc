if [ `uname --kernel-release | grep 'microsoft'` ] ; then
  source $HOME/.profile
  # x window用の設定
  export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0
  export GDK_SCALE=0.5
  export GDK_DPI_SCALE=2
fi


### util commands
# ranger
source $HOME/.config/ranger/shell_automatic_cd.sh
alias ranger="ranger_cd"
# fasd
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
## エイリアス
alias ls="/bin/ls -F --color=auto"
alias ll="/bin/ls -Fl --color=auto"
alias la="/bin/ls -Fa --color=auto"


## ruby
eval "$(rbenv init -)"


### general
# Ctrl+Dでのログアウト防止
setopt IGNOREEOF
# 色を使用
autoload -Uz colors
colors
export TERM="xterm-256color"
export COLORTERM="truecolor"
# editor
export EDITOR=nvim
export SUDO_EDITOR=nvim
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
# bgプロセスの状態変化を即時に知らせる
setopt notify
# 終了ステータスが0以外の場合にステータスを表示する
#setopt print_exit_value
# ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt mark_dirs
# パスの最後のスラッシュを削除しない
setopt noautoremoveslash
# コマンドのスペルチェックをする
setopt correct
# コマンドライン全てのスペルチェックをする
setopt correct_all
# 上書きリダイレクトの禁止
setopt no_clobber


### 補完
autoload -Uz compinit
compinit
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# ../のあとは今いるディレクトリを補完しない
zstyle ':completion:*' ifnore-parents parent pwd ..
# sudo の後ろでコマンド名を補完する
zstyle ':xompletion:*:sudo:*' command-path $PATH
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' comand 'ps x -o pid,s,args'
# カッコの対応などを自動的に補完する
setopt auto_param_keys
# cdした際のディレクトリをディレクトリスタックへ自動追加
DIRSTACKSIZE=100
setopt auto_pushd
zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'
setopt pushd_ignore_dups

## history
HISTFILE=$HOME/.zsh_history
HISTSIZE=6000
SAVEHIST=6000
# フローコントロールを無効にする
setopt no_flow_control


# nvim/vimから開いているか確認し、zplugのような重いものは読み込まないようにする
if [ `env | grep 'VIMRUNTIME'` ] ; then
  PROMPT="%F{152}%c%f"

  autoload -Uz vcs_info
  setopt prompt_subst
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "%F{184}+"
  zstyle ':vcs_info:git:*' unstagedstr "%F{172}!"
  zstyle ':vcs_info:*' formats "%F{070}%c%u(%b)%f"
  zstyle ':vcs_info:*' actionformats '[%b|%a]'
  precmd () { vcs_info }
  PROMPT=$PROMPT'${vcs_info_msg_0_}'
  PROMPT=$PROMPT"%# "

  RPROMPT="on %F{189}%n@%B%m%b%f"
else
  # theme
  eval "$(starship init zsh)"

  ### zplug
  source /usr/share/zsh/scripts/zplug/init.zsh

  # zsh theme
  #zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

  # Make sure to use double quotes
  zplug "zsh-users/zsh-history-substring-search"
  zplug "zsh-users/zsh-syntax-highlighting"

  # Use the package as a command
  # And accept glob patterns (e.g., brace, wildcard, ...)
  zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

  # Can manage everything e.g., other person's zshrc
  zplug "tcnksm/docker-alias", use:zshrc

  # Disable updates using the "frozen" tag
  zplug "k4rthik/git-cal", as:command, frozen:1

  # Grab binaries from GitHub Releases
  # and rename with the "rename-to:" tag
  zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*"

  # Supports oh-my-zsh plugins and the like
  zplug "plugins/git",   from:oh-my-zsh

  # Also prezto
  # zplug "modules/prompt", from:prezto

  # Load if "if" tag returns true
  # zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

  # Run a command after a plugin is installed/updated
  # Provided, it requires to set the variable like the following:
  # ZPLUG_SUDO_PASSWORD="********"
  # zplug "jhawthorn/fzy", \
  #     as:command, \
  #     rename-to:fzy, \
  #     hook-build:"make && sudo make install"

  # Supports checking out a specific branch/tag/commit
  # zplug "b4b4r07/enhancd", at:v1
  # zplug "mollifier/anyframe", at:4c23cb60

  # Can manage gist file just like other packages
  # zplug "b4b4r07/79ee61f7c140c63d2786", \
  #     from:gist, \
  #     as:command, \
  #     use:get_last_pane_path.sh

  # Support bitbucket
  # zplug "b4b4r07/hello_bitbucket", \
  #     from:bitbucket, \
  #     as:command, \
  #     use:"*.sh"

  # Rename a command with the string captured with `use` tag
  # zplug "b4b4r07/httpstat", \
  #     as:command, \
  #     use:'(*).sh', \
  #     rename-to:'$1'

  # Group dependencies
  # Load "emoji-cli" if "jq" is installed in this example
  # zplug "stedolan/jq", \
  #     from:gh-r, \
  #     as:command, \
  #     rename-to:jq
  # zplug "b4b4r07/emoji-cli", \
  #     on:"stedolan/jq"
  # Note: To specify the order in which packages should be loaded, use the defer
  #       tag described in the next section

  # Set the priority when loading
  # e.g., zsh-syntax-highlighting must be loaded
  # after executing compinit command and sourcing other plugins
  # (If the defer tag is given 2 or above, run after compinit command)
  # zplug "zsh-users/zsh-syntax-highlighting", defer:2

  # Can manage local plugins
  # zplug "~/.zsh", from:local

  # Load theme file
  # zplug 'dracula/zsh', as:theme

  # Install plugins if there are plugins that have not been installed
  if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    fi
  fi

  # Then, source plugins and add commands to $PATH
  zplug load # --verbose

  if [ `env | grep 'TMUX_PANE'` ] ; then
    #
  else
    neofetch --color_blocks on
  fi
fi


