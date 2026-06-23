{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    btop
    curl
    git
    vim
    wget
  ];
}
