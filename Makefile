

# NIX

version:
	nix-shell -p nix-info --run "nix-info -m"

clean:
	rm -rf ~/.local/share/nvim
	rm -rf ~/.config/nvim 
	rm -rf ~/.cache/nvim


# GNOME TERMINAL

export-term-colors:
	dconf dump /org/gnome/terminal/legacy/profiles:/ > ./conf/gnome-terminal-profiles.dconf

load-term-colors:
	dconf load /org/gnome/terminal/legacy/profiles:/ < ./conf/gnome-terminal-profiles.dconf
