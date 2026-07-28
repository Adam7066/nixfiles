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
  services.xserver = {
    xkb = {
      layout = "tw";
      variant = "";
    };
    videoDrivers = [ "nvidia" ];
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

  services.gvfs.enable = true;
  services.flatpak.enable = true;

  # 聲音
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # wireplumber.enable = true;
    # wireplumber.extraConfig = {
    #   "51-nvidia-multi-sink" = {
    #     "monitor.alsa.rules" = [
    #       # Device "AD104 High Definition Audio Controller" 選 Pro Audio
    #       {
    #         matches = [
    #           { "device.name" = "~alsa_card.pci-.*_01_00.1"; }
    #         ];
    #         actions.update-props = {
    #           # 關掉自動切 profile/port，避免切換後失聲
    #           "api.acp.auto-profile" = false;
    #           "api.acp.auto-port" = false;
    #           # 讓多個 HDMI/DP 端點同時變成可選 sink
    #           "device.profile" = "pro-audio";
    #         };
    #       }
    #       # 禁用不需要的 sink
    #       {
    #         matches = [
    #           { "node.name" = "alsa_output.pci-0000_01_00.1.pro-output-8"; }
    #         ];
    #         actions.update-props = {
    #           "node.disabled" = true;
    #         };
    #       }
    #       {
    #         matches = [
    #           { "node.name" = "alsa_output.pci-0000_01_00.1.pro-output-9"; }
    #         ];
    #         actions.update-props = {
    #           "node.disabled" = true;
    #         };
    #       }
    #       # 修改 sink 名稱
    #       {
    #         matches = [
    #           { "node.name" = "alsa_output.pci-0000_01_00.1.pro-output-3"; }
    #         ];
    #         actions.update-props = {
    #           "node.description" = "VA24D (HDMI)";
    #           "node.nick" = "VA24D";
    #         };
    #       }
    #       {
    #         matches = [
    #           { "node.name" = "alsa_output.pci-0000_01_00.1.pro-output-7"; }
    #         ];
    #         actions.update-props = {
    #           "node.description" = "PG32UCDP (DP)";
    #           "node.nick" = "PG32UCDP";
    #         };
    #       }
    #     ];
    #   };
    # };
  };
}
