{ pkgs, ... }:
{
  home.packages = with pkgs; [
    claude-code
    fastfetch
    ghostty
    gnumake
    go
    google-chrome
    jetbrains.datagrip
    jetbrains.phpstorm
    jetbrains.pycharm
    jetbrains.webstorm
    just
    nautilus
    ni
    nodejs_latest
    proton-pass
    python3
    slack
    uv
    xwayland-satellite
    zed-editor
  ];
}
