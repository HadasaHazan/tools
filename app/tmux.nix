# TMUX


pkgs:
{
    enable = true;
    aggressiveResize = true;
    baseIndex = 1;
    newSession = true;
    # Stop tmux+escape craziness.
    escapeTime = 0;

    extraConfig = ''
    set-option -sa terminal-overrides ",screen-256color:RGB"
    set-option -ga terminal-overrides ",screen-256color:Tc"
    # Default terminal is 256 colors
    set -g default-terminal "screen-256color"


    # set -g default-terminal "screen-256color"
    # set -g default-terminal "screen"
    # Status
    set-option -g status-position top

    set -g status-bg '#06060D'
    set -g status-fg white
    set -g status-left '#[fg=red]<#S>'
    #set-window-option -g window-status-current-bg '#36363D'
    set -g status-right '#[fg=yellow]#(uptime | cut -d "," -f2-)'

    # Set zsh as tmux's shell
    if 'command -v reattach-to-user-namespace >/dev/null' 'set -g default-command "reattach-to-user-namespace -l $SHELL"' 'set -g default-command "$SHELL"'

    set -g default-shell /bin/zsh

    # quick pane cycling
    unbind ^A
    bind ^A select-pane -t :.+

    # vim-style copying
    # unbind [
    # bind Escape copy-mode
    # unbind p
    # bind p paste-buffer
    # bind-key -t vi-copy 'v' begin-selection
    # bind-key -t vi-copy 'y' copy-selection

    ##############
    ## Bindings
    ##############


    # Make tmux bahave like screen
    unbind C-b
    set-option -g prefix C-a

    # Make tmux behave like vim
    setw -g mode-keys vi
    # bind h select-pane -L
    # bind j select-pane -D
    # bind k select-pane -U
    # bind l select-pane -R

    # Better pane resizing
    bind C-j resize-pane -D 5
    bind C-k resize-pane -U 5
    bind C-l resize-pane -R 5
    bind C-h resize-pane -L 5

    # Better window splitting and creation
    bind c new-window -c '#{pane_current_path}'
    bind = split-window -h -c '#{pane_current_path}'
    bind - split-window -v -c '#{pane_current_path}'

    # Last-window
    bind C-a last-window
    bind n next-window
    bind p previous-window

    # Quick reload of the config file
    unbind r
    bind r source-file ~/.tmux.conf

    # Tmux ressurection - to persiste tmux sessions C-a + s = save, C-a + r = restore
    set -g @plugin 'tmux-plugins/tmux-resurrect'


    # vim style pane selection
    bind h select-pane -L
    bind j select-pane -D 
    bind k select-pane -U
    bind l select-pane -R

    # Select pane without the C-a bind key, directly use alt + [position]
    bind-key -n M-f select-pane -D
    bind-key -n M-d select-pane -U
    bind-key -n M-s select-pane -L
    bind-key -n M-g select-pane -R

    set escape-time 0

    # set -g utf8
    # set-window-option -g utf8 on


    #############
    ## Fixes
    #############

    # fix for strange paste characteres when tmux on guake
    # http://stackoverflow.com/questions/17445100/getting-back-old-copy-paste-behaviour-in-tmux-with-mouse
    # set -g mode-mouse off
    #set mouse-utf8 off

    # fix for cursor change shape when changing panes
    # https://github.com/softmoth/zsh-vim-mode/issues/23
    # https://github.com/jeffreytse/zsh-vi-mode/issues/11
    # set -as terminal-overrides ',*:Ss=\E[%p1%d q:Se=\E[2 q'
    set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q' 
    set -g focus-events on


    ##############
    ## Status Bar
    ##############

    # status bar colors
    set -g status-bg black
    set -g status-fg white

    # alignment settings
    set-option -g status-justify left
    set-option -g status-position top

    # status left options
    set-option -g status-left '#[fg=green][#[bg=black,fg=cyan]#S#[fg=green]]'
    set-option -g status-left-length 20

    # window list options
    setw -g automatic-rename on
    set-window-option -g window-status-format '#[fg=cyan,dim]#I#[fg=blue]:#[default]#W#[fg=grey,dim]#F'
    set-window-option -g window-status-current-format '#[bg=colour23,fg=cyan,bold]#I#[bg=colour23,fg=cyan]:#[fg=colour230]#W#[fg=dim]#F'
    set -g base-index 1

    # status right options
    set -g status-right '#[fg=green][#[fg=cyan]%Y-%m-%d #[fg=white]%H:%M#[default]  #($HOME/bin/battery)#[fg=green]]'

    ############
    ## History
    ############
    set-option -g history-limit 100000
        '';
}
