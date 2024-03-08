# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/ssh-agent/README.md
# [ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"
pkgs:
{
  enable = true;
  zplug = {
        enable = true;
        plugins = [
          { name = "plugins/colored-man-pages";         tags = [from:oh-my-zsh]; }
          { name = "plugins/git";                       tags = [from:oh-my-zsh]; }
          { name = "romkatv/powerlevel10k";             tags = [as:theme depth:1];}
          { name = "plugins/auto-ls";                   tags = [from:oh-my-zsh]; }
          { name = "plugins/ssh-agent";                 tags = [from:oh-my-zsh]; }
          { name = "plugins/zsh-autocomplete";          tags = [from:oh-my-zsh]; }
          { name = "jeffreytse/zsh-vi-mode";            tags = [from:github]; }
          { name = "agkozak/zsh-z";                     tags = [from:github]; }
        ];
      };
  dotDir =  ".config/zsh";

  # Start [initExtra]
  initExtra = ''

    # Disable automatic p10k config. If you need, run 'pk10 config'.
    # To load the saved config do 'source ~/.config/zsh/.p10k.zsh'
    POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
    source ~/.config/zsh/.p10k.zsh

    # OPEN FROM CURRENT DIR
    # Commands to be executed before the prompt is displayed
    # Save current working dir
    # save path on cd
    function cd {
        builtin cd $@
        pwd > ~/.cwd
      }

    # Change to saved working dir
    [[ -f "/home/$USER/.cwd" ]] && cd "$(< /home/$USER/.cwd)"


    # Capital Letter [auto-complete]
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

    # ZSH Syntax Highlighting Plugin
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

    # ZSH Colorize Plugin
    ZSH_COLORIZE_TOOL=pygments
    ZSH_COLORIZE_STYLE="colorful"

    # ZSH Vi-Mode Plugin[Disable the cursor style feature]
    # ZVM_CURSOR_STYLE_ENABLED=false

    # ZSH-z Plugin
    zstyle ':completion:*' menu select

    # SSH Keys availability for Git and GitUI [with ]
    # plugins=(git ssh-agent)
    #zstyle :omz:plugins:ssh-agent agent-forwarding on
    # eval "$(ssh-agent -s)"
    # ssh-add ~/.ssh/id_rsa
    # plugins=(ssh-agent)
    # zstyle :omz:plugins:ssh-agent agent-forwarding on
    # zstyle :omz:plugins:ssh-agent identities id_rsa

    # CD Command Behaviour
    alias ..='cd ..'
    alias ...='cd ../../../'
    alias ....='cd ../../../../'

    # Send usig ',s' selected text to a tmux called y


    # Change to saved working dir
    [[ -f "/home/$USER/.cwd" ]] && cd "$(< /home/$USER/.cwd)"
    # Variables
    export EDITOR="nvim"
    export TERMINAL="urxvt"
    export BROWSER="brave-browser"
    export CHROME_EXECUTABLE="brave-browser"          # Flutter Dependency

    # PATH
    export PATH=$NIXOS_CONFIG_DIR/bin/:$PATH
    export PATH=$HOME/.yarn/bin:$PATH                                        # Yarn Global Binaries
    export PATH=$HOME/.npm-packages/bin:$PATH                                # NPM Global Binaries
    export PATH=$HOME/go/go/bin:$PATH                                        # Go Binaries
    export PATH=$HOME/.local/share/cargo/bin:$PATH                           # Cargo Binaries
    export PATH=$HOME/dotfiles/bin:$PATH                                     # Custom Commands
    export PATH=$HOME/flutter/bin:$PATH                                      # Flutter Binaries
    export PATH=$HOME/.bin/draw/bin:$PATH                                    # Draw Binaries
    export PATH=$HOME/.bin/tx2uml/lib:$PATH                                  # Draw Binaries
    export PATH=$HOME/.bin/dafny:$PATH                                       # Dafny Binaries
    export PATH=$HOME/.foundry/bin:$PATH                                     # Foundry Binaries
    export PATH=$HOME/.huff/bin:$PATH                                        # Huff EVM compiler
    export PATH=$HOME/.elan/bin:$PATH                                        # Elan Binaries

    # Move Paths
    export PATH=$HOME/.bin/move/target/debug:$PATH                           # Move Binaries
    export PATH=$HOME/.dotnet/tools:$PATH                                    # Move Tools


    # Boogie [./move/scripts/dev_setup.sh -y]
    export C_HOME=/opt/cargo
    export BOOGIE_EXE=$HOME/.dotnet/tools/boogie
    export Z3_EXE=$HOME/bin/z3
    export CVC5_EXE=$HOME/bin/cvc5
    export DOTNET_ROOT=$HOME/.dotnet
    export DAFNY_HOME=$HOME/.bin/dafny
    export Z3_PATH=$HOME/bin


    # Clean up
    export XDG_DATA_HOME="$HOME/.local/share"
    export XAUTHORITY="$HOME/.Xauthority"
    export CARGO_HOME="$XDG_DATA_HOME/cargo"
    export GEM_HOME="$HOME/.local/share/gem"
    export XCOMPOSECACHE="$XDG_CACHE_HOME"/X11/xcompose
    export XCOMPOSEFILE="$XDG_CONFIG_HOME"/X11/xcompose
    export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
    export USERXSESSION="$XDG_CACHE_HOME/X11/xsession"
    export USERXSESSIONRC="$XDG_CACHE_HOME/X11/xsessionrc"
    export ALTUSERXSESSION="$XDG_CACHE_HOME/X11/Xsession"
    export ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"
    export LESSHISTFILE=-
    export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
    export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
    export OPENAI_API_KEY="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"

    # I honestly don't know what this does
    autoload -U colors && colors
    #eval "$(dircolors -b)"
    setopt histignorealldups sharehistory

    # Enable completion
    autoload -Uz compinit
    zstyle ":completion:*" menu select
    zstyle ":completion:*" list-colors ""
    zmodload zsh/complist
    compinit -d $HOME/.cache/zcompdump
    _comp_options+=(globdots)

    # Fix tmux bck-i-search [ctrl + r]
    bindkey -e

    # Set vi-mode and bind ctrl + space to accept autosuggestions
    bindkey '^ ' autosuggest-accept

    # End [initExtra]
    '';


    # Tweak settings for history
    history = {
        save = 1000;
        size = 1000;
        path = "$HOME/.cache/zsh_history";
    };

    # Set some aliases
    shellAliases = {
        py = "python3.11";
        sc = "scrot -s -e 'xclip -selection clipboard -t image/png -i $f' -e 'mv $f ~/Pictures'";
        agi =  "ag --ignore-dir={node_modules,abis}";
        i = "ipython";
        y = "tmux -L y";
        d = "cd ~/dotfiles && nvim .";
        o = "i3lock && xset dpms force off";
        g = "gitui";
        t = "tmux";
        q = "exit";
        c = "clear";
        unziptar = "tar -xvzf";
        mkdir = "mkdir -vp";
        mv = "mv -iv";
        cp = "cp -riv";
        cat = "bat --paging=never --style=plain";
        fzf = "fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'";
        ls = "eza -bghH --icons";
        l = "eza -bghHal";
        tree = "eza --tree";
        home = "nvim $HOME/.config/nixpkgs/home.nix";
        config = "nvim $$HOME/.config/nixpkgs/configuration.nix";
        nvimconf = "nvim $HOME/config/app/nvim/nvim.nix";
        switch = "home-manager switch";
        nd = "nix develop -c $SHELL";
    };

    # Source all plugins, nix-style
    plugins = [];
}
