{ pkgs, lib, config, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ./style.css;
    settings = {
      mainBar = builtins.fromJSON (builtins.readFile ./config.jsonc);
    };
  };

  # Make scripts available in ~/.config/waybar/scripts
  xdg.configFile."waybar/scripts".source = ./scripts;
}
