{ pkgs, unstable }:

let
  buildInputs = with pkgs; [ openssl.dev ];

  # To compile arb-avm
  nativeBuildInputs = with pkgs; [ cmake pkg-config zlib ];

  # For another python version, use ex: pkgs.python3 or pkgs.python39
  python-with-packages = pkgs.python311.withPackages (p: with p; [
    ipython
    pandas
    pip
    setuptools
    python-dotenv
    flask
  ]);

in
  with pkgs; [

    # go-ethereum
    slither-analyzer
    evmdis
    go-ethereum
    bitcoin
    #echidna

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
    nodejs_20 yarn yarn2nix

    # python
    python-with-packages

    # java
    unstable.jdk21

    # notes
    jrnl
  ]
