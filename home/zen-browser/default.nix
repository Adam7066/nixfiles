{ inputs, ... }:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    profiles.default = {
      isDefault = true;
      name = "Default";

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };

      userChrome = ''
        @import ~/.cache/noctalia/zen-browser/zen-userChrome.css;

        .zen-current-workspace-indicator {
          display: none !important;
        }
      '';

      userContent = ''
        @import ~/.cache/noctalia/zen-browser/zen-userContent.css;
      '';
    };
  };
}
