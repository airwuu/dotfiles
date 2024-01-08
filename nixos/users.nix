{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jess = {
    isNormalUser = true;
    description = "jess";
    extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" "docker" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      spotify
      discord
      tdesktop
      vscode
      brave
    ];
  };

  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";
}
