{ pkgs, unstable }:

let
  a = 10;
  #not = if pkgs.stdenv.isLinux then inotify-tools else fswatch;
in
  with pkgs; [
    shellcheck
    # used by plantuml [solidity visual plugin in vscode]
    graphviz
    keepassxc
    qrencode
    gh

    # neovim with lua
    lua
    sumneko-lua-language-server
    silver-searcher
    clang-tools
    cppcheck
    ctags

    # Java
    gradle

    # Deno
    deno

    # Idris
    idris2

    # Haskell
    cabal2nix
    nix-prefetch-git
    cabal-install
    ghc


    # Shell scripting
    shfmt
    shellcheck
    shellharden
    # data processing
    jq unzip xmlformat
    unzip

    # git
    git git-secret
    gitui

    # cool
    asciinema
    # api
    httpie curl

    # sys
    killall netcat-gnu tree
    htop entr bat eza xclip
    cloc

    # utils
    wipe
    fswatch
    time
    websocat
    # email
    himalaya

    # flakes
    #nixUnstable

    # fonts
    terminus_font
    ubuntu_font_family
    (pkgs.nerdfonts.override { fonts = ["FiraCode" "Hack" "Terminus" "Ubuntu" "JetBrainsMono"]; })

  ]
