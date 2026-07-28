{ lib, pkgs, ... }:
{
  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];
    packages = [
      "com.discordapp.Discord"
    ];
  };

  home.activation.discordFlatpakOverrides = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    # Discord Flatpak on NVIDIA+Wayland can hang when Vulkan is enabled.
    ${pkgs.flatpak}/bin/flatpak override --user \
      --env=DISCORD_USER_FLAGS="--disable-features=Vulkan" \
      com.discordapp.Discord
  '';
}
