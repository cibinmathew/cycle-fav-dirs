# ZSH Cycle fav dirs
[ZSH](https://www.zsh.org/) plugin to cycle through your favourite directories using a hotkey. Listed on [awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins#plugins) 


![screenshot](https://github.com/cibinmathew/cycle-fav-dirs/blob/main/images/cycle-fav-dirs-demo.gif?raw=true)

## Installation

### Using [zplug](https://github.com/zplug/zplug)

```zsh
zplug "cibinmathew/cycle-fav-dirs"
```

### Manually
Clone this repository to some dir and then source it in `.zshrc`

```bash
git clone git@github.com:cibinmathew/cycle-fav-dirs.git ~/.zsh/plugins/cycle-fav-dirs
source ~/.zsh/plugins/cycle-fav-dirs/cyclefavdirs.plugin.zsh
```

## CONFIGURATION

1. Put any of below in your .zshrc configuration to use a custom list of favourites

    ```zsh
    CYCLE_FAV_DIRS_CMD='echo "/Users/username/Projects
    /Users/username/Downloads
    $HOME
    "'
    ```
        
     ```zsh
    CYCLE_FAV_DIRS_CMD='recent_dirs|head -n 5|uniq -i'  # generate dynamically using own scripts
    ```
    ```zsh
    CYCLE_FAV_DIRS_CMD='cat ~/.z|cut -d"|" -f1'  # use list from z[https://github.com/rupa/z]
    ```

2. bind your favourite key 
    ```zsh
    bindkey "\es" cycle-fav-dir-next
    ```
### Sample configuration

```zsh
zplug "cibinmathew/cycle-fav-dirs"  # installs the plugin

# Use a custom list of favourite directories
CYCLE_FAV_DIRS_CMD='echo "/Users
/Users/cibin/Library/Application Support/Sublime Text/Packages/sublime_quickfix_list/images
/Users/cibin/Library/Application Support/Sublime Text/Packages/sublime_quickfix_list/tests
"'

bindkey "\es" cycle-fav-dir-next  # Alt-s (or Option-s) to switch through the fav dirs

```


## Inspired by
+ [dircycle](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/dircycle/dircycle.plugin.zsh)
+ [fzf-marks](https://github.com/urbainvaes/fzf-marks)



## License

[MIT License](LICENSE)
