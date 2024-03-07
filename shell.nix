with import <nixpkgs> {};
let
  my-python-packages = python-packages: [
    python-packages.pip
    python-packages.numpy
  ];
  my-python = python39.withPackages my-python-packages;
in
  pkgs.mkShell {
    buildInputs = [
      bashInteractive
      my-python
    ];
    shellHook = ''
      export PIP_PREFIX="$(pwd)/_build/pip_packages"
      export PYTHONPATH="$(pwd)/_build/pip_packages/lib/python3.9/site-packages:$PYTHONPATH"
      unset SOURCE_DATE_EPOCH
      pip3 install setuptools certora-cli
      export PATH=$PATH:/home/henry/dotfiles/_build/pip_packages/bin
    '';
  }
