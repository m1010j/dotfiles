### Dotfiles

My personal dotiles. Install with `./install`. Update this repo from local dotfiles with `./update`.

After running `./install`, run
```
git config --global --add url."git@github.com:".insteadOf "https://github.com/"
```
and then run `:PlugInstall` and `:UpdateRemotePlugins` in neovim (ignore error about night-owl). Then restart neovim.

Then run `C-a I` in tmux to install tmux plugins.
