{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # bitwarden-desktop
    corepack
    # discord
    fastfetch
    ghostty
    gnumake
    go
    # google-chrome
    just
    ni
    python3
    # slack
    # snx-rs
    # telegram-desktop
    uv
    vscode
    nautilus
  ];
}
