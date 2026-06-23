{ config, ... }:
let
  niriPath = "${config.home.homeDirectory}/nixfiles/home/niri";
in
{
  programs.home-manager.enable = true;

  home = {
    username = "smallten";
    homeDirectory = "/home/smallten";
    stateVersion = "26.05";
  };

  imports = [
    ./apps.nix
    ./git.nix
    ./zen-browser/zen-browser.nix
    ./zsh/zsh.nix
    ./noctalia/noctalia.nix
  ];

  # TODO: vmware remove
  home.file."nixfiles".source = config.lib.file.mkOutOfStoreSymlink /mnt/hgfs/nixfiles;

  xdg.configFile."niri".source = config.lib.file.mkOutOfStoreSymlink niriPath;
}
