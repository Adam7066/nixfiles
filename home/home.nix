{ config, pkgs, ... }:
let
  niriPath = "${config.home.homeDirectory}/nixfiles/home/niri";
in
{
  programs.home-manager.enable = true;

  home = {
    username = "smallten";
    homeDirectory = "/home/smallten";
    stateVersion = "26.05";

    pointerCursor = {
      enable = true;
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.capitaine-cursors;
      name = "capitaine-cursors";
      size = 32;
    };
  };

  imports = [
    ./apps.nix
    ./flatpak.nix
    ./git.nix
    ./gpg.nix
    ./zen-browser/zen-browser.nix
    ./zsh/zsh.nix
    ./noctalia/noctalia.nix
    ./nixvim.nix
    ./vscode/vscode.nix
  ];

  xdg.configFile."niri".source = config.lib.file.mkOutOfStoreSymlink niriPath;
}
