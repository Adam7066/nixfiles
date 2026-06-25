{ pkgs, ... }:
let
  fingerprint = "5FEC67797E2A4E4F16CB6DC002FBD8B86C3C6948";
in
{
  programs.gpg = {
    enable = true;
    package = pkgs.gnupg;

    publicKeys = [
      {
        source = pkgs.fetchurl {
          url = "https://keys.openpgp.org/vks/v1/by-fingerprint/${fingerprint}";
          sha256 = "8729ceae5347d19486811b288a173d6da3d4533fef5945b49b9847ac1cc9e25e";
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
    enableSshSupport = false;
    enableExtraSocket = true;
    enableZshIntegration = true;
    sshKeys = [ fingerprint ];
  };
}
