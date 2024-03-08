## Shell Shortcut Cheat Sheet

This cheat sheet summarizes commonly used shell shortcuts.

**Navigation:**

* `cd`: Change directory (e.g. `cd ~/Downloads`)
* `l`: List files in detail (alias for `eza -bghHal`)
* `ls`: List files with icons (alias for `eza -bghH --icons`)
* `tree`: Show directory tree structure (using `eza`)

**Editors:**

* `i`: Launch IPython interactive shell
* `vi`: Open file in Neovim editor
* `d`: Open dotfiles directory in Neovim (`nvim`)
* `nvimconf`: Edit nvim configuration file (`nvim $HOME/config/app/nvim/nvim.nix`)
* `home`: Edit home configuration file (`nvim $HOME/.config/nixpkgs/home.nix`)
* `config`: Edit system configuration file (`nvim $$HOME/.config/nixpkgs/configuration.nix`)

**Git:**

* `g`: Launch GitUI graphical interface

**Terminal Multiplexer:**

* `y`: Start a new Tmux session named "y"
* `t`: Attach to existing Tmux session

**System:**

* `q`: Exit the terminal
* `c`: Clear the terminal screen
* `o`: Lock screen and turn off display

**File Management:**

* `mkdir`: Create directory (with parents if they don't exist - `-p`) and set verbose output (`-v`)
* `mv`: Move files/directories interactively (`-i`), verbose (`-v`)
* `cp`: Copy files/directories interactively (`-i`), recursive (`-r`), verbose (`-v`)
* `unziptar`: Extract compressed tar archive (`.tar.xz`, etc.) (`-x`), verbose (`-v`), and preserve file structure (`-f`)

**Utilities:**

* `py`: Launch Python 3.11 interpreter
* `sc`: Take screenshot and save to clipboard (`scrot`)
* `agi`: Search codebase using silver searcher (`ag`) with node_modules and abis folders ignored
* `fzf`: Fuzzy finder for files with preview using `bat`
* `cat`: Display file contents using `bat` (colored pager)

**NixOS:**

* `switch`: Switch NixOS configuration using home-manager
* `nd`: Develop Nix expression in current shell (`nix develop -c $SHELL`)

