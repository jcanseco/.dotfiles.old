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

   Used for indexing of language objects (useful for things like Go-to-Definition).

* [SilverSearcher](https://github.com/ggreer/the_silver_searcher)

   Used to speed up indexing for CtrlP. Ensure that `ag` exists in `/usr/bin/`.

* LaTeX Dependencies

   [//]: # "Getting Started with LaTeX on Linux (the basics): https://stackoverflow.com/questions/1017055/get-started-with-latex-on-linux"

   [//]: # "Compile LaTeX doc manually on Linux: https://tex.stackexchange.com/questions/16884/compiling-a-latex-document-manually"

   Note: optional. You only need this if you plan to write LaTeX docs.

   TeXLive 2016 (a LaTeX distro):
   ```
   sudo add-apt-repository ppa:jonathonf/texlive-2016
   sudo apt-get update
   sudo apt-get install texlive
   ```

   Latexmk (LaTeX compiler used by VimTeX):
   ```
   sudo apt-get install latexmk
   ```

   Zathura (for viewing the PDF doc; supports closer integration with VimTeX)
   ```
   sudo apt-get install zathura
   ```

   Xdotool (required by VimTeX for performing forward searches on Zathura)
   ```
   sudo apt-get install xdotool
   ```

   To verify that your set-up works, try compiling this [sample LaTeX file](http://www.maths.tcd.ie/~dwilkins/LaTeXPrimer/TypicalInput.html).

   If you're trying (and failing) to compile an existing LaTeX project, you might be lacking some of the packages it's using.
