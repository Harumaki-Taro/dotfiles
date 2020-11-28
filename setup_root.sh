#!/bin/bash

# archwsl2の環境構築を元に作成
###
### suで実行
###
echo -n "Did you do 'vim /etc/pacman.d/mirrorlist'? [y/N]: "
read ANS

# pacmanのミラーリストを設定したか確認
case $ANS in
  [Yy]* )
    ;;
  * )
    echo "Do 'vim /etc/pacman.d/mirrorlist'!"
    exit 1
    ;;
esac

# pacman-keyring初期設定
pacman-key --init;pacman-key --populate;pacman -Syy archlinux-keyring
# パッケージのインストール
pacman -Syyuu --needed base-devel vim neovim git progress python python2 go tmux
# zshの切り替え
chsh -s /bin/zsh

