{ ... }:
{
  programs.zed-editor =
    let
      extensions = import ./extensions.nix;
      terminal = import ./terminal.nix;
    in
    {
      enable = true;
      extensions = extensions;
      userSettings = {
        terminal = terminal;

        buffer_font_size = 16;
        ui_font_size = 16;
        agent_ui_font_size = 16;
        theme = {
          mode = "system";
          light = "One Light";
          dark = "One Dark";
        };
        project_panel = {
          dock = "left";
        };
      };
    };
}
