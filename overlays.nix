# https://nixos.wiki/wiki/Overlays
# overlays here will be automatically loaded by all nix tools run as your user
[ (import (builtins.fetchTarball "https://github.com/oxalica/rust-overlay/archive/master.tar.gz")) ]

