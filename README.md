# DotFiles
Repository for my configuration files
Tutorial on dotfile configuration [here](https://missing.csail.mit.edu/2020/command-line/).

## vimrc
### Vundle
Vundle is the vim package manager which handles the plugin installation
[Vundle](https://github.com/VundleVim/Vundle.vim)
```bash
:PluginInstall # to install
:PluginUpdate  # to update
:PluginClean   # to remove old plugins
:h vundle      # for help
```

### Surround

```bash
ysiw" # add surrounding around word "
ds" # delete surrounding "
cs") # change surrounding " to ()
     # note: ys( adds brackets with space ys) adds brackets no space
```

There is a more indepth [tutorial](http://www.futurile.net/2016/03/19/vim-surround-plugin-tutorial/) for using the plugin.

[Surround](https://github.com/tpope/vim-surround)

### Colourscheme
`F5`, `search +5` on chromebook to toggle between light and dark modes
* [Grubox](https://github.com/morhetz/gruvbox) currently selected
* [solarized](https://github.com/altercation/vim-colors-solarized) included fo work
```bash
:colorscheme          # to see active
:colorscheme gruvbox  # to activate a different one
```

### Trailing whitespace, Syntastic, flake8 & autopep8
* remove trailing whitespace `:%s/\s\+$//ge` mapped to `F2`
* [syntastic](https://github.com/vim-syntastic/syntastic), does the auto checking on save and displays in the magin
* [autopep8](https://github.com/tell-k/vim-autopep8) can be run with `F8`, `search +8` on chromebook
```bash
:h autopep8 # for help
:Autopep8   # to run
```

### SimpylFold
*causing errors at work removed*

[SimpylFold](https://github.com/tmhedberg/SimpylFold) just improves the whitespace folding for python, no config required

### Airline & fugitive
* [airline](https://github.com/vim-airline/vim-airline)
* [fugitive](https://github.com/tpope/vim-fugitive) (tutorial) [http://vimcasts.org/blog/2011/05/the-fugitive-series/]

### Taking to work
from the ~ dircetory, needs to be from here, run 

`tar -zcvf vim-config.tar.gz .vimrc .vim`

extarct with

`tar -xvf vim-config.tar.gz`

## tumx.conf

`tumx.conf` currently just a copy of [anishathalye](https://github.com/anishathalye/dotfiles/blob/master/tmux.conf)

## screenrc

## flake8

## bashrc
