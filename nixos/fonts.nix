{ pkgs, ... }:

{
  # Fonts
  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-font-patcher

    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji

    fira-code
    fira-code-symbols
    
    liberation_ttf
  ];
}
