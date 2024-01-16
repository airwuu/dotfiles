{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  
  # Default fonts
  fonts.enableDefaultPackages = true;
  
  # Third party fonts
  fonts.packages = with pkgs; [
    jetbrains-mono

    nerdfonts
    nerd-font-patcher

    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji

    fira-code
    fira-code-symbols
    
    liberation_ttf
  ];
}
