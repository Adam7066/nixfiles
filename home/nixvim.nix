{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    opts = {
      number = true;
      relativenumber = true;
      cursorline = true;
      tabstop = 4;
      shiftwidth = 4;
    };

    plugins = {
      lightline.enable = true;
    };
  };
}
