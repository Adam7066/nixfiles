{ pkgs, ... }:
{
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      substituters = [
        "https://cache.nixos.org/"
        "https://noctalia.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 10;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true; # 相容 Steam/Wine... 32-bit 遊戲
    extraPackages = with pkgs; [
      intel-media-driver # VAAPI (iHD), 新一點的 Intel 內顯
      vpl-gpu-rt # Quick Sync Video
    ];
  };

  environment.variables.LIBVA_DRIVER_NAME = "iHD";

  time.timeZone = "Asia/Taipei";

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
    variables = {
      EDITOR = "vim";
    };
  };

  programs.zsh.enable = true;

  virtualisation.docker = {
    enable = true;
  };

  users.users.smallten = {
    isNormalUser = true;
    description = "smallten";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  system.stateVersion = "26.05";
}
