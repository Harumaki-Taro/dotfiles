#!/bin/bash


# archwsl2の環境構築を元に作成
###
### 非ルートユーザーで実行(cui)
###
echo -n "Did you do 'vim /etc/pacman.d/mirrorlist'? [y/N]: "
read ANS

# localeを設定したか確認
case $ANS in
  [Yy]* )
    ;;
  * )
    echo "Do 'sudo nvim /etc/locale.gen' and 'sudo locale-gen'!"
    exit 1
    ;;
esac

# homeへ移動(必要ない？)
cd $HOME

# yay
git clone https://aur.archlinux.org/yay
cd yay && makepkg -si --noconfirm && cd .. && rm -rf yay
yay -Syu
# pacmanインストール
sudo pacman -S openssh ruby xbindkeys npm fzf xclip ctags

# rangerとその拡張機能を有効にするパッケージをインストール (ranger以外が結構重い)
sudo pacman -S ranger highlight lynx elinks poppler mediainfo atool bzip2 cpio gzip lhasa xz lzop p7zip tar unace unrar zip unzip transmission-cli ffmpegthumbnailer
#
sudo pacman -S fasd wget
yay peco


### neovimの設定
# rubyのPATHを通すために先にやっておく必要がある
ln -sf $HOME/dotfiles/.profile $HOME/.profile
ln -sf $HOME/dotfiles/.xbindkeysrc $HOME/.xbindkeysrc
ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc
source $HOME/.zshrc
# dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh $HOME/.dein
rm installer.sh
mkdir $HOME/.vim
ln -sf $HOME/dotfiles/nvim/rc $HOME/.vim/rc
ln -sf $HOME/dotfiles/nvim/nvim $HOME/.config/nvim
mkdir $HOME/.vim/trivial
ln -sf $HOME/dotfiles/nvim/lint/.rubocop.yml $HOME/.vim/trivial/.rubocop.yml
sudo pacman -S nodejs python-pip python2-pip bash-language-server lua-lsp-git
pip install neovim
pip2 install neovim
gem install neovim
gem environment
gem install bundler
sudo npm install -g neovim

# for .zshrc
yay zplug
yay neofetch
# powerline
curl -fsSL https://starship.rs/install.sh | bash

# for nvim
pip install python-language-server
yay ruby-solargraph
yay lua-lsp-git
yay vim-language-server
sudo pacman -S yamllint
pip install vim-vint

# tmux
mkdir -p $HOME/.config/tmux
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
yay unimatrix-git

# git
yay git-delta-bin
git config --global core.editor 'nvim'
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global delta.side-by-side true
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false


# ruby
yay rbenv
yay ruby-build
rbenv init


###
### for gui
###
# guiを設定するか確認
echo -n "Do you want to set gui setting? [y/N]: "
read ANS
case $ANS in
  [Yy]* )
    ;;
  * )
    echo "cui setting is finished!"
    exit 1
    ;;
esac

DOT_FILES=(.Xresources .bash_profile .bashrc .xprofile .xmux.conf .gemrc)

for file in ${DOT_FILES[@]}
do
  ln -sf $HOME/dotfiles/${file} $HOME/${file}
done

# i3
sudo pacman -S i3 polybar ranger rofi

CONFIG_FILES=(i3, polybar, ranger, rofi, gtkrc, gtkrc-2.0, gtk-3.0, gtk-4.0, fontconfig, efm-langserver)
for file in ${DOT_FILES[@]}
do
  ln -sf $HOME/dotfiles/${file} $HOME/.config/${file}
done

