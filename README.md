Install
=======

## Netfree

- Install netfree ubuntu certificate
- Install browser certificate

```
1.2.3.4
```

## Install Slack

* [slack-ubuntu](https://slack.com/downloads/linux)

## Install System Tools

Linux tools [already installed on the root user]

```
sudo apt install htop aptitude git curl asciinema
```

## Create Keys

Github uses ssh keys to access our repos and also to access our server.
Leave the passcode in blank.


```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
cat ~/.ssh/id_rsa.pub
```

* be sure every linux has only one name
* send the public keys **ONLY** on slack
* add the keys to the remote server



## Connect to Lab Server

```
ssh 34.165.212.190
```


## Clone Tools and Lab

```
git clone git@github.com:blockchain-audit/labs.git
git clone git@github.com:blockchain-audit/tools.gi
```


## Add sudo

If you are using installing a local Debian [not in the cloud], you probably will need
to add sudo power for you.


```
## add to sudo users
/sbin/usermod -aG sudo my_user

## verify
getent group sudo

## free sudo from password
vi /etc/sudoers

## limit partially or full access [second option]
my_user   ALL = NOPASSWD: /bin/systemctl restart httpd.service, /bin/kill
my_user   ALL = NOPASSWD: ALL

```

## Nix

[Nix](https://nixos.org/) is both a package manager and a special language used to describe software for that manager. It offers a unique approach to handling software on your system. Here are some of the key advantages of Nix:

* **Reproducible Builds:** Every package build is isolated and uses its own dependencies, leading to highly reliable and repeatable builds. This makes it easier to ensure everyone has the same environment regardless of their system.
* **Easy System Customization:** Because Nix uses a declarative configuration, customizing your system is straightforward. You can easily switch between different software versions or desktop environments by modifying the configuration file.
* **Safe Rollbacks:** Since Nix doesn't overwrite existing system files, rolling back to a previous system state is simple. This allows you to experiment without worrying about breaking your system.
* **Large Package Collection:** Nixpkgs, a community-maintained repository, offers a vast collection of software packages.


## Install Home Manager

```
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

```

In case it finds difficult to find the NIX_PATH, use this commands:

```
## check install info
nix-shell -p nix-info --run "nix-info -m"

## export path
export NIX_PATH=${NIX_PATH:+$NIX_PATH:}$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels

## or this
export NIX_PATH=${NIX_PATH:+$NIX_PATH:}$HOME/.nix-defexpr/channels

```


## Install the Tools

It will create a link to dotfiles repo

```
rm -rf /home/$USER/.config/home-manager
ln -s /home/$USER/tools /home/$USER/.config/home-manager
```


## ZSH Theme

We are using the [powerlevel10k](https://github.com/romkatv/powerlevel10k) that is very good and lightweight. After doing the wizard for the first time to config it, it saves a config file in the ~/.config/zsh/.p10k.zsh file, so I added it to the config folder here, and pointed to it using the home.nix, so all the machines will have the same p10k config.


## Set ZSH Default

See [here](https://www.cyberciti.biz/faq/change-my-default-shell-in-linux-using-chsh/) for details

Find the zsh path and add to chsh, exemple:

```
whereis zsh
/nix/store/3h09dhqyl3hgpp9cj3fj01dg9vcj6dgl-user-environment/bin/zsh
sudo chsh -s /nix/store/3h09dhqyl3hgpp9cj3fj01dg9vcj6dgl-user-environment/bin/zsh

## check
grep "^${USER}" /etc/passwd
```

In case you need bash and zsh blocks you, use:

```
sudo /bin/bash
```

Another approach to change the default shell as described [here](https://discourse.nixos.org/t/using-home-manager-to-control-default-user-shell/8489/3)

```
which zsh
$ /home/my_user/.nix-profile/bin/zsh

sudo -i
vi /etc/shells

[add the /home/my_user/.nix-profile/bin/zsh]
exit

sudo chsh -s /home/my_user/.nix-profile/bin/zsh

```


If you find a conflict between the zsh in home-manager and zsh in the nix packages, probably the solution
is to change the priority:

```
# see what nix version you have
$ nix-env -q

dapp-0.35.0
ethsign-0.17.1
hevm-0.49.0
home-manager-path
nix-2.5.1
nss-cacert-3.71
seth-0.12.0
solc

nix-env --set-flag priority 6 nix-2.5.1
```

## Foundry

Install Foundry compiler for solidity

```
curl -L https://foundry.paradigm.xyz | bash
```

## Huff

Install Huff compiler

```
curl -L get.huff.sh | bash
```

## Go

Go is already installed in the nix home manager config, to start coding:

* [go-starter](https://go.dev/doc/tutorial/getting-started)

## Dafny

* [dafny-binaries](https://github.com/dafny-lang/dafny/releases/tag/v4.4.0)
* [dafny-ubuntu-4.4](https://github.com/dafny-lang/dafny/releases/download/v4.4.0/dafny-4.4.0-x64-ubuntu-20.04.zip)

## Linux Keyboard Layout

Fix the tilde in case it's not near the 'z' as described [here](https://help.ubuntu.com/community/AppleKeyboard)
```
echo 0 | sudo tee /sys/module/hid_apple/parameters/iso_layout
```

## Solidity Tools

* [echidna](https://github.com/crytic/echidna) - Fuzzy Tester
* [evmdis](https://github.com/Arachnid/evmdis) - EVM disassembler and abstract execution
* [slither](https://github.com/crytic/slither) - Solidity Source Analyzer

## Nix Flakes

* https://nixos.wiki/wiki/Flakes

```
{
  description = "A Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: {
    homeConfigurations = {
      my_user = inputs.home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        homeDirectory = "/home/my_user";
        username = "my_user";
        configuration.imports = [ ./home.nix ];
      };
    };
  };
}
```

## Neovim + Lua

For linux, use the binary below, but for mac, use brew. The nvim that comes with the nix package,
is not stable with the lua plugins added dynamically by nix.

* [download](https://github.com/neovim/neovim/releases/download/v0.7.2/nvim.appimage)
* [ctags](https://kulkarniamit.github.io/whatwhyhow/howto/use-vim-ctags.html)



## Language Servers

* [language-servers-list](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

### Language Servers Used
```
npm install -g pyright
npm install -g typescript-language-server typescript
npm install -g solidity-language-server
npm install -g svelte-language-server
npm install -g vscode-langservers-extracted


go install golang.org/x/tools/gopls@latest

```
* [lua-language-server](https://github.com/sumneko/lua-language-server/wiki/Getting-Started#command-line) - here you have to clone, build and install manually


Run 'TSUpdate' after installing the tree-sitter.

## Vimspector

* [haskell-debugging](https://t4ccer.com/posts/debugging-haskell-in-vim/)

Save a '.vimspector.json' file in the root of your project, like this:

```json
{
  "configurations": {
    "Node": {
      "adapter": "vscode-node",
      "filetypes": [ "javascript" ],
      "default": true,
      "configuration": {
        "request": "launch",
        "protocol": "auto",
        "stopOnEntry": true,
        "console": "integratedTerminal",
        "program": "${workspaceRoot}/test.js",
        "cwd": "${workspaceRoot}"
      }
    },
    "Python": {
      "adapter": "debugpy",
      "filetypes": [ "python" ],
      "default": true,
      "configuration": {
        "request": "launch",
        "program": "${workspaceRoot}/test.py",
        "stopOnEntry": true,
        "cwd": "${workspaceRoot}"
      }
    }
  }
}
```

If you enabled HUMAN mode mappings, press <F9> to toggle a breakpoint on that line. You should see a marker in the Vim gutter. You can press <F9> again to disable that breakpoint, and a third time to remove it. Press <F5> to start debugging. This will read your configuration and as there’s only one debug config launch that one. You should be presented with a question about which test to run. You expected that though, so enter it.



## Nix Upgrade

* https://nixos.org/manual/nix/stable/installation/upgrading.html

```
nix-channel --update; nix-env -iA nixpkgs.nix nixpkgs.cacert; sudo systemctl daemon-reload; sudo systemctl restart nix-daemon
```

## Magic Mouse - Debian

* https://askubuntu.com/questions/589617/apple-magic-mouse-frequently-disconnects-and-reconnects

## Vimium [Brave Plugin]

* https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en

```
map 9 nextTab
map 8 previousTab
```

## Add to your .bashrc [if you are using nixos]

```
source ~/.nix-profile/etc/profile.d/nix.sh
```

## Golang

* [vim-go-config](https://medium.com/pragmatic-programmers/configuring-vim-to-develop-go-programs-e839641da4ac)

## Wipe

Delete file forever

```
wipe -rfi private/*
```


## Zsh Performance

* https://htr3n.github.io/2018/07/faster-zsh/
* https://stackoverflow.com/questions/62499268/zsh-shell-taking-abnormally-long-time-during-initial-startup
* https://unix.stackexchange.com/questions/565905/oh-my-zshs-prompt-is-slow-how-to-fix-this

## Fonts

Create the local fontconfig directory (or check if it's there):

```shell
$ mkdir -p ~/.config/fontconfig/conf.d/
Create a file in that directory (called, for example, 10-nix-fonts.conf) specifying where to locate the Nix fonts:
```

```xml
<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>
  <dir>~/.nix-profile/share/fonts/</dir>
</fontconfig>

```

```
fc-cache -fv
```

## Postgresql

If you get a 'COULD NOT CREATE LOCK' error, edit the postgres.conf file and change the 'unix_socket_directories' to /tmp
as described [here](https://stackoverflow.com/questions/63707480/postgresql-fatal-could-not-create-lock-file-var-run-postgresql-s-pgsql-5432)


* [using-postgres-with-nix](https://mgdm.net/weblog/postgresql-in-a-nix-shell/)

## Languages

* [node](https://nixos.wiki/wiki/Node.js)
* [haskell](https://www.tpflug.me/2019/01/14/haskell-nix-vim/)
* [rust](https://nixos.wiki/wiki/Rust)
* [rust-overlay](https://github.com/oxalica/rust-overlay)
* [rust-c++](https://hadean.com/blog/managing-rust-dependencies-with-nix-part-i/)
* [rust-api](https://hub.qovery.com/guides/tutorial/create-a-blazingly-fast-api-in-rust-part-1/)
* [rust-darwin-libiconv-fix](https://github.com/yaxitech/ragenix/blob/acd6bef157f967fa7ed266a0f8e4ea8949afeaf4/flake.nix)

> **RUST**
> we are using rust overlay instead of
> unstable.cargo unstable.rustc

> On Coc settings  /conf/coc , you can add a list
> of Rust [diagnostics](https://github.com/rust-analyzer/rust-analyzer/blob/c483212f274e9a5e348451cd4bbd0487e172458b/docs/user/generated_diagnostic.adoc) to disable


## Ethereum

* [dapp-tools](https://dapp.tools)

It's possible to add to the channel:

```
curl https://nixos.org/nix/install | sh
nix-channel --add https://nix.dapphub.com/pkgs/dapphub
nix-channel --update
nix-env -iA dapphub.hevm
```

Install it:

```
curl https://dapp.tools/install | sh
```

Or a Shell, as we find [here](https://github.com/smartcontractkit/dapptools-starter-kit)

```nix
let
  pkgs = import (builtins.fetchGit rec {
    name = "dapptools-${rev}";
    url = https://github.com/dapphub/dapptools;
    rev = "adcc076b1441b3a928a8f0b42b2a63f05d9bcf0d";
  }) {};

in
  pkgs.mkShell {
    src = null;
    name = "dapptools-template";
    buildInputs = with pkgs; [
      pkgs.dapp
      pkgs.seth
      pkgs.go-ethereum-unlimited
      pkgs.hevm
    ];
  }
```


## Simple Json Log Viewer

* https://github.com/brocode/fblog


```
cargo install fblog

tail -f file | fblog

```

## Entr

Run code when file changes
* https://www.systutorials.com/docs/linux/man/1-entr/

```
Rebuild a project if source files change, limiting output to the first 20 lines:
$ find src/ | entr sh -c 'make | head -n 20'
Launch and auto-reload a node.js server:

$ ls *.js | entr -r node app.js
Clear the screen and run a query after the SQL script is updated:

$ echo my.sql | entr -p psql -f /_
Rebuild project if a source file is modified or added to the src/ directory:

$ while true; do ls src/*.rb | entr -d make; done
```


## Gitui

To make gitui push using your private keys, you will need to add your private key to the
agent or [automate](https://superuser.com/questions/1152833/save-identities-added-by-ssh-add-so-they-persist)
it if you are using debian

```
eval `ssh-agent`
ssh-add ~/.ssh/id_rsa
```

## Mac

* https://gist.github.com/mandrean/65108e0898629e20afe1002d8bf4f223


## Resources


* https://ghedam.at/24353/tutorial-getting-started-with-home-manager-for-nix
* https://dzone.com/articles/nixos-home-manager-on-native-nix-flake-installatio



NIX-OS
======


## Upgrade Nix


For Linux single user:

```
nix-channel --update
nix-env -iA nixpkgs.nix nixpkgs.cacert
```

See [more](https://nixos.org/manual/nix/stable/installation/upgrading.html)


## Flakes

Nix Flakes are an upcoming feature of the Nix package manager.

Flakes allow you to specify your code's dependencies (e.g. remote Git
repositories) in a declarative way, simply by listing them inside a flake.nix
file.

* [how-to-install-flakes](https://nixos.wiki/wiki/Flakes)
* [pratical-flakes](https://serokell.io/blog/practical-nix-flakes)

## Home Manager

Configure your home with the general tools before.

* [home-manager](https://nixos.wiki/wiki/Home_Manager)
* [stand-alone-install](https://nix-community.github.io/home-manager/index.html#sec-install-standalone)
* [oh-my-zsh-plugins](https://github.com/chisui/zsh-nix-shell)
* [home-example](https://github.com/yrashk/nix-home/blob/master/home.nix)
* [home-example2](https://github.com/srid/nixos-config)
* [biosan-dotfiles-3](https://github.com/biosan/dotfiles)
* [hlissner-dotfiles-613](https://github.com/hlissner/dotfiles)

## Gitui

```
# now it is in the ssh
# here you can find all you ssh key/files related to your all projects. now, type the following command to show you if any ssh key available
cd ~/.ssh

# this will show you all available ssh, in my case there were two
# now, you will need to start an agent to add a ssh in it. For this type following command

ls

# now last but not least you will add a ssh in this agent type following command
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

* [nix-os-manual](https://nixos.org/manual/nix/stable/)
* [nix-tour](https://nixcloud.io/tour)
* [nix-tutorials](https://nix.dev/tutorials/ad-hoc-developer-environments)
* [nix-cheatsheet](https://nixos.wiki/wiki/Cheatsheet)


## DOTFILES

* https://github.com/Olical/dotfiles
* https://www.youtube.com/watch?v=rUvjkBuKua4
* https://github.com/hlissner/dotfiles



## Directories

~/.nix-defexpr
~/.nix-profile



```
# search packages [web](https://search.nixos.org/packages)
nix search <package-name>

# list installed packages
nix-env --query --installed

# upgrade nix
nix upgrade-nix

```



## Simple Install


```
## simple install
nix-env --install firefox
```


## System Wide Install


```nix
environment.systemPackages = with pkgs; [
    wget vim nano zsh file
]
```

Relevant Commands:

```
# rebuild and not switch OS env
nixos-rebuild

# switch automatically
sudo nixos-rebuild

# update channel and force rebuild of configuration.nix
nix-channel --update
nixos-rebuild

# update user-wide
nix-channel --update
nix-env -u

# keep up-to-date with the channel
nix-channel --update nixpkgs
nix-evn -u '*'

# list generations
nix-env --list-generations

# delete all old generations forever
nix-collect-garbage -d
```


## Install via config.nix

Create a file ~/.nixpkgs/config.nix

```nix
{ pkgs }:
let
    inherit (pkgs) lib buildEnv;

in {
    allowUnfree = true; # allow non-free, non-open source packages to install

    # if you are using Chromium, this is likely something you want to enable an option for
    chromium = {
        enableWideVine = true; # enable the DRM to allow things like Netflix to work
    };

    packageOverrides = pkgs: {
        desktopDev = lib.lowPrio (buildEnv {
        name = "devEnvApps";
        paths = with pkgs; [
            vscode
            elixir
            nodejs
            git
            file
            unzip
        ];
        });
        kdeApplications = lib.lowPrio (buildEnv {
        name = "kdeApps";

        paths = with pkgs; [
            latte-dock
            yakuake
            kate
            kdeconnect
            okular
            ark
        ];
        });
    };
}
'''

Relevant Commands:


'''
## install kdeApps group
nix-env -i kdeApps

## install devEnvApps
nix-env -i devEnvApps

## unistall system-wide
nix-env --uninstall <package-name>
```

## Switch to Unstable

```
## change channel and rebuild
nix-channel --add https://nixos.org/channels/nixos-unstable nixos
nixos-rebuild

## remove stable channel
nix-channel --remove stable

## update
nix-env -u

## (if you get a name confilct warning, remove the old channel)
nix-channel --add https://nixos.org/channels/nixos-unstable nixos
```


## Install Specific Pkg from Unstable


```
## clone unstable packages
git clone https://github.com/NixOS/nixpkgs.git ~/nixpkgs-unstable

## install from file
nix-env -iA <packagename> -f ~/nixpkgs-unstable/

```

## Upgrade & Rollback

```
## upgrade packages [e.g. git zip]
nix-env --upgrade zip git
```

## Cleanup Old Versions of Packages

```
## remove all but the current on
nix-env --delete-generations old

## delete specific generations, i.e. 10 11 14
nix-env --delete-generations 10 11 14

## delete generation by time
nix-env --delete-generations 14d

## uninstall [but leave the package if you want to rollbak]
nix-env --uninstall firefox

## see what will be deleted
nix-store --gc --print-dead

## garbage collector
nix-store --gc

## garbage collector [other way]
nix-collect-garbage


```



# Instructions for MACOS

```
$ sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume --daemon
# reboot
$ source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
$ echo 'export NIX_PATH=darwin-config=$HOME/.nixpkgs/darwin-configuration.nix:$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH' | tee -a ~/.zshrc
$ echo 'source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh' | tee -a ~/.zshrc
$ nix-channel --add https://nixos.org/channels/nixpkgs-unstable
$ nix-channel --add https://github.com/LnL7/nix-darwin/archive/master.tar.gz darwin
$ nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
$ nix-channel --update
$ bash
$ nix-shell '<home-manager>' -A install
$ home-manager switch
$ nix-shell '<darwin>' -A installer
$ darwin-rebuild switch

```

# If SSL errors occur, try
```
sudo rm /etc/ssl/certs/ca-certificates.crt
```

# Installation issue tickets
* https://github.com/LnL7/nix-darwin/issues/158
* https://github.com/NixOS/nix/issues/2899
* https://github.com/NixOS/nix/issues/2925
* https://github.com/NixOS/nix/issues/3261
* https://github.com/NixOS/nix/issues/3435
* https://github.com/NixOS/nix/issues/3456
* https://github.com/NixOS/nix/issues/3616

# Installation guides
* https://nixos.org/manual/nix/stable/#sect-macos-installation
* https://nix-community.github.io/home-manager/index.html#sec-install-nix-darwin-module
* https://nixos.wiki/wiki/Home_Manager
* https://www.mathiaspolligkeit.de/dev/exploring-nix-on-macos/
* https://www.nmattia.com/posts/2018-03-21-nix-reproducible-setup-linux-macos.html
* https://github.com/softinio/dotfiles/blob/master/nix/configuration.nix
* https://dev.to/louy2/use-nix-on-macos-as-a-homebrew-user-22d
* https://iilab.org/news/2015-03-27-nix-osx-haskellng-hakyll.html

# 'Nixology' by Burke Libbey
* https://www.youtube.com/watch?v=NYyImy-lqaA&list=PLRGI9KQ3_HP_OFRG6R-p4iFgMSK1t5BHs

# Other peoples' nix configs
* https://www.reddit.com/r/NixOS/comments/9bb9h9/post_your_homemanager_homenix_file/
* https://git.sr.ht/~ben/cfg/tree
* https://github.com/srid/nix-config
* https://github.com/yrashk/nix-home
* https://github.com/softinio/dotfiles/tree/master/nix
* https://github.com/JonathanReeve/dotfiles/tree/minimal/dotfiles




Rust on NixOS
=============

## Flake

* https://serokell.io/blog/practical-nix-flakes
* https://hoverbear.org/blog/a-flake-for-your-crate/
* https://www.srid.ca/rust-nix
* https://github.com/oxalica/rust-overlay

```
nix flake init -t github:serokell/templates#rust-crate2nix
```

## O/R
* https://diesel.rs/

## REST API
* https://hub.qovery.com/guides/tutorial/create-a-blazingly-fast-api-in-rust-part-1/
* https://blog.logrocket.com/create-a-backend-api-with-rust-and-postgres/

## Geral
* https://nixos.wiki/wiki/Rust
* https://discourse.nixos.org/t/rust-src-not-found-and-other-misadventures-of-developing-rust-on-nixos/11570/5
* https://github.com/srid/rust-nix-template [it works with the language server]


## Web
* https://github.com/nasirhm/hello-rust-nix

## EVM
* https://github.com/joelburget/evm-rust
* https://github.com/rust-blockchain/evm


## Neovim

* https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
