# Install ZSH
sudo apt install zsh

# Install cmake
sudo apt-get install cmake

# Install Oh-My-Zsh
# Needs password
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install powerlevel 10k
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k

# Install syntax highlighter for zsh
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

# Install base16 shell colors
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# Install NeoVim
# Needs password
sudo apt-get install neovim

# Get pip for ubuntu
sudo apt install python-pip
sudo apt install python3-pip

# Fix python dependency
# pip3
pip3 uninstall neovim
pip3 uninstall pynvim
pip3 install pynvim

# pip
pip uninstall neovim
pip uninstall pynvim
pip install pynvim

# Install tmux
sudo apt-get install tmux

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Fetch my dotfiles
cd ~
git clone https://github.com/SagarKishore-PFM/dotfiles.git dotfiles

# Setup zshrc
rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.

# Setup tmux conf
ln -s ~/dotfiles/.tmux.conf ~/.

# Install Vim Plug
sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Setup init vim
mkdir ~/.config/nvim
cd ~/.config/nvim
ln -s ~/dotfiles/init.vim .

# Install Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
