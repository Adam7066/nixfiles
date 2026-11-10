{ ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [ "nix" "toml" "justfile" ];
    userSettings = {
      buffer_font_size = 16;
      ui_font_size = 16;
      terminal = {
        font_size = 16;
      };
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
