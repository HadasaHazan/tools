## Tmux Cheat Sheet

This cheat sheet summarizes essential tmux shortcuts for navigation, customization, and workflow efficiency.

**General Configuration:**

* **Shell:** Sets zsh as the default shell for tmux sessions.
* **Prefix Key:** Changes the prefix key from `Ctrl-b` to `Ctrl-a` for a more screen-like experience.
* **Vim Mode:** Enables vi-style keybindings for navigation and selection within tmux.
* **Config Reload:** Binds `r` key to reload the tmux configuration file (`~/.tmux.conf`).
* **Session Persistence:** Enables the `tmux-resurrect` plugin to restore tmux sessions (save with `Ctrl-a + s`, restore with `Ctrl-a + r`).


**Navigation:**

* **Window Switching:**
    * `Ctrl-a n`: Next window
    * `Ctrl-a p`: Previous window
* **Pane Selection:**
    * **Vim keys:** `h`, `j`, `k`, `l` (with `Ctrl-a` prefix)
    * **Direct selection:** `Alt` + `[position]` (e.g., `Alt-f` for second pane)
* **Quick Pane Cycling:** `Ctrl-a` followed by `A` selects the next pane.

**Window Management:**

* **New Window:** `Ctrl-a c` creates a new window with the current directory path as the title.
* **Split Window:**
    * `Ctrl-a =`: Splits the window horizontally.
    * `Ctrl-a -`: Splits the window vertically.
* **Resize Panes:**
    * `Ctrl-j`, `Ctrl-k`, `Ctrl-l`, `Ctrl-h`: Resize panes up, down, right, and left, respectively (amount defined in bindings).


**Status Bar:**

* **Colors:** Sets status bar background to black and foreground to white.
* **Left Side:** Displays session name, window index, and window title.
* **Right Side:** Displays date, time, and battery information (assuming a script like `~/bin/battery` exists).

**Additional Notes:**

* `escape-time 0`: Disables a brief delay when pressing the Escape key.
* Refer to the full configuration file for detailed comments and potential fixes.

