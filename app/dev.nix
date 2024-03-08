{ pkgs, unstable }:

let
  buildInputs = with pkgs; [ openssl.dev ];

  # To compile arb-avm
  nativeBuildInputs = with pkgs; [ cmake pkg-config zlib ];

in
  with pkgs; [
    unstable.neovim

    # dafny
    unstable.dafny

    # lean4
    lean4

    # go-ethereum
    slither-analyzer
    evmdis
    go-ethereum
    bitcoin
    #echidna
    unstable.framesh

    # C
    gcc gnumake cmake

    # c++ [for arb-avm | see ../conf/coc]
    ccls     # for the language-server in nvim
    libtool
    automake
    autoconf
    autogen
    rocksdb
    gmp
    #boost
    cmake
    ninja
    swig
    pcre
    bison
    flex
    #openssl
    libxml2 libxslt openssl
    readline zlib

    # libs
    nodejs_21 yarn yarn2nix

    # java
    unstable.jdk21

    # notes
    jrnl
  ]
