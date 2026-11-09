{ pkgs, ... }:
let
  fingerprint = "091C610D2F80EAD3A54ABDCF71A90CEE9EB01E69";
in
{
  programs.gpg = {
    enable = true;
    package = pkgs.gnupg;

    publicKeys = [
      {
        source = pkgs.fetchurl {
          url = "https://keys.openpgp.org/vks/v1/by-fingerprint/${fingerprint}";
          sha256 = "18xx3pb1sf759alxz420vp2ikhdcfh82qkblcdnx649lfm6508hi";
        };
        trust = "ultimate";
      }
    ];

    settings = {
      default-key = fingerprint;
      keyserver = "hkps://keys.openpgp.org";
    };
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = false;
    enableExtraSocket = true;
    enableZshIntegration = true;
    sshKeys = [ fingerprint ];
    pinentry = {
      package = pkgs.pinentry-qt;
      program = "pinentry-qt";
    };
  };
}
