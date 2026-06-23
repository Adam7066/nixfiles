{ pkgs, ... }:
let
  customized_sddm_astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "pixel_sakura";
    themeConfig = {
      FontSize = 14;
    };
  };
in
{
  services.xserver.xkb = {
    layout = "tw";
    variant = "";
  };

  environment.systemPackages = with pkgs; [
    customized_sddm_astronaut
    kdePackages.qtmultimedia
  ];
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    extraPackages = with pkgs; [
      customized_sddm_astronaut
    ];
    theme = "sddm-astronaut-theme";
    settings = {
      Theme = {
        Current = "sddm-astronaut-theme";
      };
    };
  };

  services.power-profiles-daemon.enable = true;

  services.upower.enable = true;
}
