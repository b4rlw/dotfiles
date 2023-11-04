#
# ███████╗██╗███████╗██╗  ██╗
# ██╔════╝██║██╔════╝██║  ██║
# █████╗  ██║███████╗███████║
# ██╔══╝  ██║╚════██║██╔══██║
# ██║     ██║███████║██║  ██║
# ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
# A smart and user-friendly command line
# https://fishshell.com

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
set -g theme_nerd_fonts yes
# set -U FZF_CTRL_R_OPTS "--reverse"
# set -U FZF_TMUX_OPTS "-p"
# set -gx FZF_DEFAULT_OPTS '--color=bg+:#1e1e2e,pointer:#f38ba8'
set -x BAT_THEME 'Catppuccin-mocha'

set -Ux FZF_DEFAULT_OPTS "--reverse \
--border rounded \
--no-info \
--pointer='' \
--marker=' ' \
--ansi \
--color='16,bg+:-1,gutter:-1,prompt:4,pointer:5,marker:6'"

set -Ux FZF_TMUX_OPTS "-p \
--reverse \
--border rounded \
--no-info \
--pointer='' \
--marker=' ' \
--ansi \
--color='16,bg+:-1,gutter:-1,prompt:4,pointer:5,marker:6'"

set -Ux FZF_CTRL_R_OPTS "--border-label=' history ' \
--header='ctrl-d: delete' \
--prompt='  '"

fish_add_path /Library/TeX/texbin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/local/bin
fish_add_path ~/.config/bin
fish_add_path ~/.local/bin
fish_add_path $HOME/.cargo/bin

set -gx EDITOR 'nvim'

set -gx HDF5_DIR /opt/homebrew/opt/hdf5
set -gx BLOSC_DIR /opt/homebrew/opt/c-blosc

abbr --add bl block --local
abbr --add bg block --global
abbr --add be block --erase

abbr --add o open .
abbr --add c clear
abbr --add n neofetch
abbr --add v nvim

abbr --add t tmux
abbr --add ta tmux attach
abbr --add td tmux detach
abbr --add tk tmux kill-server

abbr --add mm micromamba
abbr --add mma micromamba activate
abbr --add mmd micromamba deactivate
abbr --add mml micromamba list
abbr --add mme micromamba env
abbr --add mmi micromamba install
abbr --add mmr micromamba remove
abbr --add mmel micromamba env list
abbr --add mmec micromamba env create
abbr --add mmer micromamba env remove

alias ls 'exa -al --color=always --group-directories-first --icons'

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
set -gx MAMBA_EXE "/opt/homebrew/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX "/Users/jordan/micromamba"
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/mambaforge/base/bin/conda
    eval /opt/homebrew/Caskroom/mambaforge/base/bin/conda "shell.fish" "hook" $argv | source
end

if test -f "/opt/homebrew/Caskroom/mambaforge/base/etc/fish/conf.d/mamba.fish"
    source "/opt/homebrew/Caskroom/mambaforge/base/etc/fish/conf.d/mamba.fish"
end
# <<< conda initialize <<<

function activate_micromamba_env --on-event fish_prompt
  if test -d ./.env
    micromamba deactivate
    micromamba activate ./.env
  else
    micromamba deactivate
  end
end
# use `block` to temporarily stop events being registered
# use `block -e` to re-establish event signals

function count_non_tty_processes
  set process_count (ps a | awk '{print $2}' | grep -vi "tty*" | uniq | wc -l)
  if test $process_count -eq 1
    neofetch
  end
end

function ssh
  env TERM=xterm-256color command ssh $argv
end

count_non_tty_processes

zoxide init fish | source
starship init fish | source

