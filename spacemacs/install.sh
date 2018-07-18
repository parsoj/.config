
#############################################################
# Spacemacs installation

# base install
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
pacman -S emacs

# link in spacemacs config
rm ~/.spacemacs ; ln -s ~/.dotfiles/spacemacs/spacemacs_config ~/.spacemacs

# source code pro font for spacemacs
mkdir -p ~/.fonts
cp ~/.dotfiles/spacemacs/fonts/source-code-pro/*.ttf ~/.fonts

# all-the-icons setup for neotree
cp ~/.dotfiles/spacemacs/fonts/all-the-icons/*.ttf ~/.fonts

################################################################################

# spacemacs support utilities
paccaur -S the_silver_searcher
paccaur -S markdown
paccaur -S global
################################################################################
 # random utils

# pops up a notification when long-running scripts complete (accompanied with .bashrc setting)
paccaur -S undistract-me-git
