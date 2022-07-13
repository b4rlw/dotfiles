if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g theme_nerd_fonts yes

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

eval /Users/jordan/mambaforge/bin/conda "shell.fish" "hook" $argv | source

# if [ -f "/Users/jordan/mambaforge/etc/profile.d/mamba.sh" ];
#   . "/Users/jordan/mambaforge/etc/profile.d/mamba.sh"
# end

# <<< conda initialize <<<

zoxide init fish | source
starship init fish | source
