default:
	@just --list

build:
	sudo nixos-rebuild switch --flake .#fl13pro

fmt:
	find . -type f -name '*.nix' -print0 | xargs -0 nix fmt --

check:
	nix flake check

up:
	nix flake update