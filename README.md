# Set-up

## Set up the Home Directory

### Symlinks

After cloning the repository, first start by creating the appropriate symlinks.

Recall: symlinks can be created using the following command:

```
ln -s <path to actual file> <path to symlink>
```

For example:

```
ln -s ~/.dotfiles/git/gitconfig.symlink ~/.gitconfig
```

`.zshrc`, `.tmux.conf`, `.gitconfig`, and `.ctags` must be created in the home directory; `init.vim` must be created in `~/.config/nvim/`.

Note that you can create symlinks to directories in the same way:

```
ln -s ~/Workspace/ECE254/Notes ~/Quicklinks/ECE254-Notes
```

### Directories

Create the `Workspace` and `Quicklinks` directories in the home directory if they don't exist yet.

## Set up External Dependencies

### General/Common

* [One Dark Theme for Gnome Terminal](https://github.com/denysdovhan/one-gnome-terminal)

   ```
   wget https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh && . one-dark.sh
   ```

   You may want to make a copy of the resulting Gnome Terminal profile and tweak the colors a bit to suit your liking.

* [Powerline Fonts](https://github.com/powerline/fonts) (for the powerline strips in vim and tmux)

   ```
   sudo apt-get install fonts-powerline
   ```

   Note: while this will correct the incorrect/missing symbols problem, you may still need to explicitly download the specific powerline fonts you wish to use.

   For our case in particular, we like to use **Droid Sans Mono for Powerline Bold** (Size 10).

   To explicitly download and install certain fonts, just do the following:

   * Download the font file (usually a .ttf or .otf file) from the powerline fonts repository
   * Copy it into ~/.fonts (create the directory if it's missing)
   * `sudo fc-cache -fv`

   [//]: # "How to install fonts on Linux: https://www.blackmoreops.com/2014/07/31/install-fonts-on-linux/"

### Zsh

* [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh)

   Ensure the path to the Oh-My-Zsh installation in `.zshrc` is correct.

   Note that installing Oh-My-Zsh will override your current existing `.zshrc` file with the default one that Oh-My-Zsh comes with, so make sure to replace that with the one you have afterwards.

* Nemo File Explorer (optional)
   ```
   sudo apt-get install nemo
   ```

   If you don't want to use Nemo, make sure to change the file explorer used by the `exp` alias in the zsh configuration file.

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

* LaTeX Setup (optional)

   [//]: # "Getting Started with LaTeX on Linux (the basics): https://stackoverflow.com/questions/1017055/get-started-with-latex-on-linux"

   [//]: # "Compile LaTeX doc manually on Linux: https://tex.stackexchange.com/questions/16884/compiling-a-latex-document-manually"

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

* Scala Setup (optional)

   Basic Dependencies: [JDK](https://stackoverflow.com/questions/14788345/how-to-install-jdk-on-ubuntu-linux), [SBT](http://www.scala-sbt.org/release/docs/Installing-sbt-on-Linux.html)
