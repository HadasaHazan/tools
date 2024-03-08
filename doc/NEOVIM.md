## Neovim Remapping Cheat Sheet

This cheat sheet summarizes keyboard shortcuts customized in your Neovim configuration.

**Leader Key:**

* Leader key is set to `,` (comma).

**Normal Mode:**

* Arrow keys are disabled by default.
* `<leader>c`: Clear search highlighting.
* `<F2>`: Toggle auto-indenting for pasted code.
* `<leader>tk`: Change vertical split to horizontal.
* `<leader>th`: Change horizontal split to vertical.
* `Ctrl` + `h`, `j`, `k`, `l`: Move between splits.
* `<leader>w`: Hop to word using motion plugin.
* `<leader>l`: Hop to line using motion plugin.
* `<leader>r`: Reload configuration without restarting Neovim.
* `<leader>q`: Close all windows and exit Neovim.

**Insert Mode:**

* `Ctrl` + `h`, `j`, `k`, `l`: Move between splits while in insert mode (requires exiting insert mode first with `Esc`).
* `<leader>s`: Save the buffer.
* `<Ctrl-c>`: Close the buffer.

**Visual Mode:**

* `<` and `>` in visual mode stay in indent mode.
* Move text up/down with `<A-j>` and `<A-k>`.
* Yank line with `p`.

**Visual Block Mode:**

* `J`: Move block of text down.
* `K`: Move block of text up.
* `<A-j>` and `<A-k>`: Move block of text up/down (same as visual mode).

**Splits:**

* `<Ctrl-n>` and `<Ctrl-N>`: Open vertical split.
* `tt`: Open new tab.
* `tn`: Switch to next tab.
* `tp`: Switch to previous tab.
* `tc`: Close current tab.

**Other:**

* `map('t', '<Esc>', '<C-\\><C-n>', { noremap = true })`: Exit terminal mode with `Esc`, then send Ctrl-\ followed by Ctrl-n.



## Neovim LSP Navigation and Code Cheat Sheet

This cheat sheet summarizes keyboard shortcuts for interacting with Language Server Protocol (LSP) features in Neovim. These shortcuts assume the normal mode (`n`) is active.

**Navigation:**

* `gd`: Jump to definition of symbol under cursor.
* `gD`: Jump to declaration of symbol under cursor.
* `K`: Show documentation popup for symbol under cursor.
* `gi`: Find implementations of symbol under cursor (if supported by LSP server).

**Signature Help:**

* `<C-k>` (Hold Ctrl key and press `k`): Show signature help for function under cursor.

**Workspace Management:**

* `<space>wa`: Add current directory as a workspace folder for LSP.
* `<space>wr`: Remove current directory as a workspace folder for LSP.
* `<space>wl`: List current workspace folders for LSP.

**Code Refactoring:**

* `<space>rn`: Rename symbol under cursor (requires server support).
* `<space>D`: Find type definition of symbol under cursor.

**Code Actions:**

* `<space>ca`: Show code actions for the current code location (e.g., refactorings, quick fixes).

**Diagnostics:**

* `<space>e`: Show diagnostics (errors, warnings) for the current line.
* `[d`: Navigate to the previous diagnostic error/warning.
* `]d`: Navigate to the next diagnostic error/warning.
* `<space>q`: Open quickfix list for all diagnostics in the buffer.

**Formatting:**

* `<space>f`: Format the current buffer using LSP server capabilities (if supported).

