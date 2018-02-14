# Set-up

Note: the following set-up instructions assume that you are working on a machine with Ubuntu 16.04 (Xenial). If you're using a different distro, use this as a guideline only, and search up the instructions relevant to your distro at each step.

## Install the Main Tools

### Zsh

```
sudo apt-get upgrade
sudo apt-get install zsh
```

Set Zsh as the default shell

```
chsh -s $(which zsh)
```

### Tmux (v2.3)

Note: we require at least v2.3 for true color support.

```
cd ~/Downloads

sudo apt-get install -y libevent-dev libncurses-dev make

wget https://github.com/tmux/tmux/releases/download/2.3/tmux-2.3.tar.gz
tar -xvzf tmux-2.3.tar.gz

cd tmux-2.3/
./configure && make
sudo make install
```

Feel free to delete the tmux-2.3 directory and the tmux-2.3.tar.gz file after finishing installation.

### Neovim

Note: if you're using an older version of Ubuntu, there are additional steps you must perform. See [here](https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu) for the full installation instructions.

```
sudo apt-get install software-properties-common

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

sudo apt-get install python-dev python-pip python3-dev python3-pip
```

## Set up the Home Directory

### Symlinks

Clone the repository, then create the appropriate symlinks for your dotfiles:

```
ln -s ~/.dotfiles/zsh/zshrc.symlink ~/.zshrc
ln -s ~/.dotfiles/tmux/tmux.conf.symlink ~/.tmux.conf
ln -s ~/.dotfiles/git/gitconfig.symlink ~/.gitconfig
ln -s ~/.dotfiles/ctags/ctags.symlink ~/.ctags
ln -s ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
```

### Directories

Create the `Workspace` and `Quicklinks` directories in the home directory if they don't exist yet.

## Set up External Dependencies

### General/Common

* [One Dark Theme for Gnome Terminal](https://github.com/denysdovhan/one-gnome-terminal)

   ```
   wget https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh && . one-dark.sh
   ```

   You may want to make a copy of the resulting terminal profile and tweak the colors a bit to suit your liking.

* [Powerline Fonts](https://github.com/powerline/fonts) (for the Powerline strips in Vim and Tmux)

   ```
   sudo apt-get install fonts-powerline
   ```

   Note: while this will correct the incorrect/missing symbols problem, you may still need to explicitly download the specific Powerline fonts you wish to use.

   To explicitly download and install certain fonts, just do the following:

   * Download the font file (usually a .ttf or .otf file) from the Powerline Fonts repository
   * Copy it into ~/.fonts (create the directory if it's missing)
   * `sudo fc-cache -fv`

   [//]: # "How to install fonts on Linux: https://www.blackmoreops.com/2014/07/31/install-fonts-on-linux/"

   Then simply configure the terminal's settings to use the particular font you want.

   For our case in particular, we like to use **Droid Sans Mono for Powerline Bold** (Size 10), and we also prefer to turn off "Allow bold text" in the terminal settings.

### Zsh

* [Zgen](https://github.com/tarjoilija/zgen)

   ```
   git clone https://github.com/tarjoilija/zgen.git ~/.zgen
   ```

* Tree

   ```
   sudo apt-get install tree
   ```

* Nemo File Explorer (optional)

   ```
   sudo apt-get install nemo
   ```

   If you don't want to use Nemo, make sure to change the file explorer used by the `exp` alias in the Zsh configuration file.

### Tmux

* [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
   ```
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

   Hit `<PREFIX>-I` while in a Tmux session to install plugins.

### Vim

* [Vundle](https://github.com/VundleVim/Vundle.vim)

   ```
   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
   ```

   Invoke `:PluginInstall` while in Vim to install plugins.

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

   Make sure to update the paths to clang and libclang in the Deoplete-Clang configuration in `init.vim`.

   The best way to find out if Deoplete-Clang has been set up properly is to open a C/C++ file in vim and see if Deoplete-Clang complains with any errors.

* ClangTidy (for Neomake)

   ```
   sudo apt-get install clang-tidy
   ```

* [Exuberant Ctags](https://github.com/jakedouglas/exuberant-ctags) (for indexing language objects; useful for things like Go-to-Definition)

   ```
   sudo apt-get install exuberant-ctags
   ```

* [SilverSearcher](https://github.com/ggreer/the_silver_searcher) (for speeding up indexing in CtrlP)

   ```
   sudo apt-get install silversearcher-ag
   ```

   Ensure that `ag` exists in `/usr/bin/`. Also, try invoking `ag` in the terminal at least once.

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

   If you're trying (and failing) to compile an existing LaTeX project, you might be lacking some of the LaTeX packages it's using.

* Scala Setup (optional)

   Basic Dependencies: [JDK](https://stackoverflow.com/questions/14788345/how-to-install-jdk-on-ubuntu-linux), [SBT](http://www.scala-sbt.org/release/docs/Installing-sbt-on-Linux.html)
