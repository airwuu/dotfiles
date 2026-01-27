{ pkgs, config, lib, ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "JetBrainsMonoNL Nerd Font:size=14";
        pad = "10x0";
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
  
  xdg.dataFile."caelestia/templates/foot" = {
    source = ./template;
  };
}
