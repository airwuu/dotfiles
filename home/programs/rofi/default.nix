{ pkgs, config, lib, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    font = "Roboto 10";
    location = "bottom";
    yoffset = -4;
    theme = "windows11-list-dark";

    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      drun-display-format = "{name}";
      disable-history = false;
      hide-scrollbar = true;
      sidebar-mode = false;
    };
  };
}
