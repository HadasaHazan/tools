{ pkgs, unstable }:
# rev = "9ff53fea04c8ef04586a839256c8361e35a24257";
let
  buildInputs = with pkgs; [ openssl.dev ];

  dapp = import (builtins.fetchGit rec {
    name = "dapptools-${rev}";
    url = https://github.com/dapphub/dapptools;
    rev = "ba9fbcf95c01d247a30b26d7e064e8abdfba79db";
  }) {};

in
  with pkgs; [
    dapp.dapp
    dapp.token
    dapp.ethsign
    dapp.seth
    dapp.go-ethereum-unlimited
    dapp.hevm
  ]
