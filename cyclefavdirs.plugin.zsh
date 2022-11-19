# cycle-fav-dirs plugin enables cycling through a list of favourite directories

# fav_dirs=("$PROJECT_DIRECTORY_CURRENT" "/Users" "/Users/cibin" "/Users/cibin/Downloads")
# CYCLE_FAV_DIRS_CMD='recent_dirs|head|uniq -i'

cd-to-fav-dir () {
    # TODO: if there is a duplicate entry, switching gets stuck
    # IFS=$'\n' fav_dirs=($(ls))
    IFS=$'\n' fav_dirs=($(eval " $CYCLE_FAV_DIRS_CMD"))
     
    local next
    next=0
    for ((i=0; i < ${#fav_dirs[@]}; i++)); do
         # TODO ignore trailing slash differences
        if [[ $PWD/ ==  "${fav_dirs[@]:$i:1}/" ]]; then
            if [ $((i+1)) -eq "${#fav_dirs[@]}" ]; then
                next=0
            else
                next=$((i+1))
            fi
            # todo check if $PWD/ supports those with space
            # todo continue if current entry don't exist/accessible
            break
        else 
            # TODO save current dir if not in the list
            # fav_dirs+=("$PWD")
            next=0
        fi
    done
    cd "${fav_dirs[@]:$next:1}"
}

re-render-prompt() {

    # updates the prompt inline without executing and going to new line
    # https://github.com/ohmyzsh/ohmyzsh/blob/5ab517361a4215d2f777023fc1e772fe79496713/plugins/dircycle/dircycle.plugin.zsh#L28

    local fn
    for fn (chpwd $chpwd_functions precmd $precmd_functions); do
        (( $+functions[$fn] )) && $fn
    done
    zle reset-prompt
}


cycle-fav-dir-next () {

    cd-to-fav-dir || return
    re-render-prompt
}

zle -N cycle-fav-dir-next
# bindkey "\es" cycle-fav-dir-next
# bindkey "\eS" cycle-fav-dir-prev  # or use existing Ctrl-shift-left arrow of dircycle plugin
