{ config, inputs, ... }:
let
  noctaliaPath = "${config.home.homeDirectory}/nixfiles/home/noctalia";
in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];
  programs.noctalia = {
    enable = true;
    systemd.enable = true;
  };

  xdg.configFile."noctalia".source = config.lib.file.mkOutOfStoreSymlink "${noctaliaPath}/config";
  home.file."Pictures/wallpapers".source = config.lib.file.mkOutOfStoreSymlink "${noctaliaPath}/wallpapers";
}
