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
    uv
    #    vscode
    nautilus
    #    gitkraken
    zed-editor
    proton-pass
    claude-code
    jetbrains.phpstorm
    jetbrains.pycharm
    jetbrains.webstorm
    xwayland-satellite
  ];
}
