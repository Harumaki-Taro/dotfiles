export PATH=$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.gem/ruby/2.7.0/bin:$HOME/go/bin

# fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export DefaultIMModule=fcitx

# XDG Base Directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DARA_HOME=$HOME/.local/share
export XDG_DARA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

# configs
export DefaultIMModule=fcitx
export LANG=ja_JP.UTF-8
xbindkeys

# hardware video acceleration
export LIBVA_DRIVER_NAME=radeonsi

# libcanberra
export GTK_PATH=/usr/lib/gtk-2.0
export GTK_MODULES=canberra-gtk-module

# dolphin
[ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] || export QT_QPA_PLATFORMTHEME="qt5ct"

