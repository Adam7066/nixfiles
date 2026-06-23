{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.hack
  ];

  i18n = {
    defaultLocale = "zh_TW.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "zh_TW.UTF-8";
      LC_IDENTIFICATION = "zh_TW.UTF-8";
      LC_MEASUREMENT = "zh_TW.UTF-8";
      LC_MONETARY = "zh_TW.UTF-8";
      LC_NAME = "zh_TW.UTF-8";
      LC_NUMERIC = "zh_TW.UTF-8";
      LC_PAPER = "zh_TW.UTF-8";
      LC_TELEPHONE = "zh_TW.UTF-8";
      LC_TIME = "zh_TW.UTF-8";
    };

    inputMethod = {
      enable = true;
      type = "fcitx5";

      fcitx5 = {
        waylandFrontend = true;
        ignoreUserConfig = true; # 吃下面的 settings，不用 user 的
        addons = with pkgs; [
          fcitx5-mcbopomofo
          kdePackages.fcitx5-chinese-addons
        ];
        settings = {
          inputMethod = {
            "Groups/0" = {
              Name = "Default";
              "Default Layout" = "us";
              DefaultIM = "keyboard-us";
            };
            "Groups/0/Items/0".Name = "keyboard-us";
            "Groups/0/Items/1".Name = "mcbopomofo";
          };
          addons = {
            classicui = {
              globalSection = {
                "Vertical Candidate List" = "True";
              };
            };
          };
        };
      };
    };
  };
}
