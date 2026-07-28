{ inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/apps.nix
    ../../modules/base.nix
    ../../modules/desktop.nix
    ../../modules/locale.nix
    ../../modules/services.nix
  ];

  networking.hostName = "ap201tg";

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    sharedModules = [
      inputs.nix-flatpak.homeManagerModules.nix-flatpak
    ];
    users.smallten = import ../../home/home.nix;
  };
}
