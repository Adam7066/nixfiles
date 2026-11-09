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

  networking.hostName = "office";

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.smallten = import ../../home/home.nix;
  };
}
