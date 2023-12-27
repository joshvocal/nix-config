SHELL = bash

install-nix:
	sh <(curl -L https://nixos.org/nix/install) --daemon

install-home-manager:
	nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager || true
	nix-channel --update
	nix-shell '<home-manager>' -A install

install-nix-flakes:
	mkdir -p ~/.config/nix/ && echo 'experimental-features = nix-command flakes' > ~/.config/nix/nix.conf

sym-link:
	rm -rf ~/.config/home-manager
	ln -s ~/nix-config ~/.config/home-manager

.PHONY: install-nix install-home-manager install-nix-flakes sym-link

