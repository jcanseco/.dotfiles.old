# Set-up

## Symlinks

Recall: symbolic links can be created using the following command:

```
ln -s <path to actual file> <path to symlink>
```

For example:

```
ln -s ~/.dotfiles/git/gitconfig.symlink ~/.gitconfig
```

`.zshrc`, `.tmux.conf`, and `.gitconfig` must be created in the home directory; `init.vim` must be created in `~/.config/nvim/`.


## External Dependencies

### Zsh

* [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh)

   Ensure to update the oh-my-zsh path in `.zshrc`.

### Tmux

* [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

   Hit `<PREFIX>-I` to install plugins.

### Vim

* [Vundle](https://github.com/VundleVim/Vundle.vim)

   Invoke `:PluginInstall` while in vim to install plugins.

* Python3 Interface for Neovim (for Deoplete)

   ```
   pip3 install neovim
   ```

   If Deoplete was installed prior to Python support being added to Neovim, invoke `:UpdateRemotePlugins`.

* Neovim remote client for Python (for Deoplete-Clang)

   ```
   pip3 install --upgrade neovim
   ```

* Clang and Libclang (for Deoplete-Clang and Neomake)

   ```
   sudo apt-get install clang
   ```

   Ensure to update the paths to clang and libclang in the Deoplete-Clang configuration.

* ClangTidy (for Neomake)

   ```
   sudo apt-get install clang-tidy
   ```

* [Universal Ctags](https://askubuntu.com/questions/796408/installing-and-using-universal-ctags-instead-of-exuberant-ctags)

   Used for semantic indexing (useful for things like Go-to-Definition).

* [SilverSearcher](https://github.com/ggreer/the_silver_searcher)

   Used to speed up indexing for CtrlP. Ensure that `ag` exists in `/usr/bin/`.
