{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      roboto
      inter

      comic-neue
 
      work-sans
      source-sans
 
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
 
      nerd-fonts.fira-code
      nerd-fonts.meslo-lg
    ];

    enableDefaultPackages = false;
  };
}
