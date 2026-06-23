{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ghostty
    gnumake
    go
    just
    vscode
    nautilus
  ];
}
