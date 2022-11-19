# cycle-fav-dirs
[ZSH](https://www.zsh.org/) plugin to cycle through your favourite directories

![screenshot](https://github.com/cibinmathew/cycle-fav-dirs/blob/main/images/cycle-fav-dirs-demo.gif?raw=true)

## Installation

### Using [zplug](https://github.com/zplug/zplug)

```
zplug "cibinmathew/cycle-fav-dirs"
```

### Manually
Clone this repository to some dir and then source it `.zshrc`

```zsh
git clone git@github.com:cibinmathew/cycle-fav-dirs.git ~/.zsh/plugins/cycle-fav-dirs
source ~/.zsh/plugins/cycle-fav-dirs/cyclefavdirs.plugin.zsh
```

## CONFIGURATION
Put any of below in your .zshrc configuration
- Use a custom list of favourites
    ```zsh
    CYCLE_FAV_DIRS_CMD='echo "/Users/username/Projects
    /Users/username/Downloads
    $HOME
    "'
    ```
- Using your own custom executable/scripts
    ```zsh
    CYCLE_FAV_DIRS_CMD='recent_dirs|head -n 5|uniq -i'

    CYCLE_FAV_DIRS_CMD='cat ~/.z|cut -d"|" -f1'
    ```

### Sample configuration

```zsh
zplug "cibinmathew/cycle-fav-dirs"  # installs the plugin

# Use a custom list of favourite directories
CYCLE_FAV_DIRS_CMD='echo "/Users
/Users/cibin/Library/Application Support/Sublime Text/Packages/sublime_quickfix_list/images
/Users/cibin/Library/Application Support/Sublime Text/Packages/sublime_quickfix_list/tests
"'

bindkey "\es" cycle-fav-dir-next

```


## Inspired by
[dircycle](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/dircycle/dircycle.plugin.zsh)



## License

[MIT License](LICENSE)
