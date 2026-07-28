{ pkgs, ... }:
{   
  home.packages = with pkgs; [
    corepack
    fastfetch
    ghostty
    gnumake
    go
    google-chrome
    just
    ni
    python3
    slack
    snx-rs
    telegram-desktop
    uv
    vscode
    nautilus
    nvtopPackages.nvidia
    gitkraken
  ];
}
