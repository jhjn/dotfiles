setting up a config
-------------------
~~~
mkdir -p $HOME/.config
git init --bare $HOME/.config/dotfiles
alias cfg='/usr/bin/git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME'
echo "alias cfg='/usr/bin/git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME'" >> $HOME/.bashrc
cfg config --local status.showUntrackedFiles no
~~~

installing this config
----------------------
~~~
alias cfg='/usr/bin/git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME'
echo "alias cfg='/usr/bin/git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME'" >> $HOME/.bashrc
git clone --bare https://github.com/jhjn/dotfiles $HOME/.config/dotfiles
cfg checkout
rm $HOME/README.md
~~~
