{ builtins, config, pkgs, lib, nixpkgs, ... }:

let
  dag = config.lib.dag;
  pkg-list-opts = {
    pkgs = pkgs;
    # import from stable and master
    unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) {};
   };
  dev       = import ./app/dev.nix pkg-list-opts;
  sys       = import ./app/sys.nix pkg-list-opts;
  dapp      = import ./app/dapp.nix pkg-list-opts;
  zsh_mod   = import ./app/zsh.nix pkgs;
  git_mod   = import ./app/git.nix pkgs;
  tmux_mod  = import ./app/tmux.nix pkgs;
in

{

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "hazan";
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/hazan" else "/home/hazan";

  # Packages that should be installed to the user profile.
  #home.packages = dev ++ sys ++ dapp;
  home.packages = dev ++ sys;

  # Programs
  programs.zsh = zsh_mod;
  programs.git = git_mod;
  programs.tmux = tmux_mod;

  programs.gpg = {
    enable = pkgs.stdenv.isLinux;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.go = {
    enable = false;
    goPath = "/go";
    goBin  = "/go/bin";
  };

  # Imported configs

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  # Home Config Files
  # https://nixos.wiki/wiki/Nix_command
  home.file = {
    ".npmrc".source = ./conf/npmrc;
    ".config/gitui/key_bindings.ron".source = ./conf/gitui-bind;
    ".config/gitui/theme.ron".source  = ./conf/gitui-theme;
    ".config/zsh/.p10k.zsh".source    = ./conf/p10k;
    # nvim-lua-core
    ".config/nvim/init.lua".source               = ./lua/init.lua;
    ".config/nvim/lua/core/init.lua".source      = ./lua/core/init.lua;
    ".config/nvim/lua/core/options.lua".source   = ./lua/core/options.lua;
    ".config/nvim/lua/core/autocmd.lua".source   = ./lua/core/autocmd.lua;
    ".config/nvim/lua/core/mappings.lua".source  = ./lua/core/mappings.lua;
    # nvim-lua-plugins
    ".config/nvim/lua/plugins/init.lua".source       = ./lua/plugins/init.lua;
    ".config/nvim/lua/plugins/others.lua".source     = ./lua/plugins/others.lua;
    ".config/nvim/lua/plugins/colors.lua".source     = ./lua/plugins/colors.lua;
    ".config/nvim/lua/plugins/treesitter.lua".source = ./lua/plugins/treesitter.lua;
    ".config/nvim/lua/plugins/lualine.lua".source    = ./lua/plugins/lualine.lua;
    ".config/nvim/lua/plugins/chatgpt.lua".source    = ./lua/plugins/chatgpt.lua;
    ".config/nvim/lua/plugins/lspconfig.lua".source  = ./lua/plugins/lspconfig.lua;
    ".config/nvim/lua/plugins/cmp.lua".source        = ./lua/plugins/cmp.lua;
    ".config/nvim/lua/plugins/comment.lua".source    = ./lua/plugins/comment.lua;
    ".config/nvim/lua/plugins/gitsigns.lua".source   = ./lua/plugins/gitsigns.lua;
    ".config/nvim/lua/plugins/lean.lua".source       = ./lua/plugins/lean.lua;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;

  # GPG is available only in Linux
  services.gpg-agent = {
      enable = pkgs.stdenv.isLinux;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };
}
