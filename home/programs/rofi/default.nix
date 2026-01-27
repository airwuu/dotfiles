{ pkgs, lib, config, ... }:
with lib;
let
  # Rofi themes collection from GitHub
  rofi-themes-collection = pkgs.fetchFromGitHub {
    owner = "newmanls";
    repo = "rofi-themes-collection";
    rev = "ec731cef79d39fc7ae12ef2a70a2a0dd384f9730";
    hash = "sha256-96wSyOp++1nXomnl8rbX5vMzaqRhTi/N7FUq6y0ukS8=";
  };

  # Available themes - you can change this to your preferred theme
  # Options: rounded-nord-dark.rasi, spotlight.rasi, simple-tokyonight.rasi,
  #          squared-nord.rasi, launchpad.rasi, etc.
  selectedTheme = "windows11-grid-dark.rasi";

in {
  # Rofi package is already in home.packages, this adds config
  programs.rofi = {
    enable = true;
    theme = "${rofi-themes-collection}/themes/${selectedTheme}";
    terminal = "${pkgs.ghostty}/bin/ghostty";
    extraConfig = ''
      show-icons: true;
      drun-display-format: "{name}";
      font: "JetBrains Mono 12";
    '';
  };

  # Make themes available for rofi-theme-selector
  xdg.dataFile = {
    "rofi/themes".source = "${rofi-themes-collection}/themes";
  };

  # Ensure icon theme is available
  home.packages = with pkgs; [
    papirus-icon-theme
  ];

  # Set GTK and icon theme
  gtk = {
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
}
