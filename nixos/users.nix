{ pkgs, ... }:

{
  users.users.jess = {
    isNormalUser = true;
    description = "jess";
    
    extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" "docker" ];
    
    shell = pkgs.fish;

    packages = with pkgs; [
      spotify
      vesktop         # Discord w/ Vencord
      brave
      vscode

      rofi
      
      tdesktop

      bash
    ];
  };

  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";
}
