# vim-config
repository for my vimrc file

## Transferring
use the following command to tar up the vimrc and all the plaugins
```bash
tar cvzf vim_config.tar.gz .vimrc .vim
```
To unpack
```bash
tar -xvzf vim_config.tar.gz
```

## Plugins
### Vundle
Vundle is the vim package manager which handles the plugin installation
[Vundle](https://github.com/VundleVim/Vundle.vim)
```bash
:PluginInstall # to install
:PluginUodate  # to update
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

### Syntastic, flake8 & autopep8

* [syntastic](https://github.com/vim-syntastic/syntastic), does the auto checking on save and displays in the magin
* [flake8](https://github.com/nvie/vim-flake8) can be run with `F7`, `search +7` on chromebook
* [autopep8](https://github.com/tell-k/vim-autopep8) can be run with `F8`, `search +8` on chromebook
```bash
:h autopep8 # for help
:Autopep8   # to run
```

### SimpylFold
[SimpylFold](https://github.com/tmhedberg/SimpylFold) just improves the whitespace folding for python, no config required

### Airline & fugitive
* [airline](https://github.com/vim-airline/vim-airline)
* [fugitive](https://github.com/tpope/vim-fugitive) (tutorial) [http://vimcasts.org/blog/2011/05/the-fugitive-series/]
