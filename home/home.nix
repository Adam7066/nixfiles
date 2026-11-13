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
    ./git.nix
    ./gpg.nix
    ./nixvim.nix

    ./noctalia
    ./vscode
    ./zed
    ./zen-browser
    ./zsh
  ];

  xdg.configFile."niri".source = config.lib.file.mkOutOfStoreSymlink niriPath;
}
