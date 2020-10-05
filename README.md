### Dotfiles

My personal dotiles.

#### Prerequisites

```
sudo apt install zsh
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | zsh
source ~/.zshrc
nvm install node
sudo apt update
sudo apt install neovim
sudo apt install hub
sudo apt-get install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo apt-get install fzf
apt-get install silversearcher-ag```

#### Installation

Install with `./install`. Update this repo from local dotfiles with `./update`.

After running `./install`, run `:PlugInstall` and `:UpdateRemotePlugins` in neovim (ignore error about night-owl).
Then restart neovim.

Then run `C-a I` in tmux to install tmux plugins.
